/system script
add dont-require-permissions=no name=D1 owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":global Alderaan\
    \n/ip firewall filter\
    \n:local ruleName \"Drop Winbox except Local/Lighthouse\"\
    \n:local ruleNumber [/ip firewall filter find comment=\"\$ruleName\"]\
    \n:local isDisabled [get \$ruleNumber disabled]\
    \n:global rName\
    \n\
    \n:if (\$isDisabled) do={\
    \n /tool e-mail send to=\$Alderaan subject=\"Firewall Rule Disabled on \$rName\" body=\"Firewall rule \$ruleName is disabled.\"\
    \n /log info \"Rule disabled\"\
    \n}"
add dont-require-permissions=no name=D2 owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":global Alderaan\
    \n/ip firewall filter\
    \n:local ruleName \"Drop Other RouterOS ports\"\
    \n:local ruleNumber [/ip firewall filter find comment=\"\$ruleName\"]\
    \n:local isDisabled [get \$ruleNumber disabled]\
    \n:global rName\
    \n\
    \n:if (\$isDisabled) do={\
    \n /tool e-mail send to=\$Alderaan subject=\"Firewall Rule Disabled on \$rName\" body=\"Firewall rule \$ruleName is disabled.\"\
    \n /log info \"Rule disabled\"\
    \n}"
add dont-require-permissions=no name=D3 owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":global Alderaan\
    \n/ip firewall raw\
    \n:local ruleName \"Drop Blacklist\"\
    \n:local ruleNumber [/ip firewall raw find comment=\"\$ruleName\"]\
    \n:local isDisabled [get \$ruleNumber disabled]\
    \n:global rName\
    \n\
    \n:if (\$isDisabled) do={\
    \n /tool e-mail send to=\$Alderaan subject=\"Firewall Rule Disabled on \$rName\" body=\"Firewall rule \$ruleName is disabled.\"\
    \n /log info \"Rule disabled\"\
    \n}"
add dont-require-permissions=no name=D4 owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":global Alderaan\
    \n/ip firewall raw\
    \n:local ruleName \"Drop Port Scanners\"\
    \n:local ruleNumber [/ip firewall raw find comment=\"\$ruleName\"]\
    \n:local isDisabled [get \$ruleNumber disabled]\
    \n:global rName\
    \n\
    \n:if (\$isDisabled) do={\
    \n /tool e-mail send to=\$Alderaan subject=\"Firewall Rule Disabled on \$rName\" body=\"Firewall rule \$ruleName is disabled.\"\
    \n /log info \"Rule disabled\"\
    \n}"
