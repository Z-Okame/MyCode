from pwn import remote

HOST = "2048.challs.olicyber.it"
PORT = 10007

conn = remote(HOST, PORT)