# AgroReport Robot Framework

Automação de testes para o sistema AgroReport utilizando Robot Framework e SeleniumLibrary.
![Build Status](https://img.shields.io/badge/build-passing-brightgreen) [![Jenkins](https://img.shields.io/jenkins/build?jobUrl=https://SEU_JENKINS/job/SEU_JOB/)](https://SEU_JENKINS/job/SEU_JOB/)

## Estrutura do Projeto

- `resources/`: arquivos de keywords e variáveis reutilizáveis
- `tests/`: arquivos de teste (suites)
- `data/`: arquivos de dados de entrada (CSV, etc)
- `results/`: logs e relatórios gerados após execução

## Como executar localmente

1. Instale as dependências:
    ```
    pip install -r requirements.txt
    ```

2. Execute todos os testes:
    ```
    robot -d results tests/
    ```

## Como executar no Jenkins

O projeto já possui um Jenkinsfile pronto para CI/CD.

## Contribuição

- Mantenha as keywords e variáveis organizadas em `resources/`
- Não versionar arquivos da pasta `results/` nem `.venv/`
- Documente suas keywords e testes

## Variáveis de ambiente

Configure as variáveis de ambiente antes de rodar os testes:

```
export USER=seu_usuario
export PASS=sua_senha
```