import socket
import time
import atexit   

SERVER_IP = "127.0.0.1"
SERVER_PORT = 2222
POLL_DELAY = .05

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

while True:
    try:
        sock.connect((SERVER_IP, SERVER_PORT))
        print("Server Connected")
        break
    except socket.error:
        print("Connection Failed: Retyring in 1 second")
        time.sleep(1)

def sendMessage(pin):
        message = pin + "\n"
        print(message)
        sock.sendall(message.encode())
        time.sleep(POLL_DELAY)
        
def onExit():
    sock.close()

atexit.register(onExit)
while True:
    if input("CMD: ") == " ":
        sendMessage(input("Num"))
