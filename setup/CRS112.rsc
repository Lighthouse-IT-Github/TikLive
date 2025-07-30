/interface bridge
add auto-mac=yes name=bridge-local
/interface bridge port
add bridge=bridge-local interface=ether1
add bridge=bridge-local interface=ether2
add bridge=bridge-local interface=ether3
add bridge=bridge-local interface=ether4
add bridge=bridge-local interface=ether5
add bridge=bridge-local interface=ether6
add bridge=bridge-local interface=ether7
add bridge=bridge-local interface=ether8
add bridge=bridge-local interface=sfp9
add bridge=bridge-local interface=sfp10
add bridge=bridge-local interface=sfp11
add bridge=bridge-local interface=sfp12
/interface ethernet
set [ find default-name=ether1 ] loop-protect=on
set [ find default-name=ether2 ] loop-protect=on
set [ find default-name=ether3 ] loop-protect=on
set [ find default-name=ether4 ] loop-protect=on
set [ find default-name=ether5 ] loop-protect=on
set [ find default-name=ether6 ] loop-protect=on
set [ find default-name=ether7 ] loop-protect=on
set [ find default-name=ether8 ] loop-protect=on
set [ find default-name=sfp9 ] loop-protect=on
set [ find default-name=sfp10 ] loop-protect=on
set [ find default-name=sfp11 ] loop-protect=on
set [ find default-name=sfp12 ] loop-protect=on
/ip dns
set servers=1.1.1.1,8.8.8.8
/system clock
set time-zone-name=America/Chicago
/system logging
set 0 action=Info
set 1 action=Error
set 2 action=Warning
set 3 action=Critical
/system logging action
set 1 disk-file-count=30
add disk-file-count=20 disk-file-name=ErrorLog name=Error target=disk
add disk-file-count=10 disk-file-name=CriticalLog name=Critical target=disk
add disk-file-count=10 disk-file-name=WarningLog name=Warning target=disk
add disk-file-count=10 disk-file-name=Infolog name=Info target=disk
