/interface bridge
add auto-mac=yes name=bridge-local-local
/interface bridge port
add bridge=bridge-local interface=ether1
add bridge=bridge-local interface=ether2
add bridge=bridge-local interface=ether3
add bridge=bridge-local interface=ether4
add bridge=bridge-local interface=ether5
add bridge=bridge-local interface=ether6
add bridge=bridge-local interface=ether7
add bridge=bridge-local interface=ether8
add bridge=bridge-local interface=ether9
add bridge=bridge-local interface=ether10
add bridge=bridge-local interface=ether11
add bridge=bridge-local interface=ether12
add bridge=bridge-local interface=ether13
add bridge=bridge-local interface=ether14
add bridge=bridge-local interface=ether15
add bridge=bridge-local interface=ether16
add bridge=bridge-local interface=ether17
add bridge=bridge-local interface=ether18
add bridge=bridge-local interface=ether19
add bridge=bridge-local interface=ether20
add bridge=bridge-local interface=ether21
add bridge=bridge-local interface=ether22
add bridge=bridge-local interface=ether23
add bridge=bridge-local interface=ether24
add bridge=bridge-local interface=ether25
add bridge=bridge-local interface=ether26
add bridge=bridge-local interface=ether27
add bridge=bridge-local interface=ether28
add bridge=bridge-local interface=ether29
add bridge=bridge-local interface=ether30
add bridge=bridge-local interface=ether31
add bridge=bridge-local interface=ether32
add bridge=bridge-local interface=ether33
add bridge=bridge-local interface=ether34
add bridge=bridge-local interface=ether35
add bridge=bridge-local interface=ether36
add bridge=bridge-local interface=ether37
add bridge=bridge-local interface=ether38
add bridge=bridge-local interface=ether39
add bridge=bridge-local interface=ether40
add bridge=bridge-local interface=ether41
add bridge=bridge-local interface=ether42
add bridge=bridge-local interface=ether43
add bridge=bridge-local interface=ether44
add bridge=bridge-local interface=ether45
add bridge=bridge-local interface=ether46
add bridge=bridge-local interface=ether47
add bridge=bridge-local interface=ether48
add bridge=bridge-local interface=qsfpplus1-1
add bridge=bridge-local interface=qsfpplus1-2
add bridge=bridge-local interface=qsfpplus1-3
add bridge=bridge-local interface=qsfpplus1-4
add bridge=bridge-local interface=qsfpplus2-1
add bridge=bridge-local interface=qsfpplus2-2
add bridge=bridge-local interface=qsfpplus2-3
add bridge=bridge-local interface=qsfpplus2-4
add bridge=bridge-local interface=sfp-sfpplus1
add bridge=bridge-local interface=sfp-sfpplus2
add bridge=bridge-local interface=sfp-sfpplus3
add bridge=bridge-local interface=sfp-sfpplus4
/interface ethernet
set [ find default-name=ether1 ] loop-protect=on
set [ find default-name=ether2 ] loop-protect=on
set [ find default-name=ether3 ] loop-protect=on
set [ find default-name=ether4 ] loop-protect=on
set [ find default-name=ether5 ] loop-protect=on
set [ find default-name=ether6 ] loop-protect=on
set [ find default-name=ether7 ] loop-protect=on
set [ find default-name=ether8 ] loop-protect=on
set [ find default-name=ether9 ] loop-protect=on
set [ find default-name=ether10 ] loop-protect=on
set [ find default-name=ether11 ] loop-protect=on
set [ find default-name=ether12 ] loop-protect=on
set [ find default-name=ether13 ] loop-protect=on
set [ find default-name=ether14 ] loop-protect=on
set [ find default-name=ether15 ] loop-protect=on
set [ find default-name=ether16 ] loop-protect=on
set [ find default-name=ether17 ] loop-protect=on
set [ find default-name=ether18 ] loop-protect=on
set [ find default-name=ether19 ] loop-protect=on
set [ find default-name=ether20 ] loop-protect=on
set [ find default-name=ether21 ] loop-protect=on
set [ find default-name=ether22 ] loop-protect=on
set [ find default-name=ether23 ] loop-protect=on
set [ find default-name=ether24 ] loop-protect=on
set [ find default-name=ether25 ] loop-protect=on
set [ find default-name=ether26 ] loop-protect=on
set [ find default-name=ether27 ] loop-protect=on
set [ find default-name=ether28 ] loop-protect=on
set [ find default-name=ether29 ] loop-protect=on
set [ find default-name=ether30 ] loop-protect=on
set [ find default-name=ether31 ] loop-protect=on
set [ find default-name=ether32 ] loop-protect=on
set [ find default-name=ether33 ] loop-protect=on
set [ find default-name=ether34 ] loop-protect=on
set [ find default-name=ether35 ] loop-protect=on
set [ find default-name=ether36 ] loop-protect=on
set [ find default-name=ether37 ] loop-protect=on
set [ find default-name=ether38 ] loop-protect=on
set [ find default-name=ether39 ] loop-protect=on
set [ find default-name=ether40 ] loop-protect=on
set [ find default-name=ether41 ] loop-protect=on
set [ find default-name=ether42 ] loop-protect=on
set [ find default-name=ether43 ] loop-protect=on
set [ find default-name=ether44 ] loop-protect=on
set [ find default-name=ether45 ] loop-protect=on
set [ find default-name=ether46 ] loop-protect=on
set [ find default-name=ether47 ] loop-protect=on
set [ find default-name=ether48 ] loop-protect=on
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
