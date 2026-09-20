# 📱 Catálogo Pessoal — Flutter (Trabalho Final M1)

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![Licença](https://img.shields.io/badge/Licen%C3%A7a-MIT-green)

Aplicativo mobile desenvolvido em Flutter para gestão e consulta rápida de um catálogo pessoal local de itens e equipamentos. Projeto desenvolvido como avaliação final para a disciplina de **Desenvolvimento Mobile I** (Unilavras — 2º Semestre/2026).

---

## 👨‍💻 Autor

- **Nome:** Rafael Henrique de Oliveira Gomide
- **Matrícula:** 0032344
- **Instituição:** Unilavras — Centro Universitário de Lavras

---

## 🎯 Objetivo e Escopo

O aplicativo resolve a necessidade de organização, cadastro e consulta rápida de itens pessoais de forma inteiramente local, garantindo pleno funcionamento sem dependência de conectividade com a internet ou serviços em nuvem.

### Funcionalidades do Projeto
- **Lista/Grade Dinâmica:** Visualização responsiva da coleção de itens (1 coluna em telas estreitas, 2 colunas em telas amplas).
- **Estado Vazio (`EmptyStateWidget`):** Exibição de interface amigável e informativa quando a coleção não possui registros.
- **Tela de Detalhes (`DetailPage`):** Exibição das informações completas do item selecionado.
- **Formulário Validado (`FormPage`):** Validação de entrada de dados para impedir envios com campos em branco.
- **Criação e Edição:** Cadastro de novos itens e edição de itens existentes sem duplicação de dados (preservação do ID).
- **Gestão de Estado Reativa:** Implementada via `ValueNotifier` de forma nativa e imutável.

---

## 📁 Estrutura do Projeto

O código-fonte segue a separação clara de responsabilidades técnicas:

```text
lib/
├── controllers/
│   └── item_controller.dart    # Gerenciamento de estado com ValueNotifier
├── models/
│   └── item_model.dart         # Modelo de dados imutável do catálogo
├── theme/
│   └── app_theme.dart          # Configuração global de tema Material 3
├── views/
│   ├── detail_page.dart        # Tela de detalhes do item
│   ├── form_page.dart          # Formulário de criação e edição
│   └── home_page.dart          # Tela principal (lista/grade responsiva)
├── widgets/
│   ├── empty_state_widget.dart # Componente para estado vazio
│   └── item_card_widget.dart   # Card reutilizável de apresentação
└── main.dart                   # Ponto de entrada da aplicação
