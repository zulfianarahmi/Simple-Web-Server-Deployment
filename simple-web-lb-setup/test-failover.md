# Test Failover

## 1. Stop Nginx di salah satu backend (A atau B)

Contoh: stop Nginx di Server B

```bash
ssh user@<IP-Server-B>
sudo systemctl stop nginx
```

````

## 2. Akses IP Load Balancer

```bash
curl http://<IP-Server-C>
```

## 3. Cek apakah tetap bisa akses

Harusnya cuma dapat respon dari server yang masih hidup (misalnya Server A kalau Server B mati).

```


```
````
