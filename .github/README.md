# Ghost blog using Docker, NGINX and Let's Encrypt

![Ghost](https://i.imgur.com/C3ypvnW.jpg)

With this repo you will be able to use a docker-compose to spin up your Ghost blog hustle free.

- NGINX proxy to manage your connections.
- Obtain and automatically renew ssl certificates with Let´s Encrypt.
- Data persistence in volumes with MySql.
- Mailgun support for transactional emails.
- Configuration centralized in a single file: `.env.`

## Prerequisites

In order to use this compose file (docker-compose.yml) you must have:

1. docker (https://docs.docker.com/engine/installation/)
2. docker-compose (https://docs.docker.com/compose/install/)

## How to use it

1. Clone this repository:

2. Make a copy of the `.env.sample` and rename it to `.env` and **update this file with your blog information, database info and preferences.**

3. Run the start script

```bash
./start.sh
```

Your Ghost blog is ready to go!

> You don´t need to open port `443` in your container, the certificate validation is managed by the web proxy.


> Please note that when running a new container to generate certificates with LetsEncrypt (`-e LETSENCRYPT_HOST=your.domain.com`), it may take a few minutes depending on multiples circumstances. Also note that the 
`LETSENCRYPT_TEST=${LETSENCRYPT_TEST:-true}` is set to *true* in the in the `.env`. Change to *false* when finished debugging and the blog is ready for real traffic. This is to avoid exceeding the certificate rate limit for your domain.
More info [here](https://letsencrypt.org/docs/rate-limits/).


## Additional configurations

- To add specific NGINX configurations, such as redirects etc... create a `.conf` file and add it to conf.d directory, while setting the `USE_NGINX_CONF_FILES` to *true* in the `.env.` file.
- To use Cloudflare, read and uncomment the necessary lines in the `/conf.d/realip.conf`
file.
- To use Mailgun, set your credentials in the `.env` file and uncomment the respective lines in the compose file.

## Credits

All credit goes to:

- docker-compose-letsencrypt-nginx-proxy-companion [@evertramos](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion)
- nginx-proxy [@jwilder](https://github.com/jwilder/nginx-proxy)
- docker-gen [@jwilder](https://github.com/jwilder/docker-gen)
- docker-letsencrypt-nginx-proxy-companion [@JrCs](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)
- Ghost [@TryGhost](https://github.com/TryGhost/Ghost)
- mysql [@mysql](https://github.com/mysql/mysql-docker)
