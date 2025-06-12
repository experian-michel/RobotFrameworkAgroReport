*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Conformidade Socioambiental | Projetistas
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Projetistas
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | Projetistas
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | Projetistas com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Projetistas com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | Projetistas
    Selecionar csv    ${CSV_CSP}
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Conformidade Socioambiental | Projetistas sem proprietário
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Projetistas sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | Projetistas
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Conformidade Socioambiental | Projetistas sem Propriedade
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Projetistas sem Propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | Projetistas
    Selecionar Proprietário    126
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser


