# Nubank Mobile Test

Aplicativo desenvolvido para o processo seletivo do **Nubank**, com o objetivo de encurtar URLs e exibir o histórico recente de links encurtados.

### Para rodar o projeto

1. Clone o repositório
2. Instale o flutter SDK definido no arquivo `.tool-versions`
3. Execute `flutter pub get`
4. Execute o build runner: `dart run build_runner watch --delete-conflicting-outputs`
5. Rode o app com `flutter run` ou usando as configurações do `launch.json` no VSCode

> **Stack principal:**

- Flutter
- Clean Architecture
- Domain Driven Design (regras de negócio isoladas)

## Decisões e possibilidades


1. Foi criado um módulo e um bloc para o histórico pois 
   1. Fica bem fácil de escalar para uma feature que salva o histórico em banco local
   2. Mantem a consistencia no gerenciamento de estado
2. Optei por conectar os repositórios diretamente nos UseCases para manter a simplicidade, mas poderia ter adicionado uma camada de serviços, bem como camadas de datasources (local e remote)
3. O package de design system foi criado para isolar componentes reutilizáveis e manter a consistência visual. Algumas possibilidades são:
   1. Criar um ThemeData centralizado
   2. Extrair o InputTextField para um componente reutilizável
   3. Aplicar tema claro e escuro com ThemeTailor
4. Optei por extrair as estring para `UIStrings`, mas poderia ter usado o intl diretamente
5. O projeto usa o package freezed para DTOs e estados imutáveis para diminuir boilerplate e aumentar a segurança de tipagem

Para todas essas possibilidades, tenho exemplos de projetos que ja implementam essas soluções.


## 🚀 Funcionalidades

- Encurtar URLs via API pública.
- Exibir lista dos links encurtados.
- Armazenamento temporário em memória.


## 🌐 API

Base URL: `https://url-shortener-server.onrender.com/api/alias`

**POST /api/alias**

```json
{ "url": "<url>" }
```

**Response**

```json
{
  "alias": "<url alias>",
  "_links": { "self": "<original>", "short": "<short>" }
}
```

**GET /api/alias/:id**

```json
{ "url": "<original url>" }
```

---

## 🏧 Arquitetura

Clean Architecture + Domain Driven Design + TDD.

```
lib/
└── src/
    ├── common/
    ├── modules/
    │   ├── shortener/
    │   └── history/
    ├── l10n/
    └── utils/
packages/
└── design_system/
```

### Camadas

- **Interface:** Pages, widgets, routes, GoRouter.
- **BLoC:** Gerenciamento de estado com flutter_bloc + freezed.
- **Domain:** UseCases, entidades, interfaces de repositório.
- **Infrastructure:** Repositórios concretos com Dio + DTOs Freezed.


## ⚙️ Tecnologias

| Categoria | Ferramenta                 |
| --------- | -------------------------- |
| Injeção   | Injectable                 |
| HTTP      | Dio                        |
| Estado    | flutter_bloc               |
| DTOs      | Freezed                    |
| Testes    | Flutter Test + Golden Test |
| Funcional | Either (dartz)             |


## 📘 Padrões

- Clean Arch + DDD
- Feature-first
- SOLID e Clean Code
- Sem warnings de lint


## 📄 Licença

Projeto criado exclusivamente para o **Nubank Mobile Take-Home Test**.
