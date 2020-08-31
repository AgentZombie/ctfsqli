# ctfsqli

This is a simple SQLi-vulnerable web applications for use in CTF challenges. It is configured via environment variables and should work equally well standalone or inside a container. It is intended that each participant gets their own instance so container deployment is advised.

## Building

You must have Go installed. Unlike most Go applications this depends on C code (sqlite3) so cross-compiling is a challenge. You'll have the best experience building on linux.

### Dependencies

- The Go toolchain - you can get that [here](https://golang.org/dl/). Modules are used so this should at least be go 1.14.
- Your distribution's sqlite3 dev libraries. In Debian, for example, `libsqlite3` is sufficient.
- Your distribution's sqlite3 client tool. In Debian this is `sqlite3`. 

From within the `ctfsqli` directory:

```
rm -rf docker/work 2>/dev/null
mkdir docker/work
# -ldflags="-s -w" strips debugging symbols for smaller output
go build -o docker/work/ctfsqli -ldflags="-s -w" main.go
sqlite3 docker/work/ctf.db < db.sql
docker build -t ctfsqli:latest docker
```

## Running

Configuration of the running app is handled through environment variables:

- `TARGET_FLAG` - The flag value the user should recover
- `DB_FILE` - Path to the DB file. You probably don't want to change this
- `LISTEN` - `[<address>]:<port>` to listen on. This is better managed via `expose`
- `TEMPLATE_DIR` - Path to HTML templates. This probably shouldn't be changed

No storage volumes are required and the job can run with no privileges:

```
docker run --rm -d
  -p <external port>:8000 \
  --env TARGET_FLAG=<flag value> \
  --user ctfsqli:ctfsqli \
  ctfsqli:latest
```