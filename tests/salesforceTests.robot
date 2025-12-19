# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Create SF Record using API
    Login
    JwtAuthenticate        ${client_id}                ${username}                 ${privateKey}            sandbox=False
    ${LeadId}=             CreateRecord                Lead                        Salutation=Mr.           FirstName=Test    LastName=Lead    Company=Copado    Status=Working - Contacted
    GoToRecord             ${LeadId}
    UpdateRecord           Lead                        ${LeadId}                   FirstName= UpdatedName
    RefreshPage
    DeleteRecord           Lead                        ${LeadId}
    RefreshPage
    CloseAllBrowsers


