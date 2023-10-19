HOW TO RUN:

Ubuntu 22.04 does not ship with ddclient that supports cloudflare dyndns with its api token at the memonet.
So I dokernize ddclient 3.10+ version.
Also in case you are interested; [Rust based cloudflare dyndns client](https://github.com/seungjin/cloudflare-dyndns-client)

	
```
docker run -v ./ddclient.conf:/etc/ddclient/ddclient.conf -v /var/cache/ddclient:/var/cache/ddclient ghcr.io/seungjin/ddclient:3.11.0_1
```
