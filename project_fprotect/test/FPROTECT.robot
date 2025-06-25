*** Settings ***
Documentation   Test Suite 
Metadata    sid     FPROTECT
Metadata    owner   Nhan Nguyen
Force Tags      FPROTECT    device
Test Timeout    1h
Library     corelib/AssertionExtension.py

*** Test Cases ***
FPROTECT-01: DNS relay service can be installed as an IPK package

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The service shall auto start after install IPK packet
    ...
    ...     Test Steps:
    ...     1. DNS relay machine: Use command "opkg install --force-overwrite {ipk file}"
    ...     2. Wait for the installation process success
    ...
    ...     Expected Results:
    ...     - The service shall auto start

    [Tags]  FPROTECT-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-02: Verify DNS Server response correct IP address for the queried domain from the client

    [Documentation]    Author: Nhan Nguyen
    ...     Description: DNS Server response correct IP address for the queried domain from the client
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Config with a valid DNS server address
    ...     2. Client machine: Use nslookup to send a DNS query by command "nslookup tinhte.vn"
    ...     3. DNS relay service: Use command "tcpdump -i any udp port 53 -vvv -x -w dns.pcapng" to capture and write
    ...     4. Client machine: Copy the captured file to Client machine to verify IP responsed by using command
    ...     "scp root@192.168.1.1:/root/dns.pcapng ~/" (192.168.1.1 is DNS relay's IP address), open file in Wireshark
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-03: Check format package DNS sending with mode = 1

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-04: Check format package DNS sending with mode = 2

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-05: Check format package DNS sending without EDNS package

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-06: Check format package DNS sending with EDNS package

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-07: Check reponse in case of changing DNS relay configurations (Google DNS, port 50, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (Google DNS, port 50, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Google DNS): 8.8.8.8 or 8.8.4.4
    ...         - Port: 50
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-08: Check reponse in case of changing DNS relay configurations (Google DNS, port 50, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (Google DNS, port 50, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Google DNS): 8.8.8.8 or 8.8.4.4
    ...         - Port: 50
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-09: Check reponse in case of changing DNS relay configurations (Cloudflare DNS, port 50, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (Cloudflare DNS, port 50, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Cloudflare DNS): 1.1.1.1 or 1.0.0.1
    ...         - Port: 50
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-10: Check reponse in case of changing DNS relay configurations (Cloudflare DNS, port 50, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (Cloudflare DNS, port 50, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Cloudflare DNS): 1.1.1.1 or 1.0.0.1
    ...         - Port: 50
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-11: Check reponse in case of changing DNS relay configurations (OpenDNS , port 50, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (OpenDNS, port 50, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (OpenDNS): 208.67.222.222 or 208.67.220.220
    ...         - Port: 50
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-12: Check reponse in case of changing DNS relay configurations (OpenDNS, port 50, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Check reponse in case of changing DNS relay configurations (OpenDNS, port 50, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (OpenDNS): 208.67.222.222 or 208.67.220.220
    ...         - Port: 50
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Repeat step 2-4 from FPROTECT-02
    ...
    ...     Expected Results:
    ...     - IP address reponse the same as the queried one

    [Tags]  FPROTECT-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-13: The default DNS is auto-enabled if DNS relay configurations which port had used (Google DNS, port 53, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (Google DNS, port 53, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Google DNS): 8.8.8.8 or 8.8.4.4
    ...         - Port: 53
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-14: The default DNS is auto-enabled if DNS relay configurations which port had used (Google DNS, port 53, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (Google DNS, port 53, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Google DNS): 8.8.8.8 or 8.8.4.4
    ...         - Port: 53
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-14     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-15: The default DNS is auto-enabled if DNS relay configurations which port had used (Cloudflare DNS, port 53, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (Cloudflare DNS, port 53, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Cloudflare DNS): 1.1.1.1 or 1.0.0.1
    ...         - Port: 53
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-15     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-16: The default DNS is auto-enabled if DNS relay configurations which port had used (Cloudflare DNS, port 53, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (Cloudflare DNS, port 53, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (Cloudflare DNS): 1.1.1.1 or 1.0.0.1
    ...         - Port: 53
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-16     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-17: The default DNS is auto-enabled if DNS relay configurations which port had used (OpenDNS, port 53, mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (OpenDNS, port 53, mode 1)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (OpenDNS): 208.67.222.222 or 208.67.220.220
    ...         - Port: 53
    ...         - Mode: 1
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-17     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-18: The default DNS is auto-enabled if DNS relay configurations which port had used (OpenDNS, port 53, mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay configurations which port had used (OpenDNS, port 53, mode 2)
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address (OpenDNS): 208.67.222.222 or 208.67.220.220
    ...         - Port: 53
    ...         - Mode: 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Step 2: Display message "Address in use"
    ...     - Step 3: The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-18     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-19: Client changes the queried domain to another one in the process of DNS server response

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-19     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-20: Client check error handling (timeout and connection error) in case of invalid DNS server address

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Error (timeout and connection) in case of invalid DNS server address
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. DNS relay service: Use command "nano /etc/config/config_dns_relay" to edit configurations in the following items:
    ...         - Server address: 8.8.1.1 (invalid DNS Server address)
    ...         - Port: 50
    ...         - Mode: 1 or 2
    ...     2. After changing configuration, restart service using command "service itr-fpt-dns_relay restart"
    ...     3. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - Display message "..."

    [Tags]  FPROTECT-20     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-21: Check performance in case of the client sends a large requests (mode 1)

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-21     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-22: Check performance in case of the client sends a large requests (mode 2)

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-22     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-23: Check performance in case of the client sends a large requests (DNS relay is disabled)

    [Documentation]    Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  FPROTECT-23     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-24: The default DNS is auto-enabled if DNS relay is stopped

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay is stopped
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. Using command "service itr-fpt-dns_relay stop"
    ...     2. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-24     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-25: The default DNS is auto-enabled if DNS relay is removed package

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The default DNS is auto-enabled if DNS relay is removed package
    ...
    ...     Precondition:
    ...     -  Setup Client machine, DNS relay service (installed IPK packet), DNS server
    ...
    ...     Test Steps:
    ...     1. Using command "opkg remove itr-fpt-dns_relay"
    ...     2. Using nslookup to send query
    ...
    ...     Expected Results:
    ...     - The default DNS is auto-enabled, the queried domain is working properly

    [Tags]  FPROTECT-25     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


FPROTECT-26: The DNS relay support multiple DNS server IPV4

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The DNS relay shall send request to multiple DNS server
    ...
    ...     Precondition:
    ...     -  Change server config in confile file to: ['8.8.8.8','8.8.4.4']
    ...
    ...     Test Steps:
    ...     1. Using tcpdump capture all DNS package
    ...     2. Using nslookup to send query
    ...     3. Using wireshark check DNS package
    ...
    ...     Expected Results:
    ...     - DNS relay shall send package to '8.8.8.8' and '8.8.4.4' in an alternating manner and correct format EDNS

    [Tags]  FPROTECT-26     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-27: The DNS relay support multiple DNS server IPV6

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The DNS relay shall send request to multiple DNS server
    ...
    ...     Precondition:
    ...     -  Change server config in confile file to: ['2001:4860:4860::8888','2001:4860:4860::8844']
    ...
    ...     Test Steps:
    ...     1. Using tcpdump capture all DNS package
    ...     2. Using nslookup to send query
    ...     3. Using wireshark check DNS package
    ...
    ...     Expected Results:
    ...     - DNS relay shall send package to '2001:4860:4860::8888' and '2001:4860:4860::8844' in an alternating manner and correct format EDNS

    [Tags]  FPROTECT-27     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-28: The DNS relay support multiple DNS server IPV4 and IPV6

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The DNS relay shall send request to multiple DNS server
    ...
    ...     Precondition:
    ...     -  Change server config in confile file to: ['2001:4860:4860::8888','8.8.8.8']
    ...
    ...     Test Steps:
    ...     1. Using tcpdump capture all DNS package
    ...     2. Using nslookup to send query
    ...     3. Using wireshark check DNS package
    ...
    ...     Expected Results:
    ...     - DNS relay shall send package to '2001:4860:4860::8888' and '8.8.8.8' in an alternating manner and correct format EDNS

    [Tags]  FPROTECT-28     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

FPROTECT-29: The DNS relay shall listen on both IPV4 and IPV6

    [Documentation]    Author: Nhan Nguyen
    ...     Description: The DNS relay shall listen on both IPV4 and IPV6
    ...
    ...     Precondition:
    ...     -  Change server config in confile file to: ['8.8.8.8','2001:4860:4860::8888']
    ...     -  Setup OpenWRT support both IPv4 and IPv6
    ...
    ...     Test Steps:
    ...     1. Using tcpdump capture all DNS package
    ...     2. Using nslookup to send query
    ...     3. Using wireshark check DNS package
    ...
    ...     Expected Results:
    ...     - DNS relay shall send package to '8.8.8.8' and '2001:4860:4860::8888' and correct format EDNS

    [Tags]  FPROTECT-29     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


FPROTECT-30: DNS relay shall run as docker container

    [Documentation]    Author: Nhan Nguyen
    ...     Description: Build a docker container for DNS relay
    ...
    ...     Precondition:
    ...     -  Raspberry Pi run OpenWRT and docker environment
    ...     -  Docker image DNS relay
    ...
    ...     Test Steps:
    ...     1. Run Docker container on OpenWRT
    ...     2. Using nslookup to send query
    ...     3. Using wireshark check DNS package
    ...
    ...     Expected Results:
    ...     - DNS relay shall send package to DNS server and correct format EDNS

    [Tags]  FPROTECT-30     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

