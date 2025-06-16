# 📦 Projeto Banco de Dados – E-commerce

Este projeto simula um sistema de banco de dados para uma aplicação de e-commerce. Ele foi desenvolvido com foco em boas práticas de modelagem, normalização, uso de **procedures**, **views**, **triggers**, **transações** e **controle de acesso**, além de incluir scripts para **backup e recuperação** do banco.

---

## 🧰 Tecnologias Utilizadas

- MySQL 5.7+
- MySQL Workbench ou terminal
- mysqldump

---

## 📁 Estrutura do Projeto

- `ecommerce.sql`: criação do banco, tabelas e inserção de dados.
- `views.sql`: criação de views analíticas e administrativas.
- `procedures.sql`: procedures para manipulação de dados com lógica condicional.
- `triggers.sql`: triggers para histórico de alterações.
- `transactions.sql`: exemplos de transações com commit/rollback.
- `backup.sql`: backup do banco de dados gerado com mysqldump.
- `README.md`: documentação completa do projeto.

---

## 🧱 Funcionalidades

### 🔧 Estrutura do Banco

- Tabelas principais:
  - `clients`, `product`, `orders`, `employees`, `departments`, entre outras.
- Relacionamentos bem definidos com chaves estrangeiras.
- Inserção de dados simulando um ambiente real.

### 📊 Views

- Empregados por departamento e cidade.
- Gerentes e seus respectivos departamentos.
- Projetos com número de funcionários.
- Funcionários com dependentes e status de gerente.

### ⚙️ Procedures

- `sp_manage_clients`: procedure para operações de SELECT, INSERT, UPDATE e DELETE em clientes, usando parâmetro `p_action`.

### 🔁 Triggers

- Trigger BEFORE DELETE: salva informações em `deleted_clients_history` antes de excluir um cliente.
- Trigger BEFORE UPDATE: registra mudanças salariais em `salary_update_log`.

### 🔐 Controle de Acesso

- Usuário `gerente`: acesso total às views administrativas.
- Usuário `funcionario`: acesso limitado a informações básicas.

### 💸 Transações

- Transações manuais com `START TRANSACTION`, `COMMIT` e `ROLLBACK`.
- Exemplo de rollback em caso de erro dentro de uma procedure.

### 💾 Backup e Recovery

- Backup do banco `ecommerce` gerado com `mysqldump`.
- Script de restauração incluído no repositório.

---

## 🚀 Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/ecommerce-bd.git
   cd ecommerce-bd
