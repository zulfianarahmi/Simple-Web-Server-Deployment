#!/bin/bash

# Variables
DOMAIN="yourdomain.com"
EMAIL="your-email@example.com"
WEB_ROOT="/var/www/$DOMAIN/html"

# Update system
echo " Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Nginx
echo "📥 Installing Nginx..."
sudo apt install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Create web root directory
echo " Setting up web directory..."
sudo mkdir -p $WEB_ROOT
sudo chown -R $USER:$USER $WEB_ROOT

# Add sample index.html
echo "<h1>Welcome to $DOMAIN</h1>" | sudo tee $WEB_ROOT/index.html

# Configure Virtual Host
echo " Configuring virtual host..."
VHOST_CONF="/etc/nginx/sites-available/$DOMAIN"

sudo tee $VHOST_CONF > /dev/null <<EOF
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;
    root $WEB_ROOT;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Enable site and restart Nginx
sudo ln -s $VHOST_CONF /etc/nginx/sites-enabled/
sudo systemctl restart nginx

# Install Certbot & Obtain SSL Certificate
echo "🔒 Setting up SSL..."
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN --email $EMAIL --agree-tos --non-interactive

# Test SSL Renewal
echo " Testing SSL auto-renewal..."
sudo certbot renew --dry-run

# Log monitoring commands
echo " Setup complete! Use these commands to monitor logs:"
echo "  - Access log: tail -f /var/log/nginx/access.log"
echo "  - Error log: tail -f /var/log/nginx/error.log"
echo "  - Check Nginx status: systemctl status nginx"

echo " Web server deployment is complete!"
