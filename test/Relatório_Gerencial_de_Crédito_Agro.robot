*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py


*** Test Cases ***
Solicitar Relatório Gerencial de Crédito Agro com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Relatório Gerencial de Crédito Agro
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Relatório Gerencial de Crédito Agro    ${CSV_RGCA}
    Clicar no botão    Próximo
    Clicar no botão    Próximo
    Clicar no botão    Próximo
    Clicar no botão    Concluir    
    Mensagem do front    Relatório solicitado com sucesso
    Fechar Browser
Solicitar Relatório Gerencial de Crédito Agro com arquivo de importação .csv vazio
    [Documentation]    Caso de teste para Solicitar Relatório Gerencial de Crédito Agro com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Relatório Gerencial de Crédito Agro    ${CSV_VAZIO}
    Mensagem do front    Não exitem documentos válidos no arquivo enviado 
    Fechar Browser

