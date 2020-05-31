### Cleanup docker unused images
```
docker image prune -af
```

### Build docker image
```
docker build .
// docker build --tag astvision/spring-cloud-config:1.0 .
```

### Init config repo on the server where config-api runs
```
cd /opt/ast-starter
mkdir config
git init .
```

### Make changes to config
```
git add -A .
git commit -m "Added example config"
```
