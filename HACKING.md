# Development

Setup your titanic development environment:

```shell
./scripts/install.sh
```

And start developing

```shell
./scripts/start.sh
```


## Docker

You can run the entire web app with all the necessary services inside Docker:

```shell
docker-compose up
```

To run `python manage.py` commands use `docker-compose run cli` instead:

```shell
docker-compose run cli migrate
docker-compose run cli createsuperuser
```

If you want to run Django with runserver for better debug output,
update the *docker-compose.yml* file.


## Frontend details



# Deployment

You can deploy your Django web app to different PaaS providers
in just a few commands.

## Heroku

You can quickly deploy titanic to Heroku:

```shell
heroku login
heroku create titanic
heroku git:remote -a titanic
heroku addons:create heroku-postgresql:hobby-dev # for the DB
heroku addons:create heroku-redis:hobby-dev # for Celery
./scripts/deploy.sh
heroku run python manage.py migrate
```

Once this initial setup is working, you normally deploy by issuing:

```shell
./scripts/deploy.sh
```

And you're running on Heroku! 🚀

## Dokku

Dokku is an alternative to Heroku that you can self-host. We assume that your
Dokku server uses the hostname (and email) *dokku.me* in the commands bellow –
replace with your actual information.

SSH into your Dokku host and create the app:

```shell
dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
dokku plugin:install https://github.com/dokku/dokku-postgres.git
dokku plugin:install https://github.com/dokku/dokku-redis.git
dokku apps:create titanic
dokku postgres:create titanicdb
dokku postgres:link titanicdb titanic
dokku redis:create titanicredis
dokku redis:link titanicredis titanic
dokku config:set --no-restart titanic DOKKU_LETSENCRYPT_EMAIL=youremail@dokku.me
```

Inside your project do:

```shell
git remote add dokku dokku@dokku.me:titanic
git push dokku master
```

Now a few more commands on the server:

```shell
dokku letsencrypt titanic
dokku run titanic python manage.py migrate
```

That's it! Your app should be live on https://titanic.dokku.me 🚀


# Upgrading the scaffolding

The scaffolding for this Django project was built using
[generator-django-rest][]. To upgrade your project with the latest version
of generator-django-rest install `node` and get these npm package:

```shell
npm install -g yo generator-django-rest
```

If you use `yarn` instead do:

```shell
yarn global add yo generator-django-rest
yarn global upgrade yo generator-django-rest
```

Then from within the root of your project (the path containing this file) run:

```shell
yo django-rest
```

And resolve any conflicts using the interactive prompts.


[generator-django-rest]: https://github.com/metakermit/generator-django-rest
