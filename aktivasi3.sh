curl -s -X POST "https://api.cloudflare.com/client/v4/zones/Ini diisi dengan API Zone ID/dns_records" \
     -H "X-Auth-Email: Ini diisi e-mail kamu di cloudflare" \
     -H "X-Auth-Key: ini di isi dengan Global API Key" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"unik.nasihosting.com","content":"ip server","ttl":120,"priority":10,"proxied":true}' > /dev/null
