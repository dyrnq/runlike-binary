# runlike-binary


runlike pre-build binary for <https://github.com/lavie/runlike>.


usage showcase:

```bash
ver="v1.6.3"
docker pull dyrnq/runlike:${ver}
docker ps -q|xargs -r -I{} docker run -i -v /var/run/docker.sock:/var/run/docker.sock dyrnq/runlike:${ver} -p {}
```

```bash
arch="amd64"
ver="v1.6.3"
if [ "$(uname -m)" = "x86_64" ];    then arch="amd64"; fi
if [ "$(uname -m)" = "aarch64" ];   then arch="arm64"; fi

curl -fsSL -o ./runlike "https://github.com/dyrnq/runlike-binary/releases/download/${ver}/runlike-${arch}"
chmod +x ./runlike
docker ps -q|xargs -r -I{} ./runlike -p {}
```

`dyrnq/runlike`image tags support aarch64/amd64

- <https://hub.docker.com/r/dyrnq/runlike/tags>

`assaflavie/runlike` images not support aarch64

- <https://hub.docker.com/r/assaflavie/runlike/tags>

`lavie/runlike github repo`

- <https://github.com/lavie/runlike>