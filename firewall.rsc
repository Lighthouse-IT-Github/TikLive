/ip firewall connection tracking
set enabled=yes udp-stream-timeout=30m udp-timeout=3m
/ip neighbor discovery-settings
set discover-interface-list=!WAN
/ip settings
set max-neighbor-entries=16384
/ipv6 settings
set disable-ipv6=yes max-neighbor-entries=16384
/ip firewall address-list
add address=104.20.209.20 list=pastebin
add address=104.20.208.21 list=pastebin
add address=pastebin.com list=pastebin
/ip firewall filter
add action=drop chain=input comment="Drop Port Scanners" disabled=yes in-interface-list=WAN psd=15,10s,5,3 src-address-list=!voip
add action=drop chain=input comment="Drop Winbox except Local/Lighthouse" disabled=yes dst-port=8291 in-interface=!bridge-local protocol=tcp src-address-list=!voip
add action=accept chain=input comment="Allow SNMP to Lighthouse" disabled=yes dst-port=161-162 in-interface-list=WAN protocol=udp src-address-list=voip
add action=drop chain=input comment="Drop Other RouterOS ports" disabled=yes dst-port=8443,8080,8728,8729,3128,2000 in-interface=!bridge-local protocol=tcp src-address-list=!voip
add action=accept chain=forward comment="Allow Whitelisted IPs" disabled=yes dst-address-list=Whitelist
add action=drop chain=input comment="Drop Outside DNS Requests" disabled=yes dst-port=53 in-interface-list=WAN protocol=udp
add action=drop chain=input disabled=yes dst-port=53 in-interface-list=WAN protocol=tcp
add action=drop chain=input comment="Drop Inbound Commonly Attacked Ports" disabled=yes dst-port=69,111,135,137-139,161-162,445,514,2049,12345-12346,20034,3133 in-interface-list=WAN protocol=tcp src-address-list=!LAN
add action=drop chain=input disabled=yes dst-port=69,111,135,137-139,161-162,445,514,2049,12345-12346,20034,3133 in-interface-list=WAN protocol=udp src-address-list=!LAN
add action=drop chain=forward disabled=yes dst-port=69,111,135,137-139,161-162,445,514,2049,12345-12346,20034,3133 in-interface-list=WAN protocol=tcp src-address-list=!LAN
add action=drop chain=forward disabled=yes dst-port=69,111,135,137-139,161-162,445,514,2049,12345-12346,20034,3133 in-interface-list=WAN protocol=udp src-address-list=!LAN
add action=drop chain=input comment="Drop Private IPs from WAN - Anti Spoofing" disabled=yes dst-address-list=AntiSpoof in-interface-list=WAN src-address-list=!LAN
add action=drop chain=forward comment="Drop Outbound Tor Node" disabled=yes dst-address-list=TorNode out-interface-list=WAN
add action=drop chain=forward comment="Drop Outbound Pastebin" disabled=yes dst-address-list=pastebin out-interface-list=WAN
add action=drop chain=forward comment="Drop Outbound Malware" disabled=yes dst-address-list=Malware out-interface-list=WAN
add action=drop chain=forward comment="Drop Outbound Russia" disabled=yes dst-address-list="ru zone" out-interface-list=WAN
add action=drop chain=forward comment="Drop Outbound China" disabled=yes dst-address-list="cn zone" out-interface-list=WAN
add action=drop chain=forward comment="Drop Outbound RDP" disabled=yes out-interface-list=WAN protocol=rdp
add action=drop chain=forward comment="Drop Outbound MS RPC" disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=tcp src-port=135
add action=drop chain=forward disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=udp src-port=135
add action=drop chain=forward comment="Drop Outbound NetBOIS/IP" disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=tcp src-port=137-139
add action=drop chain=forward disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=udp src-port=137-139
add action=drop chain=forward comment="Drop Outbound SMB/IP" disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=tcp src-port=445
add action=drop chain=forward comment="Drop Outbound Syslog" disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=udp src-port=514
add action=drop chain=forward comment="Drop Outbound SNMP" disabled=yes dst-address-list=!LAN out-interface-list=WAN protocol=tcp src-port=161-162
add action=drop chain=forward comment="Drop Outbound IRC" disabled=yes log=yes out-interface-list=WAN protocol=tcp src-port=6660-6669
add action=accept chain=input comment="Allow ICMP" in-interface-list=WAN protocol=icmp
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="TFTP Add to Black List and Drop" disabled=yes dst-port=69 in-interface=!bridge-local protocol=udp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward disabled=yes dst-port=69 in-interface=!bridge-local protocol=udp src-address-list=!LAN
add action=drop chain=input disabled=yes dst-port=69 in-interface=!bridge-local protocol=udp src-address-list=!LAN
add action=drop chain=forward disabled=yes dst-port=69 in-interface=!bridge-local protocol=udp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="SSH Added to Black list and Drop" connection-state=new disabled=yes dst-port=22 in-interface=!bridge-local log-prefix="Stage 1 blocked" protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward connection-state=new disabled=yes dst-port=22 in-interface=!bridge-local log-prefix="Stage 1 blocked" protocol=tcp src-address-list=!LAN
add action=drop chain=input connection-state=new disabled=yes dst-port=22 in-interface=!bridge-local log-prefix="Stage 1 blocked" protocol=tcp src-address-list=!LAN
add action=drop chain=forward connection-state=new disabled=yes dst-port=22 in-interface=!bridge-local log-prefix="Stage 1 blocked" protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="FTP Added to Black list and Drop" connection-state=new disabled=yes dst-port=21 in-interface=!bridge-local log-prefix=FTP_stage1 protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward connection-state=new disabled=yes dst-port=21 in-interface=!bridge-local log-prefix=FTP_stage1 protocol=tcp src-address-list=!LAN
add action=drop chain=input connection-state=new disabled=yes dst-port=21 in-interface=!bridge-local log-prefix=FTP_stage1 protocol=tcp src-address-list=!LAN
add action=drop chain=forward connection-state=new disabled=yes dst-port=21 in-interface=!bridge-local log-prefix=FTP_stage1 protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d1m chain=input comment="Telnet Added to Black list" connection-state=new disabled=yes dst-port=23 in-interface=!bridge-local protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d1m chain=forward connection-state=new disabled=yes dst-port=23 in-interface=!bridge-local protocol=tcp src-address-list=!LAN
add action=drop chain=input connection-state=new disabled=yes dst-port=23 in-interface=!bridge-local protocol=tcp src-address-list=!LAN
add action=drop chain=forward connection-state=new disabled=yes dst-port=23 in-interface=!bridge-local protocol=tcp src-address-list=!LAN
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="NMAP FIN Stealth scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="SYN/FIN scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="SYN/RST scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=syn,rst
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=syn,rst
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=syn,rst
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=syn,rst
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input comment="FIN/PSH/URG scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=forward comment="ALL/ALL scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=black_list address-list-timeout=7w1d chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn,rst,psh,ack,urg
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn,rst,psh,ack,urg
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=black_list address-list-timeout=1d chain=input comment="NMAP NULL scan" disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=black_list address-list-timeout=1d chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=forward disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input disabled=yes in-interface-list=WAN protocol=tcp src-address-list=!voip tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=forward comment="Drop Invalid" connection-state=invalid disabled=yes
add action=drop chain=input connection-state=invalid disabled=yes
add action=accept chain=input comment="Allow Est and Related - Input" connection-state=established,related disabled=yes in-interface-list=WAN
add action=accept chain=forward comment="Allow Est and Related - Forward" connection-state=established,related disabled=yes in-interface-list=WAN
/ip firewall raw
add action=accept chain=prerouting comment="Allow Whitelist" in-interface-list=WAN src-address-list=Whitelist
add action=drop chain=prerouting comment="Drop Blacklist" in-interface-list=WAN src-address-list=black_list
add action=drop chain=prerouting comment="Drop Inbound Tor Exit Nodes" in-interface-list=WAN src-address-list=TorNode
add action=drop chain=prerouting comment="Drop Inbound Malware" in-interface-list=WAN src-address-list=Malware
add action=drop chain=prerouting comment="Drop Pastebin" in-interface-list=WAN src-address-list=pastebin
add action=drop chain=prerouting comment="Drop China" in-interface-list=WAN src-address-list="cn zone"
add action=drop chain=prerouting comment="Drop Russia" in-interface-list=WAN src-address-list="ru zone"
/ip firewall nat
add action=masquerade chain=srcnat comment=Mask out-interface-list=WAN
/ip firewall service-port
set ftp disabled=yes
set tftp disabled=yes
set irc disabled=yes
set h323 disabled=yes
set sip disabled=yes
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=8080 disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
