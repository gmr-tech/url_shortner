# Metodologia de Testes - URL Shortener

Este documento descreve a estratégia completa de testes para o projeto URL Shortener, seguindo os princípios de Clean Architecture e as melhores práticas de testing.

## 🎯 Objetivo

Garantir cobertura abrangente e qualidade dos testes, seguindo a ordem:
1. **Usos de Caso e Regras de Negócio**
2. **Repositórios**
3. **BLoCs**
4. **Widget Behavior**
5. **Widget Visual (Golden)**

## 📋 Princípios dos Testes

- **Padrão AAA**: Arrange, Act, Assert sempre que possível
- **Organização clara**: Agrupamento lógico com `group()` e `describe()`
- **Nomes descritivos**: O que está sendo testado e o resultado esperado
- **Mocks isolados**: Usar mocktail para dependências externas
- **Testes independentes**: Cada teste deve poder rodar isoladamente

## 🏗️ Estrutura de Pastas

```
test/
├── unit/                          # Testes unitários
│   ├── domain/
│   │   ├── use_cases/
│   │   ├── validators/
│   │   └── entities/
│   ├── infrastructure/
│   │   └── repositories/
│   ├── presentation/
│   │   └── blocs/
│   └── services/
├── widget/                        # Testes de widget
│   ├── behavior/
│   └── golden/
├── helpers/                       # Utilitários de teste
│   ├── test_data.dart
│   ├── pump_app.dart
│   └── mocks.dart
└── flutter_test_config.dart       # Configuração global
```

## 🧪 1. Usos de Caso e Regras de Negócio

### Foco
- `ShortenUrlUseCase`
- `InputUrlValidator` extension
- Entities (`InputUrl`, `ShortenedUrl`)

### Template Base
```dart
group('ShortenUrlUseCase', () {
  late MockShortenerRepository mockRepository;
  late ShortenUrlUseCase useCase;

  setUp(() {
    mockRepository = MockShortenerRepository();
    useCase = ShortenUrlUseCase(mockRepository);
  });

  group('call', () {
    group('when input is valid', () {
      test('should call repository and return success', () async {
        // Arrange
        const validUrl = InputUrl('https://example.com');
        final expectedResult = ShortenedUrl(/* ... */);
        when(() => mockRepository.shorten(validUrl))
            .thenAnswer((_) async => right(expectedResult));

        // Act
        final result = await useCase.call(validUrl);

        // Assert
        expect(result, equals(right(expectedResult)));
        verify(() => mockRepository.shorten(validUrl)).called(1);
      });
    });

    group('when input is invalid', () {
      test('should return failure without calling repository', () async {
        // Arrange
        const invalidUrl = InputUrl('invalid-url');

        // Act
        final result = await useCase.call(invalidUrl);

        // Assert
        expect(result, equals(left(const Failure.invalidInput())));
        verifyNever(() => mockRepository.shorten(any()));
      });
    });
  });
});
```

### Cenários Obrigatórios
- ✅ URL válida → sucesso
- ✅ URL inválida → `Failure.invalidInput()`
- ✅ Repository falha → propaga erro
- ✅ Edge cases (URL vazia, malformada)

## 🗄️ 2. Repositórios

### Foco
- `ShortenerRepositoryImpl`
- Integração com Dio
- Parsing de respostas API
- Tratamento de erros específicos

