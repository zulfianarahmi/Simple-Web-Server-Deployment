# Load Balancer Setup (Server C)

## 1. Install Nginx

```bash
sudo apt update && sudo apt install nginx -y
```

## 2. Buat file konfigurasi baru

```bash
sudo nano /etc/nginx/sites-available/loadbalancer
```

Isi file konfigurasi:

```nginx
upstream backend {
    server <IP-Server-A>;
    server <IP-Server-B>;
}

server {
    listen 80;

    location / {
        proxy_pass http://backend;
    }
}
```

> Ganti `<IP-Server-A>` dan `<IP-Server-B>` dengan IP asli masing-masing server.

## 3. Aktifkan config & reload Nginx

```bash
sudo ln -s /etc/nginx/sites-available/loadbalancer /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo systemctl reload nginx
```

## 4. Tes akses dari IP Server C

```bash
curl http://<IP-Server-C>
```

Atau buka di browser:

**Refresh beberapa kali**, seharusnya tampil halaman dari **Server A** dan **Server B** secara bergantian (round-robin).

```

```
