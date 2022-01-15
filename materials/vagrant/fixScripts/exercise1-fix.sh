#!/bin/bash
#it will work also using just "ip route del 208.86.224.90"
ip route del 208.86.224.90/32   dev enp0s8 src 192.168.100.10

