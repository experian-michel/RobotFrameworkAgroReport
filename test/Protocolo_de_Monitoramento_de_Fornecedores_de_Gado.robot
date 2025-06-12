*** Settings ***
Documentation     Test suite Protocolo de Monitoramento de Fornecedores de Gado
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Protocolo de Monitoramento de Fornecedores de Gado
    [Documentation]    Caso de teste para Solicitar Protocolo de Monitoramento de Fornecedores de Gado
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Protocolo de Monitoramento de Fornecedores de Gado
    Selecionar Proprietário    126
    Selecionar Propriedade
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Protocolo de Monitoramento de Fornecedores de Gado com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Protocolo de Monitoramento de Fornecedores de Gado com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card    Protocolo de Monitoramento de Fornecedores de Gado
    Selecionar csv    ${CSV_PMFG}
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Protocolo de Monitoramento de Fornecedores de Gado sem Proprietário
    [Documentation]    Caso de teste para Solicitar Protocolo de Monitoramento de Fornecedores de Gado sem CPF
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Protocolo de Monitoramento de Fornecedores de Gado
    Clicar no botão Solicitar Relatório
    Mensagem do front    A propriedade está em um bioma inválido
    Fechar Browser

Solicitar Protocolo de Monitoramento de Fornecedores de Gado sem proprietário
    [Documentation]    Caso de teste para Solicitar Protocolo de Monitoramento de Fornecedores de Gado sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Protocolo de Monitoramento de Fornecedores de Gado
    Selecionar Proprietário    126
    Clicar no botão Solicitar Relatório
    Mensagem do front    A propriedade está em um bioma inválido
    Fechar Browser