### Template Base
```dart
group('ShortenerRepositoryImpl', () {
  late MockDio mockDio;
  late ShortenerRepositoryImpl repository;

  setUp(() {
    mockDio = MockDio();
    repository = ShortenerRepositoryImpl(mockDio);
  });

  group('shorten', () {
    group('successful response', () {
      test('should parse API response correctly', () async {
        // Arrange
        final mockResponse = Response(
          data: {
            'alias': '123',
            '_links': {
              'self': 'https://example.com',
              'short': 'https://short.ly/abc123'
            }
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: '/'),
        );
        when(() => mockDio.post(any(), data: any(named: 'data')))
            .thenAnswer((_) async => mockResponse);

        // Act
        final result = await repository.shorten(const InputUrl('https://example.com'));

        // Assert
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (shortenedUrl) {
            expect(shortenedUrl.aliasId, equals(123));
            expect(shortenedUrl.shortUrl, equals('https://short.ly/abc123'));
          },
        );
      });
    });

    group('network errors', () {
      test('should return networkError for timeout', () async {
        // Arrange
        when(() => mockDio.post(any(), data: any(named: 'data')))
            .thenThrow(DioException(
              type: DioExceptionType.connectionTimeout,
              requestOptions: RequestOptions(path: '/'),
            ));

        // Act
        final result = await repository.shorten(const InputUrl('https://example.com'));

        // Assert
        expect(result, equals(left(const Failure.networkError())));
      });
    });
  });
});
```

### Cenários Obrigatórios
- ✅ Resposta válida → parsing correto
- ✅ Timeout → `Failure.networkError()`
- ✅ Server error (5xx) → `Failure.serverError()`
- ✅ Bad response (4xx) → `Failure.invalidData()`
- ✅ JSON malformado → `Failure.invalidData()`

## 🔄 3. BLoCs

### Foco
- `ShortenerBloc`
- `HistoryBloc`
- Transições de estado
- Integração com use cases

### Template Base (usando bloc_test)
```dart
group('ShortenerBloc', () {
  late MockShortenUrlUseCase mockUseCase;
  late ShortenerBloc bloc;

  setUp(() {
    mockUseCase = MockShortenUrlUseCase();
    bloc = ShortenerBloc(mockUseCase);
  });

  blocTest<ShortenerBloc, ShortenerState>(
    'emits [loading, success] when url is shortened successfully',
    build: () => bloc,
    arrange: () {
      when(() => mockUseCase.call(any()))
          .thenAnswer((_) async => right(tShortenedUrl));
    },
    act: (bloc) => bloc
      ..add(ShortenerEvent.addInput(inputUrl: tValidInputUrl))
      ..add(const ShortenerEvent.shorten()),
    expect: () => [
      ShortenerState.hasInput(inputUrl: tValidInputUrl),
      const ShortenerState.loading(),
      ShortenerState.success(shortenedUrl: tShortenedUrl),
    ],
    verify: (_) {
      verify(() => mockUseCase.call(tValidInputUrl)).called(1);
    },
  );
});
```

### Cenários Obrigatórios

**ShortenerBloc:**
- ✅ AddInput → `ShortenerHasInput`
- ✅ Shorten válido → loading → success
- ✅ Shorten inválido → loading → failure
- ✅ Shorten sem input → failure unexpected
- ✅ Reset → initial

**HistoryBloc:**
- ✅ Add primeiro item → HistoryUpdated
- ✅ Add múltiplos → ordem correta
- ✅ Remove item → lista atualizada
- ✅ Remove último → HistoryInitial

## 🎨 4. Widget Behavior Tests

### Foco
- `UrlInputField`
- `ShortenedLinkTile`
- `HeaderAndList`
- Interações e callbacks

### Template Base
```dart
group('UrlInputField Widget', () {
  late MockCallbacks mockCallbacks;

  setUp(() {
    mockCallbacks = MockCallbacks();
  });

  Widget createWidget({ShortenerState? state}) {
    return MaterialApp(
      home: Scaffold(
        body: UrlInputField(
          state: state ?? const ShortenerState.initial(),
          onChanged: mockCallbacks.onChanged,
          onFieldSubmitted: mockCallbacks.onFieldSubmitted,
          // ... outros callbacks
        ),
      ),
    );
  }

  testWidgets('calls onChanged when text changes', (tester) async {
    // Arrange
    await tester.pumpWidget(createWidget());

    // Act
    await tester.enterText(find.byType(TextFormField), 'https://example.com');
    await tester.pump();

    // Assert
    verify(() => mockCallbacks.onChanged('https://example.com')).called(1);
  });

  testWidgets('shows loading state correctly', (tester) async {
    // Arrange
    await tester.pumpWidget(createWidget(
      state: const ShortenerState.loading(),
    ));

    // Act
    await tester.pump();

    // Assert
    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.enabled, isFalse);
  });
});
```

