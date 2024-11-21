# Infrastructure Test

The following steps were carried out to ensure the infrastructure was provisioned according to the given use case.

- ✅ `terraform plan -var="env_name=qa"`
- ✅ `terraform apply -var="env_name=qa"`
- ✅ SSH to public IP address of the `backend` instance via SSH using Azure CLI
- ✅ Create a dummy node.js web application (stored in the `application/` directory)
    - Install `nodejs`
    - Install `npm`
    - Install `node-http` package
    - Create `Hello World` web application --> listening at `http://0.0.0.0:443/` 

> 🚧 I had to change `const hostname` from `const hostname = '127.0.0.1';` to `const hostname = '0.0.0.0';`, otherwise the following error occured:
>
>```bash
>ondrej.halaska@gmail.com@vent4cloud-qa-worker:~$ curl -v --insecure http://10.11.12.4:443
>*   Trying 10.11.12.4:443...
>* connect to 10.11.12.4 port 443 failed: Connection refused
>* Failed to connect to 10.11.12.4 port 443 after 1 ms: Connection refused
>* Closing connection 0
>curl: (7) Failed to connect to 10.11.12.4 port 443 after 1 ms: Connection refused
>```

- ✅ SSH to public IP address of the `worker` instance via SSH using Azure CLI
- ✅ Send `http` request from the `worker` instance to the `backend` one and access the dummy web application on port `443`
- ✅ Get HTTP 200 status code

```bash
ondrej.halaska@gmail.com@vent4cloud-qa-worker:~$ curl -v http://10.11.12.4:443
*   Trying 10.11.12.4:443...
* Connected to 10.11.12.4 (10.11.12.4) port 443 (#0)
> GET / HTTP/1.1
> Host: 10.11.12.4:443
> User-Agent: curl/7.81.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Content-Type: text/plain
< Date: Mon, 14 Oct 2024 10:50:31 GMT
< Connection: keep-alive
< Keep-Alive: timeout=5
< Content-Length: 11
< 
* Connection #0 to host 10.11.12.4 left intact
Hello World
```

- ✅ Send `http` request from the Internet (the `local machine`) to the `backend` instance using `<BACKEND_PUBLIC_IP>:<443>`

```bash
ondrej@OH-MacBook-Air ~ % curl -v http://40.77.55.67:443
*   Trying 40.77.55.67:443...
* connect to 40.77.55.67 port 443 from 192.168.1.59 port 58130 failed: Operation timed out
* Failed to connect to 40.77.55.67 port 443 after 75002 ms: Couldn't connect to server
* Closing connection
curl: (28) Failed to connect to 40.77.55.67 port 443 after 75002 ms: Couldn't connect to server
```

- ✅ `terraform destroy -var="env_name=qa"`


