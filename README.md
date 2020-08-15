# xsecurelock-docker
Docker build files for xsecurelock

Build and install on local computer:

```
docker build -t xsecurelock .
docker run -v /usr:/mnt xsecurelock:latest cp -av /usr/local /mnt
```
