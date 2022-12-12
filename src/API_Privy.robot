*** Settings ***
Library               RequestsLibrary
Library               String

*** Variables ***
${user_id}      AWO7813
${grub_id}      alfin grub
${token}        token1234
${base_url}     http://pretest-qa.dcidev.id/documentation/v1#
${Request_url}  http://pretest-qa.dcidev.id
${Image_Upload} GET FILE


*** Test Cases ***

Quick Get Request Test
    ${response}=    GET   ${base_url}

TC1_message : Operations about messages
    ${response}=   GET   ${Request_url}/api/v1/message/${user_id}  params=Authorization=asdwsxxxawda, params=user_id=${user_id}   expected_status=200
    ${response}=   POST   ${Request_url}/api/v1/message/send  params=Authorization=asdwsxxxawda, params=user_id=${user_id}, params=message=API automation   expected_status=201

TC2_notification : Operations about notifications
    ${response}=   POST   ${Request_url}/api/v1/notification/${grub_id}/${token}  params=grub_id=${grub_id}, params=token=${token}   expected_status=201

TC3_oauth : Operations about oauths
    ${response}=   GET   ${Request_url}/api/v1/oauth/credentials  params=access_token=auhusdaw22xxx   expected_status=200
    ${response}=   POST   ${Request_url}/api/v1/oauth/sign_in  params=phone=0898547878888, params=password=APIPrivyID, params=latlong, params=device_token, params=device_type=1   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/oauth/revoke  params=access_token=auhusdaw22xxx   expected_status=201

TC4_profile : Operations about profiles
    ${response}=   POST   ${Request_url}/api/v1/profile/career  params=Authorization=auhusdaw22xxx, params=position=QA Engineer, params=company_name=LandX, params=starting_from=12-12-2022, params=ending_in=12-12-2023   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/profile/education  params=Authorization=auhusdaw22xxx, params=school_name=SMK 3 Yogyakarta, params=graduation_time=12-12-2022   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/profile/profile  params=Authorization=auhusdaw22xxx, params=name=alfin wicaksono, params=gender=1, params=birthday=12-12-2022, params=hometown=Yogyakarta, params=bio=aku ganteng makasih   expected_status=201
    ${response}=   GET   ${Request_url}/api/v1/profile/profile/me  params=Authorization=auhusdaw22xxx   expected_status=200

TC5_register : Operations about registers
    ${response}=   POST   ${Request_url}/api/v1/register/remove  params=phone=08955547741   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/register/otp/request  params=phone=08955547741   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/register/otp/match  params=user_id=${user_id}, params=otp_code=55223   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/register  params=phone=0895468487865, params=password=KapanOnePieceTamat, params=country=Indonesia, params=latlong=zxcwssss, params=device_token=android17, params=device_type=1   expected_status=201

TC6_uploads : Operations about uploads
    ${response}=   POST   ${Request_url}/api/v1/uploads/cover  params=Authorization=awdsa2asxs, params=image=N:\Privy_Test\image jmeter\dw.png   expected_status=201
    ${response}=   POST   ${Request_url}/api/v1/uploads/profile/default  params=Authorization=awdsa2asxs, params=id=ssxawsdaw   expected_status=201
    ${response}=   DELETE   ${Request_url}/api/v1/uploads/profile  params=Authorization=awdsa2asxs, params=id=ssxawsdaw   expected_status=204
    ${response}=   POST   ${Request_url}/api/v1/uploads/profile  params=Authorization=awdsa2asxs, params=image=N:\Privy_Test\image jmeter\dw.png   expected_status=201

# Quick Get A JSON Body Test
#     ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
#     Should Be Equal As Strings    1  ${response.json()}[id]