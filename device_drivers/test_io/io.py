#!/user/bin/python
import RPi.GPIO as io
import time

io.setmode(io.BCM)
led = 27

io.setwarnings(False)
io.setup(led, io.OUT)


while 1:
	io.output(led, True)
	time.sleep(1)
	io.output(led, False)
	time.sleep(1)
