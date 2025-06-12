*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Relatório de Sinistro
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Relatório de Sinistro com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card    Relatório de Sinistro
    Selecionar csv    ${CSV_RS}
    Clicar no botão Solicitar Relatório
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Relatório de Sinistro sem proprietário
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem proprietário
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem propriedade
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem propriedade
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem Instituição Financeira
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem Instituição Financeira
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Relatório de Sinistro sem Responsável pela Instituição
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem Responsável pela Instituição
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Relatório de Sinistro sem Número da Apólice
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem Número da Apólice
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser

Solicitar Relatório de Sinistro sem data Safra
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem data Safra
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem area
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem area
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem Evento
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem Evento
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem data de plantio
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem data de plantio
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data da Ocorrência    01/10/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem data de ocorrência
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro sem data de ocorrência
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data do Aviso    01/12/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser

Solicitar Relatório de Sinistro sem data de aviso
    [Documentation]    Caso de teste para Solicitar Relatório de Sinistro
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card     Relatório de Sinistro
    Selecionar Proprietário    126
    Selecionar Propriedade
    Preenche Instituição Financeira    Banco do Brasil
    Preenche Responsável pela Instituição    Luiz
    Preenche Número da Apólice    123456789
    Selecionar Safra Relatorio Sinistro    1ª Safra 2017/2018
    Selecionar Cultura     Soja
    Selecionar area    150
    Selecionar Evento    Seca
    Selecionar Data do Plantio    22/05/2024
    Selecionar Data da Ocorrência    01/10/2024
    Clicar no botão Solicitar relatório
    Sleep    3s
    Mensagem do front    Relatórios não solicitados
    Fechar Browser