# Structurizr Example

Пример того что можно сделать с помощью [Structurizr](https://docs.structurizr.com)

https://structurizr-adept.github.io/structurizr-example

## Локальный запуск

[Quickstart](https://docs.structurizr.com/local/quickstart)

```sh
docker run -it --rm -p 5555:8080 -v ./structurizr:/usr/local/structurizr structurizr/structurizr local
```

### Ошибка при запуске

```
17:16:52.745 [main] ERROR com.structurizr.configuration.Configuration -- Data directory /usr/local/structurizr is not writable
```

#### Решение Primero

```sh
chmod 646 structurizr/workspace.*
```

#### Решение Segundo

Root мод

```sh
docker run -it --rm -p 5555:8080 -u 0:0 -v ./structurizr:/usr/local/structurizr structurizr/structurizr local
```

Юзер мод

```sh
docker run -it --rm -p 5555:8080 -u "$(id -u):$(id -g)" -v ./structurizr:/usr/local/structurizr structurizr/structurizr local
```

#### Решение Tercero

Непроверено, но должно работать

Юзать образ с тегом `-noble`

https://hub.docker.com/r/structurizr/structurizr/tags

После запуска докера открыть - http://localhost:5555
