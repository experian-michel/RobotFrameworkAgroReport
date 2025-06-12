*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Diagnóstico de Carteira | Soja em Desmatamento. idioma Inglês
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento.com  idioma Inglês
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Data do Corte Diagnóstico de Carteira    01/08/2024
    Selecionar Safra Diagnostico Carteira    2022/23
    Selecionar Idioma a   Inglês
    Selecionar Tipo Relatorio    Propriedades
    Preencher Propriedade Busca    MS-5002209-977045AB8743415BA276D1D84BD9BB94
    Clicar Solicitar relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Diagnóstico de Carteira | Soja em Desmatamento. idioma Português
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. com idioma Português
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Data do Corte Diagnóstico de Carteira    01/08/2024
    Selecionar Safra Diagnostico Carteira    2022/23
    Selecionar Idioma a   Português
    Selecionar Tipo Relatorio    Propriedades
    Preencher Propriedade Busca    MS-5002209-977045AB8743415BA276D1D84BD9BB94
    Clicar Solicitar relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Diagnóstico de Carteira | Soja em Desmatamento sem data de corte
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem data de corte
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Safra Diagnostico Carteira    2022/23
    Selecionar Idioma a   Inglês
    Selecionar Tipo Relatorio    Propriedades
    Preencher Propriedade Busca    MS-5002209-977045AB8743415BA276D1D84BD9BB94
    Clicar Solicitar relatório
    Validar Mensagem de Erro no Campo data de corte  Campo obrigatório
    Clicar no botão    Cancelar
    Fechar Browser
    

Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem ano da Safra
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem ano da Safra
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Data do Corte Diagnóstico de Carteira    01/08/2024
    Selecionar Idioma a   Inglês
    Selecionar Tipo Relatorio    Propriedades
    Preencher Propriedade Busca    MS-5002209-977045AB8743415BA276D1D84BD9BB94
    Clicar Solicitar relatório
    Validar Mensagem de Erro no Campo Safra   Campo obrigatório
    Clicar no botão    Cancelar
    Fechar Browser

Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem Idioma
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Data do Corte Diagnóstico de Carteira    01/08/2024
    Selecionar Safra Diagnostico Carteira    2022/23
    Selecionar Tipo Relatorio    Propriedades
    Preencher Propriedade Busca    MS-5002209-977045AB8743415BA276D1D84BD9BB94
    Clicar Solicitar relatório
    Validar Mensagem de Erro no Campo Idioma     Campo obrigatório
    Clicar no botão    Cancelar
    Fechar Browser

Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem Car
    [Documentation]    Caso de teste para Solicitar Diagnóstico de Carteira | Soja em Desmatamento. sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Diagnóstico de Carteira | Soja em Desmatamento.
    Selecionar Data do Corte Diagnóstico de Carteira    01/08/2024
    Selecionar Safra Diagnostico Carteira    2022/23
    Selecionar Idioma a   Inglês
    Selecionar Tipo Relatorio    Propriedades
    Clicar Solicitar relatório
    Mensagem do front    Selecione pelo menos uma propriedade
    Fechar Browser