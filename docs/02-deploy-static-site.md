# Deploying a Static Website with Nginx

## Prerequisites

- A Linux server with Nginx installed
- A static website (HTML, CSS, JS files)
- Properly configured Nginx virtual hosts

## Steps to Deploy

### 1️⃣ Upload Your Static Files

Move your static website files to the web root directory:

```bash
sudo mkdir -p /var/www/html
sudo cp -r /path/to/your/static-site/* /var/www/html/
```

### 2️⃣ Configure Nginx

Edit the Nginx configuration file:

```bash
sudo nano /etc/nginx/sites-available/default
```

Ensure the configuration points to the correct document root:

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Save and exit.

### 3️⃣ Enable Configuration and Restart Nginx

```bash
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

### 4️⃣ Verify Deployment

Check if the website is accessible:

```bash
curl -I http://yourdomain.com
```

If you see `HTTP/1.1 200 OK`, your static site is successfully deployed!

### 5️⃣ Monitor Logs

Use the following command to check Nginx access logs:

```bash
tail -f /var/log/nginx/access.log
```

## Troubleshooting

If the wrong page loads, ensure:

- The correct `root` directory is set in `/etc/nginx/sites-available/default`.
- The default Nginx welcome page is removed:

```bash
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
```
