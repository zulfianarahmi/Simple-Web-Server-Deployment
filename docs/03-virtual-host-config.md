# Configuring Virtual Hosts in Nginx

## Prerequisites

- A Linux server with Nginx installed
- A domain name pointed to your server's IP address
- Properly structured web directories

## Steps to Configure Virtual Hosts

### 1 Create a New Directory for Your Site

```bash
sudo mkdir -p /var/www/yourdomain.com/html
sudo chown -R $USER:$USER /var/www/yourdomain.com/html
```

### 2 Create an Nginx Server Block

```bash
sudo nano /etc/nginx/sites-available/yourdomain.com
```

Add the following configuration:

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /var/www/yourdomain.com/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Save and exit.

### 3 Enable the Virtual Host

Create a symbolic link:

```bash
sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/
```

### 4 Restart Nginx to Apply Changes

```bash
sudo systemctl restart nginx
```

### 5 Verify the Configuration

Check for syntax errors:

```bash
sudo nginx -t
```

Then test the website in your browser: `http://yourdomain.com`

## Troubleshooting

If the wrong site loads or the default Nginx page appears:

- Ensure the correct root directory is set in `/etc/nginx/sites-available/yourdomain.com`
- Restart Nginx after changes:

```bash
sudo systemctl restart nginx
```

- Check active configurations:

```bash
ls -l /etc/nginx/sites-enabled/
```

- Remove conflicting default pages:

```bash
sudo rm /var/www/html/index.nginx-debian.html
sudo systemctl restart nginx
```
