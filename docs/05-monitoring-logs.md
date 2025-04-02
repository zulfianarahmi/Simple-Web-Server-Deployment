Here's how **05-monitoring-logs.md** might look based on our discussion:

---

# Monitoring Logs in Nginx

## Why Monitor Logs?

Monitoring logs helps in:

- Debugging errors (e.g., incorrect configurations, missing files)
- Tracking visitor activity
- Identifying security threats

## Types of Logs in Nginx

Nginx mainly has two log types:  
1 **Access Logs** (`/var/log/nginx/access.log`) – Tracks every request to the server  
2 **Error Logs** (`/var/log/nginx/error.log`) – Logs issues and server errors

## How to Monitor Logs

### 1 View Live Logs in Real-Time

To see new log entries as they happen:

```bash
tail -f /var/log/nginx/access.log
```

For error logs:

```bash
tail -f /var/log/nginx/error.log
```

### 2 Search for Specific Entries

Find errors within logs:

```bash
grep "error" /var/log/nginx/error.log
```

Find a specific IP’s activity:

```bash
grep "192.168.1.1" /var/log/nginx/access.log
```

### 3 Use `journalctl` to View Nginx Service Logs

Check recent logs:

```bash
sudo journalctl -u nginx --since "1 hour ago"
```

See only error logs:

```bash
sudo journalctl -u nginx -p 3 --no-pager
```

### 4 Set Up Log Rotation (Optional)

To prevent logs from growing too large, ensure `logrotate` is configured:

```bash
cat /etc/logrotate.d/nginx
```

## Troubleshooting

- If logs are not updating, check permissions:
  ```bash
  ls -lh /var/log/nginx/
  ```
- If logs are missing, verify Nginx config:
  ```bash
  sudo nano /etc/nginx/nginx.conf
  ```
