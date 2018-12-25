from picamera import PiCamera
from time import sleep
import datetime


camera = PiCamera()
camera.start_preview()
for i in range(5):
    sleep(5)
    camera.capture('./web/image%s.jpg' % datetime.datetime.now().isoformat())
    camera.stop_preview()

