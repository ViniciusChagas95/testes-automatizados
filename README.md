# Projeto de Testes Automatizados para Microserviço "Catástrofes Ambientais"

Este projeto contém testes automatizados para validar as funcionalidades do microserviço "Catástrofes Ambientais", desenvolvido em Java e rodando em um ambiente Docker. Os testes foram implementados utilizando BDD (Behavior Driven Development) com Gherkin e Cucumber.

## Pré-requisitos

Antes de iniciar a configuração e execução dos testes, certifique-se de ter as seguintes ferramentas instaladas:
- **Java 17 ou superior**
- **Maven**
- **Docker e Docker Compose**
- **Git**

## Configuração do Ambiente

1. **Clone o repositório do projeto de testes**:
   ```bash
   git clone https://github.com/usuario/projeto-testes-automatizados.git
   cd projeto-testes-automatizados
   ```

2. **Certifique-se de que o projeto principal "Catástrofes Ambientais" está disponível como uma imagem Docker**. Caso contrário, construa a imagem manualmente:
   ```bash
   cd ../caminho-para-o-projeto-catastrofes-ambientais
   docker build -t catastrofes-ambientais:latest .
   ```

3. **Volte para o projeto de testes**:
   ```bash
   cd ../projeto-testes-automatizados
   ```

## Executar os Testes Localmente

### Inicializar o projeto principal

1. **Inicie o projeto principal com Docker Compose**:
   Certifique-se de que o arquivo `docker-compose.yml` esteja configurado corretamente na raiz do projeto de testes. Em seguida, execute:
   ```bash
   docker-compose up -d
   ```

2. **Aguarde alguns segundos** para garantir que o projeto principal esteja completamente inicializado:
   ```bash
   sleep 30
   ```

### Executar os Testes

1. **Compile o projeto de testes sem rodar os testes ainda**:
   ```bash
   mvn install -DskipTests
   ```

2. **Execute os testes**:
   ```bash
   mvn test
   ```

3. **Verifique os resultados**:
   Os relatórios dos testes serão gerados em `target/surefire-reports/`.

### Parar os Contêineres Docker

1. **Após a execução dos testes, encerre os contêineres**:
   ```bash
   docker-compose down
   ```

## Executar os Testes em um Pipeline de CI/CD

### Configuração do GitHub Actions

Certifique-se de que o arquivo `pipeline-ci.yml` (ou qualquer nome que você tenha dado) esteja presente na pasta `.github/workflows/` do repositório. O pipeline inclui etapas para:

- Fazer o checkout do código do projeto de testes.
- Configurar o JDK.
- Compilar e rodar os testes.
- Publicar os relatórios de testes como artefatos.

### Executar o Pipeline

1. **Faça um push** das alterações para a branch `main` ou crie um pull request para acionar o pipeline automaticamente.
2. **Verifique a aba Actions** no GitHub para acompanhar a execução do pipeline.

## Estrutura do Projeto

```
projeto-testes-automatizados/
|-- .github/
|   |-- workflows/
|       |-- pipeline-ci.yml
|-- src/
|   |-- test/
|       |-- java/
|           |-- steps/
|               |-- CatastrofeSteps.java
|       |-- resources/
|           |-- features/
|               |-- catastrofes.feature
|           |-- contracts/
|               |-- catastrofe_schema.json
|-- docker-compose.yml
|-- README.md
|-- pom.xml
```

## Notas Finais

- Certifique-se de que todas as dependências estão corretamente definidas no arquivo `pom.xml`.
- Verifique a documentação do `docker-compose.yml` para garantir que os serviços estão configurados de acordo com suas necessidades.
