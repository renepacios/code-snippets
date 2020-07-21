
echo "haciendo fetch + submodule update + pull"
git fetch
git submodule update --recursive --remote --force
git pull