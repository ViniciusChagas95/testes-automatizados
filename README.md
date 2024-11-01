
# Projeto de Testes Automatizados para "Catástrofes Ambientais"

Este projeto contém testes automatizados para validar as funcionalidades do microserviço "Catástrofes Ambientais", desenvolvido em Java.

## Pré-requisitos
- **Java 17 ou superior**
- **Maven**
- **Docker e Docker Compose**
- **Git**

## Configuração e Execução

### Passos para Configuração

1. **Clone o projeto principal e construa a imagem Docker**:
   ```bash
   git clone https://github.com/ViniciusChagas95/catastrofes-ambientais.git
   cd catastrofes-ambientais
   docker build -t catastrofes-ambientais:latest .
   cd ..
   ```

2. **Clone o projeto de testes**:
   ```bash
   git clone https://github.com/ViniciusChagas95/catastrofes-ambientais
   cd c:\pasta-projeto\catastrofes-ambientais
   ```

### Passos para Execução dos Testes

1. **Inicie o projeto principal com Docker Compose**:
   ```bash
   docker-compose up -d
   sleep 30  # Aguarde a inicialização
   ```

2. **Compile o projeto de testes**:
   ```bash
   mvn install -DskipTests
   ```

3. **Execute os testes**:
   ```bash
   mvn test
   ```

4. **Encerre os contêineres após os testes**:
   ```bash
   docker-compose down
   ```

## Configuração do CI/CD

### GitHub Actions
- Inclua o arquivo `pipeline-ci.yml` em `.github/workflows/` do projeto de testes para automação com GitHub Actions.
- O pipeline deve fazer checkout do código, configurar o JDK, compilar e rodar os testes, e publicar relatórios.

### Exemplo de `pipeline-ci.yml`

```yaml
name: CI/CD para Testes Automatizados em Java

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout do Código
      uses: actions/checkout@v3

    - name: Configurar JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: '21'
        distribution: 'adopt'

    - name: Build do Projeto com Maven
      run: mvn install -DskipTests

    - name: Instalar Docker Compose
      run: |
        sudo apt-get update
        sudo apt-get install -y docker-compose

    - name: Iniciar Docker Compose
      run: docker-compose up -d

    - name: Aguardar 30 segundos
      run: sleep 30

    - name: Executar Testes
      run: mvn test

    - name: Publicar Relatórios de Teste
      if: always()
      uses: actions/upload-artifact@v3
      with:
        name: relatorios-de-testes
        path: target/surefire-reports/

    - name: Parar Docker Compose
      run: docker-compose down
```

## Notas Finais

- Verifique se todas as dependências estão corretas no `pom.xml`.
- Confirme que o `docker-compose.yml` está configurado conforme suas necessidades.

