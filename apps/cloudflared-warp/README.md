Debian
Notice: The public key requires updating if it was installed before 2025-09-12. Make sure to re-run the "Add cloudflare gpg key" step below to ensure the repository remains functional beyond 2025-12-04.

The supported releases are:
Trixie (13)
Bookworm (12)
Bullseye (11)
Older builds exist for:
Buster (10)
Stretch (9)
# Add cloudflare gpg key
````
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
````

# Add this repo to your apt repositories
````
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
````

# Install
````
sudo apt-get update && sudo apt-get install cloudflare-warp
````

To connect for the very first time:

Register the client 
````
warp-cli registration new
````
Connect 
````
warp-cli connect
````

Run 
````
curl https://www.cloudflare.com/cdn-cgi/trace/
````
and verify that 
````
warp=on
````

Switch modes
You can use 
````
warp-cli mode --help
`````
to get a list of modes to switch between. 
For example:

DNS only mode via DoH: 
````
warp-cli mode doh
````

WARP with DoH:
````
warp-cli mode warp+doh
````

