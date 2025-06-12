*** Settings ***
Documentation     Executa casos de testes de solicitação de Certificação RenovaBio
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Certificação RenovaBio - Monitoramento
    [Documentation]    Caso de teste para Solicitar Certificação RenovaBio - Monitoramento
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload    Certificação RenovaBio    ${CSV_RenovaBio}
    Selecionar Opção RenovaBio    Monitoramento
    Sleep    1s
    Clicar no botão    Próximo
    Clicar no botão    Concluir
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Certificação RenovaBio - Certificação
    [Documentation]    Caso de teste para Solicitar Certificação RenovaBio com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload    Certificação RenovaBio    ${CSV_RenovaBio}
    Selecionar Opção RenovaBio    Certificação
    Sleep    1s
    Clicar no botão    Próximo
    Clicar no botão    Concluir
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Certificação RenovaBio sem CPF
    [Documentation]    Caso de teste para Solicitar Certificação RenovaBio sem CPF
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card    Certificação RenovaBio
    Clicar Botao Baixar CSV Exemplo
    Sleep    2s
    Fechar Browser

Solicitar Certificação RenovaBio com arquivo .csv vazio
    [Documentation]    Caso de teste para tentar solicitar Certificação RenovaBio com arquivo vazio
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload    Certificação RenovaBio    ${CSV_VAZIO}
    Selecionar Opção RenovaBio    Certificação
    Sleep    1s
    Clicar no botão    Próximo
    Mensagem do front    Não exitem documentos válidos no arquivo enviado
    Fechar Browser
