# 🖥️ Server A Setup

## 1. Update sistem & install Nginx

```bash
sudo apt update && sudo apt install nginx -y
```

## 2. Ganti file HTML default

```bash
echo "Hello from Server A" | sudo tee /var/www/html/index.html
```

## 3. Test pakai curl

```bash
curl http://localhost
# atau dari luar:
curl http://<IP-Server-A>
```

```


```
