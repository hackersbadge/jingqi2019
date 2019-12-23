import socket
import time

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

s.bind(("192.168.1.2", 37540)) 
s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

network = '<broadcast>'

while True:
    s.sendto("BREED:ABORT", (network, 37541))
    time.sleep(0.1)
