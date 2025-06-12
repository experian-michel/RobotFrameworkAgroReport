*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library         ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Conformidade Socioambiental
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Todos os Criterios Socioambientais
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Conformidade Socioambiental com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental
    Selecionar csv    ${CSV_CS}
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental sem CPF
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental sem CPF
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental
    Selecionar Todos os Criterios Socioambientais
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser


Solicitar Conformidade Socioambiental sem proprietário
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental
    Selecionar Todos os Criterios Socioambientais
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser
