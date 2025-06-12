*** Settings ***
Documentation     Executa casos de testes de solicitação de Análise Detalhada de Desmatamento
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py
*** Test Cases ***
Solicitar Análise Detalhada de Desmatamento
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Criterios Socioambientais - todos
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento
    Selecionar csv    ${CSV_ADD}
    Clicar no botão Solicitar Relatório

Solicitar Análise Detalhada de Desmatamento sem proprietário
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card    Análise Detalhada de Desmatamento
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento sem propriedade
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento sem propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento
    Selecionar Proprietário    126
    Selecionar Criterios Socioambientais - todos
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

