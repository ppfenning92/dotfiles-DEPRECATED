#!/usr/bin/python3
import smtplib

HOST = 'w0132edd.kasserver.com'
PORT = 587
USER = 'm0587411'
PASS = 'Cs2qsUQcE6ZpT4E8'
print(HOST, PORT)
mailserver = smtplib.SMTP(HOST, PORT)
print(mailserver.ehlo())
print(mailserver.starttls())
login_res = mailserver.login(USER, PASS)
print(login_res)
