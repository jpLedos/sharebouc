# ShareBouc
![logo sharebouc](images/bouc_puce.jpeg "Logo shareBouc")

### Projet symfony / react
###### Partage de liste de lecture sur une idée de Yoandev.

composer Pour tester chez vous cette application :

```
composer install

npm install
npm run build

symfony console d:database:create
symfony console make:migration

symfony console doctrine:fixtures:load --no-interaction
symfony console app:create-admin admin@test.fr admin admin

```
