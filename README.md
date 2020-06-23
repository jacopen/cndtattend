# cndtattend

例のアレ

## Prerequisites

- Docker Compose
- Auth0 application keys

## How to create auth0 applications keys

See [Auth0 document](https://auth0.com/docs/quickstart/webapp/rails/01-login)

After create configuration, create `.env` file in the top-level directory.

```
AUTH0_CLIENT_ID=FVYbe7dsf1fowelsdlkdsfLwofArfNUznaeku
AUTH0_CLIENT_SECRET=jBeB2Jd4sdfsdfdgetwarzOXYsdEyasdfq3wer3r9wglkj129UoF_XJuD
AUTH0_DOMAIN=yourdomain.auth0.com
```

Docker compose read `.env` file automatically.

If you are running a rails server without Docker compose, you need to set environment variables like this.

```
export AUTH0_CLIENT_ID=FVYbe7dsf1fowelsdlkdsfLwofArfNUznaeku
export AUTH0_CLIENT_SECRET=jBeB2Jd4sdfsdfdgetwarzOXYsdEyasdfq3wer3r9wglkj129UoF_XJuD
export AUTH0_DOMAIN=yourdomain.auth0.com
```

## How to run

```
$ docker-compose up -d
```

## DB migration

```
$ docker-compose run --rm app rails db:migrate
```