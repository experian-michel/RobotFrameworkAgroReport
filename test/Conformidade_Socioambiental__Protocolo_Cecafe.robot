*** Settings ***
Documentation     This is the first Robot Framework test suite.
Resource          ../resources/resource.robot
Library           ../.venv/lib/python3.10/site-packages/robot/libraries/Telnet.py

*** Test Cases ***
Solicitar Conformidade Socioambiental | Protocolo Cecafe com arquivo de importação .csv
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Protocolo Cecafe com arquivo de importação .csv
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Conformidade Socioambiental | Protocolo Cecafe    ${CSV_CS_CECAFE} 
    Clicar no botão    Próximo
    Clicar no botão    Solicitar
    Mensagem do front    Relatórios solicitados com sucesso
    Fechar Browser  
Solicitar Conformidade Socioambiental | Protocolo Cecafe com arquivo de importação .csv vazio
    [Documentation]    Caso de teste para Solicitar Conformidade Socioambiental | Protocolo Cecafe com arquivo de importação .csv vazio
    [Tags]    automacao
    Login no Farm
    Acessar modulo AgroReport
    Selecionar card para upload     Conformidade Socioambiental | Protocolo Cecafe    ${CSV_VAZIO} 
    Mensagem do front    Não exitem documentos válidos no arquivo enviado
    Fechar Browser 

