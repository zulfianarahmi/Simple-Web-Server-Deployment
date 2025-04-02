# 01 - Install Web Server (Nginx or Apache)

This guide walks you through installing and setting up **Nginx or Apache** as a web server on Ubuntu.

---

## 1️⃣ Installing Nginx

### Step 1: Update Package List

Before installing, make sure your package list is updated:

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Nginx

```bash
sudo apt install nginx -y
```

### Step 3: Verify Nginx Installation

Check if Nginx is running:

```bash
systemctl status nginx
```

If it's not active, start it manually:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx  # Enable on boot
```

### Step 4: Configure Firewall

Allow HTTP and HTTPS traffic:

```bash
sudo ufw allow 'Nginx Full'
sudo ufw enable
sudo ufw status
```

### Step 5: Check Default Page

Open your browser and go to:

```
http://your-server-ip
```

If you see the **"Welcome to Nginx!"** page, the installation is successful.

---

## 2️⃣ Installing Apache

### Step 1: Install Apache

```bash
sudo apt install apache2 -y
```

### Step 2: Verify Apache Installation

Check if Apache is running:

```bash
systemctl status apache2
```

Start and enable if necessary:

```bash
sudo systemctl start apache2
sudo systemctl enable apache2
```

### Step 3: Configure Firewall

Allow Apache traffic:

```bash
sudo ufw allow 'Apache Full'
sudo ufw enable
```

### Step 4: Test Apache

Visit:

```
http://your-server-ip
```

If Apache is installed correctly, you should see the **default Apache page**.

---

## 3️⃣ Common Issues & Fixes

### ❌ Issue: Nginx or Apache not starting

**Error:**

```
Job for nginx.service failed because the control process exited with error code.
```

✅ **Fix:**

- Check which service is using port 80:
  ```bash
  sudo netstat -tulnp | grep :80
  ```
- If another web server is running, stop it:
  ```bash
  sudo systemctl stop apache2
  sudo systemctl restart nginx
  ```
  or vice versa.

### ❌ Issue: "403 Forbidden" on Nginx

**Error:**

```
403 Forbidden - You don't have permission to access this resource.
```

✅ **Fix:**
Check file permissions and set correct ownership:

```bash
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
```

---
