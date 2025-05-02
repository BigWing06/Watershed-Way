import socket
import time
import atexit
import keyboard

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

def sendMessage(event):
    if event.name == "a":
        message = "pin4broken"
        sock.sendall(message.encode())
        time.sleep(POLL_DELAY)
        
def onExit():
    sock.close()

keyboard.on_release(sendMessage)
atexit.register(onExit)
keyboard.wait()
