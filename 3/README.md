# 3rd tssk

Create a docker-compose file resulting the following:

    Nginx instance
    Redis instance
    MySQL instance
    WordPress served by all above
    Create 200 dummy user accounts of WordPress

Redis must be used for storing PHP sessions.

The result of the task should look like a public GitHub repository.
The README.md file with the description of required steps for running everything is mandatory.

# Solution

As I discovered Wordpress in this configuration needs two additional plugins - redis-cache and fakerpress
First for using redis as a db for cashing and second for generating dummy content (users)

So we using composer.json to download both plugins.

We using multistage Dockerfile to build image from wordpress:5.1.1-fpm-alpine with adding needed plugins and with our
wp-config.php (default, but with redis configuration).

And finally, we building the whole environment with docker-compose:
- nginx with our nginx.conf and wordpress as a named volume
- mysql with wordpress db
- redis
- and custom wordpress with our config, two plugins and wordpress as a named volume
  also, two volumes created and docker-network for environment

in the end we are having a clean Wordpress but with correct config and installed plugins,
which can be activated in the first run - redis connected without any problems and 200 dummy accounts can be created with fakerpress (Im not shure how it can be done before first run of jira)




