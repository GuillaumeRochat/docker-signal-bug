# Docker Signal Bug

## Reproduce

Start by building the test container
```bash
./build.sh
```

Start the container with docker-compose:
```bash
docker-compose up
```

Stop the container with Ctrl+C and note that there is no `Caugh Term` or `Caugh Int` appearing in the console:
```bash
~/code/docker-signal-bug master*
❯ docker-compose up
Starting docker-signal-bug_service_1 ... done
Attaching to docker-signal-bug_service_1
^CGracefully stopping... (press Ctrl+C again to force)
Stopping docker-signal-bug_service_1 ... done
```

Start the container with docker-compose again but this time, stop it using `docker stop docker-signal-bug_service_1` instead:
```bash
~/code/docker-signal-bug master*
❯ docker-compose up
Starting docker-signal-bug_service_1 ... done
Attaching to docker-signal-bug_service_1
service_1  | Caugh Term
docker-signal-bug_service_1 exited with code 143
```

Start the container with docker run this time and stop it with Ctrl+C:
```bash
~/code/docker-signal-bug master* 11s
❯ docker run -it docker-signal-bug
^CCaugh Int
```

## Docker version
```bash
Client:
 Version:           19.03.5-ce
 API version:       1.40
 Go version:        go1.13.4
 Git commit:        633a0ea838
 Built:             Fri Nov 15 03:19:09 2019
 OS/Arch:           linux/amd64
 Experimental:      true

Server:
 Engine:
  Version:          19.03.5-ce
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.4
  Git commit:       633a0ea838
  Built:            Fri Nov 15 03:17:51 2019
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          v1.3.2.m
  GitCommit:        d50db0a42053864a270f648048f9a8b4f24eced3.m
 runc:
  Version:          1.0.0-rc9
  GitCommit:        d736ef14f0288d6993a1845745d6756cfc9ddd5a
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
```

## Docker-compose version
```bash
docker-compose version 1.25.1, build unknown
docker-py version: 4.1.0
CPython version: 3.8.1
OpenSSL version: OpenSSL 1.1.1d  10 Sep 2019
```