### Cenários Obrigatórios
- ✅ Callbacks funcionando (onChange, onSubmit, onClear)
- ✅ Estados visuais (loading, error, success)
- ✅ Validação em tempo real
- ✅ Interações com clipboard
- ✅ Navegação e foco

## 🖼️ 5. Golden Tests (Visual)

### Foco
- Layout visual dos widgets
- Estados diferentes
- Responsividade

### Template Base (usando Alchemist)
```dart
void main() {
  group('Golden Tests', () {
    goldenTest(
      'UrlInputField displays correctly in different states',
      fileName: 'url_input_field_states',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'initial_state',
            child: MaterialApp(
              home: Scaffold(
                body: UrlInputField(
                  state: const ShortenerState.initial(),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'loading_state',
            child: MaterialApp(
              home: Scaffold(
                body: UrlInputField(
                  state: const ShortenerState.loading(),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'error_state',
            child: MaterialApp(
              home: Scaffold(
                body: UrlInputField(
                  state: ShortenerState.failure(
                    failure: const Failure.networkError(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
```

### Cenários Obrigatórios
- ✅ Estados principais dos widgets
- ✅ Lista vazia vs com itens
- ✅ Diferentes tamanhos de tela
- ✅ Estados de loading e erro

## 📦 Dependências Necessárias

```yaml
dev_dependencies:
  test: ^1.24.0
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.0
  mocktail: ^1.0.0
  alchemist: ^0.7.0
  integration_test:
    sdk: flutter
```

## 🎯 Métricas de Cobertura

| Camada | Meta de Cobertura | Justificativa |
|--------|------------------|---------------|
| Domain | 100% | Lógica de negócio crítica |
| Infrastructure | 95% | Exceto edge cases de sistema |
| BLoCs | 100% | State management crítico |
| Widgets | 85% | Behavior importante |
| **Overall** | **>90%** | Qualidade geral |

## 🛠️ Helpers e Utilitários

### test_data.dart
```dart
// Dados de teste reutilizáveis
const tValidInputUrl = InputUrl('https://example.com');
const tInvalidInputUrl = InputUrl('invalid-url');

final tShortenedUrl = ShortenedUrl(
  aliasId: 123,
  originalUrl: 'https://example.com',
  shortUrl: 'https://short.ly/abc123',
  createdAt: DateTime(2025, 1, 1),
);
```

### pump_app.dart
```dart
// Helper para pump widgets com dependências
Widget createAppWrapper({required Widget child}) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}
```

### mocks.dart
```dart
// Todos os mocks centralizados
class MockShortenerRepository extends Mock implements ShortenerRepository {}
class MockShortenUrlUseCase extends Mock implements ShortenUrlUseCase {}
class MockDio extends Mock implements Dio {}
// ... outros mocks
```

## 📋 Checklist de Implementação

### Fase 1: Setup
- [ ] Adicionar dependências de teste
- [ ] Criar estrutura de pastas
- [ ] Implementar helpers básicos

### Fase 2: Domain & Infrastructure
- [ ] Testes de use cases
- [ ] Testes de validators
- [ ] Testes de repositories

### Fase 3: Presentation
- [ ] Testes de BLoCs
- [ ] Testes behavior de widgets

### Fase 4: Visual
- [ ] Implementar golden tests
- [ ] Validar em diferentes dispositivos

### Fase 5: Finalização
- [ ] Verificar cobertura
- [ ] Documentar edge cases
- [ ] CI/CD integration

---

## 💡 Dicas Importantes

1. **Execute testes frequentemente** durante o desenvolvimento
2. **Mantenha mocks simples** e focados
3. **Use nomes descritivos** que expliquem o cenário
4. **Organize por funcionalidade**, não por tipo de teste
5. **Documente edge cases** e comportamentos específicos

Esta metodologia garante testes robustos, mantíveis e alinhados com a arquitetura clean do projeto!