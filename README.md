# t-Shirt Shop

## Prerequisites

* Docker
* Docker Compose

## Go up server

```bash
docker-compose up -d
```

## Get Docker name

```bash
docker ps
```

## Access container

```bash
docker exec -it t-shirt-shop-ruby-alura-web-1 bash
```

## Run Migrations (on your bash container)

```bash
rake db:migration
```

## Stop server

```bash
docker-compose down
```