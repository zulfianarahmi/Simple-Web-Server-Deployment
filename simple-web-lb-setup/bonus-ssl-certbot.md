# Bonus SSL dengan Certbot

## Syarat

- Domain sudah **pointing** ke IP Server C (load balancer)
- Port **80 (HTTP)** terbuka dan bisa diakses dari luar

## 1. Install Certbot

```bash
sudo apt install certbot python3-certbot-nginx -y
```

## 2. Jalankan Certbot

```bash
sudo certbot --nginx
```

Ikuti wizard-nya sampai selesai:

- Pilih domain yang ingin di-SSL-kan
- Pilih opsi untuk **redirect** ke HTTPS (jika diminta)

## 3. Tes HTTPS

Akses di browser:

```
https://yourdomain.com
```

Harusnya muncul ikon **gembok/HTTPS** di browser dan halaman web bisa diakses secara **aman**.

```

```
