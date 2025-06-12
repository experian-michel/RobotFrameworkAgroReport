*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Diagnóstico de Carteira via arquivo csv CPF/CNPJ
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira 
    Selecionar Método de Solicitação    BATCH
    Selecionar csv    ${CSV_DC_CPF_CNPJ}
    Clicar no botão    Solicitar
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Diagnóstico de Carteira via arquivo csv CAR
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira
    Selecionar Método de Solicitação    BATCH
    Selecionar Area de Interesse    Código CAR
    Selecionar csv    ${CSV_DC_CAR}
    Clicar no botão    Solicitar
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Baixar CSV de Exemplo "CPF/CNPJ" Diagnóstic" de Carteira
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. com idioma Português
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira 
    Selecionar Método de Solicitação    BATCH
    Clicar Botao Baixar CSV Exemplo
    Clicar no botão    Cancelar
    Fechar Browser

Baixar CSV de Exemplo "Codigo CAR" Diagnóstico de Carteira
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. com idioma Português
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira 
    Selecionar Método de Solicitação    BATCH
    Selecionar Area de Interesse    Código CAR
    Clicar Botao Baixar CSV Exemplo
    Clicar no botão    Cancelar
    Fechar Browser

Tentar solicitar relatório de Diagnóstico de Carteira com arquivo inválido
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira 
    Selecionar Método de Solicitação    BATCH
    Selecionar csv    ${CSV_DC_CAR}
    Clicar no botão    Solicitar
    Mensagem do front    Documento inválido
    Fechar Browser


