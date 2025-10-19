# Nubank Mobile Test

Aplicativo desenvolvido para o processo seletivo do **Nubank**, com o objetivo de encurtar URLs e exibir o histórico recente de links encurtados.

> **Stack principal:**

- Flutter
- Clean Architecture
- Domain Driven Design (regras de negócio fortes)
- Test Driven Development


## 🚀 Funcionalidades

- Encurtar URLs via API pública.
- Exibir lista dos links encurtados.
- Armazenamento temporário em memória.
- Suporte a PT-BR e EN-US.


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
    │   ├── shorten/
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
| Navegação | GoRouter                   |
| DTOs      | Freezed                    |
| Testes    | Flutter Test + Golden Test |
| Funcional | Either (dartz)             |
| i18n      | l10n                       |


## 🧪 Testes

Cobertura para:

- UseCases e repositórios (unit tests).
- Widgets principais (golden tests).

Executar:

```bash
flutter test
```


## ▶️ Execução

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```


## 📘 Padrões

- Clean Arch + DDD + TDD
- Feature-first
- SOLID e Clean Code
- Sem warnings de lint


## 📄 Licença

Projeto criado exclusivamente para o **Nubank Mobile Take-Home Test**.
