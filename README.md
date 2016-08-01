# petemcw/docker-pokemongo-map

Container for the open-source Pokémon Go Map found at https://github.com/AHAAAAAAA/PokemonGo-Map. Documentation for the map can be found at [PoGoMap](https://jz6.github.io/PoGoMap/).

![](https://raw.githubusercontent.com/petemcw/docker-templates/master/petemcw/img/pokemon-go-banner.png)

## Usage

Using Docker Compose it's as simple as setting your environment variables and running:

```
docker compose up -d
```

Otherwise:

```
docker create --name=pokemongo-map \
    -e PGID=<gid> \
    -e PUID=<uid> \
    -e BRANCH=develop \
    -e GMAPS_KEY=<apikey> \
    -e LOCATION=<location> \
    -e USERNAME=<username> \
    -e PASSWORD=<password> \
    petemcw/pokemongo-map
```

**Parameters**

* `-e SKIP_UPDATE` for preventing base OS package updates
* `-e AUTH_SERVICE` for authentication service. Default is `ptc`
* `-e USERNAME`
* `-e PASSWORD`
* `-e LOCATION` for default starting point which can be address or coordinates
* `-e NUM_THREADS` for number of search threads
* `-e SCAN_DELAY` for time delay between requests in scan threads
* `-e STEP_LIMIT` for number of steps to scan from starting location
* `-e GMAPS_KEY` for Google Maps JavaScript API key
* `-e HOST` for web server listening IP address
* `-e PORT` for web server listening port

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it pokemongo-map /sbin/my_init -- /bin/bash`.

## Updates

* Upgrade to the latest version simply `docker restart pokemongo-map`.
