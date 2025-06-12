*** Settings ***
Documentation     Executa casos de testes de solicitação de Análise Detalhada de Desmatamento
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py
*** Test Cases ***
Solicitar Análise Detalhada de Desmatamento | EUDR com Idioma Inglês
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento | EUDR
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Idioma   Inglês
    Selecionar Commodity    Café
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento | EUDR com Idioma Português
    [Documentation]    Caso de teste Solicitar Análise Detalhada de Desmatamento | EUDR em Português
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar Proprietário    126
    Selecionar Propriedade
    Selecionar Idioma   Português
    Selecionar Commodity    Café
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento | EUDR com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar csv    ${CSV_ADD_EUDR} 
    Clicar no botão Solicitar Relatório

Solicitar Análise Detalhada de Desmatamento | EUDR sem proprietário
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar Idioma   Inglês
    Selecionar Commodity    Café
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Item não adicionado
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento | EUDR sem propriedade
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento sem propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar Proprietário    126
    Selecionar Idioma   Inglês
    Selecionar Commodity    Café
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Item não adicionado
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Análise Detalhada de Desmatamento | EUDR sem commodity
    [Documentation]    Caso de teste para Solicitar Análise Detalhada de Desmatamento | EUDR 
    ...  sem Commodity, não deve ser possivel o envio
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Análise Detalhada de Desmatamento | EUDR
    Selecionar Proprietário    126
    Selecionar Idioma   Português
    Preencher Observacao
    Clicar no botão Solicitar Relatório
    Mensagem do front    Item não adicionado
    Mensagem do front    Relatórios não solicitados
    Fechar Browser
