For **04-setup-ssl**, it should include steps for setting up SSL with Let's Encrypt. Based on your setup, it will involve installing Certbot and configuring Nginx for HTTPS. Here's how the content might look:

---

# Setting Up SSL with Let's Encrypt

## Prerequisites

- A domain name pointing to your server
- Nginx installed and running
- Virtual host already configured

## Steps to Install SSL

### 1 Install Certbot

```bash
sudo apt update
sudo apt install certbot python3-certbot-nginx -y
```

### 2 Obtain an SSL Certificate

Run the following command:

```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

Follow the prompts and select option 2 to redirect HTTP to HTTPS automatically.

### 3 Verify SSL Installation

Check if the certificate is successfully installed:

```bash
sudo certbot certificates
```

Then, test your website using:

```bash
https://yourdomain.com
```

### 4 Enable Auto-Renewal

To ensure SSL certificates renew automatically, add this to cron jobs:

```bash
sudo crontab -e
```

Add:

```bash
0 0,12 * * * certbot renew --quiet
```

## Troubleshooting

- If the certificate fails to install, check:
  ```bash
  sudo journalctl -u nginx --since "10 minutes ago"
  ```
- If SSL isn't working, manually check the Nginx configuration:
  ```bash
  sudo nano /etc/nginx/sites-available/yourdomain.com
  ```

---
