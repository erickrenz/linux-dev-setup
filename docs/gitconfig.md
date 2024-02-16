# ~/.gitconfig for kernel development

If you use gmail, then simply add the following `[sendemail]` template to your ~/.gitconfig file:

```yml
[user]
    name = <name>
    email = <email>
[sendemail]
    smtpserver = smtp.gmail.com
    smtpserverport = 587
    smtpencryption = tls
    smtpuser = <username>
    smtppass = <password>
```
