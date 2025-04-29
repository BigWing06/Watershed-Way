import RPi.GPIO as GPIO
import socket
import time
import atexit

SERVER_IP = "localHost"
SERVER_PORT = 2222
POLL_DELAY = .05

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

while True:
    try:
        socket.connect((SERVER_IP, SERVER_PORT))
        print("Server Connected")
        break
    except socket.error:
        print("Connection Failed: Retyring in 1 second")
        time.sleep(1)

pinList = ((18, "a"))
GPIO.setmode(GPIO.BCM)
class breakBeamPin():
    def __init__(self, pin, key):
        self.pin = pin
        self.key = key
        GPIO.setup(self.pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        GPIO.add_event_detect(self.pin, GPIO.BOTH, callback=self.onBeamBreak)
    def onBeamBreak(self):
        if GPIO.input(self.pin):
            print("Pin " + str(pin) + " broken")
            message = str(self.pin)+"\n"
            sock.sendall(message.encode())
            time.sleep(POLL_DELAY)
        else:
            print("Pin " + str(pin) + " unbroken")
        
def onExit():
    sock.close()
    GPIO.cleanup()


for pin in pinList:
    breakBeamPin(pin[0], pin[1])

atexit.register(onExit)
