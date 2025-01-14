import RPi.GPIO as GPIO

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
        else:
            print("Pin " + str(pin) + " unbroken")
        



for pin in pinList:
    breakBeamPin(pin[0], pin[1])


