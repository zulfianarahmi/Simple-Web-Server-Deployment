# Simple Web Server + Load Balancer (Nginx)

This is a chill setup to practice basic load balancing using Nginx with two simple web servers. Just a fun way to get familiar with reverse proxy and testing failover.

## What's going on?

We got 3 servers:

- Server A → Static site (like "Hi from A")
- Server B → Another static site ("Hi from B")
- Server C → Load balancer with Nginx

## What we do

- Set up static sites on A and B
- Use Nginx on C to do round-robin load balancing
- Test what happens when one server is down
- Bonus: add HTTPS using Certbot

## Files

- `server-a-setup.md` → setup static site on Server A
- `server-b-setup.md` → same thing but on Server B
- `loadbalancer-setup.md` → configure Nginx load balancer
- `test-failover.md` → test what happens when 1 server is offline
- `bonus-ssl-certbot.md` → get free SSL with Certbot

---

## Access

Once everything's set, go to:
