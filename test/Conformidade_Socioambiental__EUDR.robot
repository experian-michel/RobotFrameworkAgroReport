*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Conformidade Socioambiental | EUDR idioma Inglês commodity Café
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Café
    Selecionar Idioma EUDR   Inglês
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Inglês commodity Soja
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Soja
    Selecionar Idioma EUDR   Inglês
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Inglês commodity Carne bovina
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Carne bovina
    Selecionar Idioma EUDR   Inglês
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Português commodity Café
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Café
    Selecionar Idioma EUDR   Português
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Português commodity Carne bovina
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Carne bovina
    Selecionar Idioma EUDR   Português
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Português commodity Soja
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Soja
    Selecionar Idioma EUDR   Português
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Conformidade Socioambiental | EUDR sem Proprietário
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR sem CPF
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Propriedade
    Selecionar Commodity EUDR    Soja
    Selecionar Idioma EUDR   Português
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR sem propriedade
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR sem propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Commodity EUDR    Soja
    Selecionar Idioma EUDR   Português
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR idioma Inglês sem commodity 
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Idioma EUDR   Inglês
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR sem idioma e com commodity 
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Commodity EUDR    Soja
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Conformidade Socioambiental | EUDR sem idioma Inglês com commodity 
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatórios não solicitados
    Fechar Browser


Solicitar Conformidade Socioambiental | EUDR com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Conformidade Socioambiental | EUDR
    Selecionar csv    ${CSV_CS_EUDR}   
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser