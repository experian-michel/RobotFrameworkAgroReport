*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Valoração de Imóveis Rurais
    [Documentation]    Caso de teste para Solicitar Valoração de Imóveis Rurais
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Valoração de Imóveis Rurais
    Selecionar Proprietário    126
    Selecionar Propriedade
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Valoração de Imóveis Rurais com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Valoração de Imóveis Rurais com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Valoração de Imóveis Rurais
    Selecionar csv    ${CSV_VIR}
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Valoração de Imóveis Rurais sem proprietário
    [Documentation]    Caso de teste para Solicitar Valoração de Imóveis Rurais sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Valoração de Imóveis Rurais
    Selecionar Propriedade
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Valoração de Imóveis Rurais sem propriedade
    [Documentation]    Caso de teste para Solicitar Valoração de Imóveis Rurais sem propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Valoração de Imóveis Rurais
    Selecionar Proprietário    126
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser
