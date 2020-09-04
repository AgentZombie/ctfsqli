# ctfsqli

This is a simple SQLi-vulnerable web applications for use in CTF challenges. It is configured via environment variables and should work equally well standalone or inside a container. It is intended that each participant gets their own instance so container deployment is advised. When the service starts the database connection is via a read-only user so concurrent users _should_ be prevented from interfering with each other if the a single instance is shared.

The premise is that we are targetting to individuals to recover their passwords. We've managed to get _joel_'s password through phishing but _ellie_ has been a harder target. Those two and a group of friends use a team expenses tracking app and maybe her password can be recovered from there. Use _joel_'s password to login and get hacking!

## Building

You must have Go installed and the build process will pull source code from the Internet. To run as a container, the docker toolset must be installed.

### Dependencies

- The Go toolchain - you can get that [here](https://golang.org/dl/). Modules are used so this should at least be go 1.14.
- MySQL server - If building the container image this will be installed in the image automatically.

From within the `ctfsqli` directory:

```
rm -rf docker/work 2>/dev/null
mkdir docker/work
# -ldflags="-s -w" strips debugging symbols for smaller output
go build -o docker/work/ctfsqli -ldflags="-s -w" main.go
docker build -t ctfsqli:latest docker
```

## Running

Configuration of the running app is handled through environment variables:

- `TARGET_FLAG` - The flag value the user should recover
- `JOEL_PASS` - Password for the `joel` user
- `LISTEN` - `[<address>]:<port>` to listen on. This is better managed via `expose`
- `TEMPLATE_DIR` - Path to HTML templates. This probably shouldn't be changed

No storage volumes are required and the job can run with no privileges:

```
docker run --rm -d
  -p <external port>:8000 \
  --env TARGET_FLAG=<flag value> \
  --env JOEL_PASS=<login password> \
  --user ctfsqli:ctfsqli \
  ctfsqli:latest
```