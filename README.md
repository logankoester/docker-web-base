# Docker Web Base

> A base image for containerized web servers. Work in progress.

## Quick overview...

* Built with Packer
* Arch Linux
* Chef Solo
* SSH
* nginx
* Github users

## Building the image

### Prerequisites

* Arch Linux (host)
* Ruby
* Bundler
* Packer

In the root directory...

1) Run `bundle install` to install the gems
2) Rename `variables.example.json` to `variables.json`
3) Set the `github_organization` variable to the name of your Github organization.
4) Run `bundle exec thor packer:build packer.json`

The resulting build image will appear at `pkg/latest.tar`.

## Launching the image

Import the file to Docker with the `docker import` subcommand. Tag it however you like.

Launch it wth `docker run -it -P -d [-name <NAME>] <IMAGE> /usr/sbin/supervisord -c /etc/supervisord.conf -n`.

Root and password authentication are disabled over SSH.

Each public member of your Github organization has a shell account authorized with the public keys
they've shared with Github.

Login in with `$ ssh [github_username]@[host] -p [port]` (Whichever port is mapped to `22`)

Or simply use `nsenter`/`docker-enter`/etc.

`sudo` is allowed for Github users. Take advantage of this now to change the default passwords.

Enjoy!
