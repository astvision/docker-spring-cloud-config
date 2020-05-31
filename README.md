### Init config repo on the server where config-api runs
cd /opt/ast-starter
mkdir config
git init .

### Make changes to config
git add -A .
git commit -m "Added example config"
