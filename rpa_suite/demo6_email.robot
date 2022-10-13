*** Settings ***
Library         RPA.Email.ImapSmtp


*** Tasks ***
Sending email
    Authorize    account=bala@gmail.com   
    ...    password=123456    
    ...    smtp_server=smtp.gmail.com    
    ...    smtp_port=587
    ...    imap_server=imap.gmail.com
    ...    imap_port=993

    Send Message    sender=bala@gmail.com 
    ...    recipients=bala123@gmail.com 
    ...    subject=Message from RPA Robot
    ...    body=RPA Robot message body
    ...    attachments=${EXECDIR}${/}files${/}data.json
