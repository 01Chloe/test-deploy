# git fetch
# git reset la main
# entrer dans php :
#   composer install
#   faire les migrations sans interactions
#   faire un cache:clear
# build les assets  docker run --rm -v ./:/var/www/html -w /var/www/html node:22 sh -c "yarn install && yarn build"
# changer les droits chown -R www-data:www-data var et public
# relancer les container docker compose up -d

# et appeler ce scritp

git fetch
git reset --hard origin/main
docker compose exec php sh -c "composer install && php bin/console d:m:m --no-interaction && php bin/console cache:clear"
docker run --rm -v ./:/var/www/html -w /var/www/html node:22 sh -c "yarn install && yarn build"
docker compose exec php sh -c "chown -R www-data:www-data var && chown -R www-data:www-data public/build/"
docker compose -f compose.prod.yaml up -d
