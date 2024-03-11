
## Description 

...

## Developement 

- Installer rbenv: https://github.com/rbenv/rbenv
- Installer la version du fichier `.ruby-version`: `rbenv install 3.2.1`
- Installer les dépendances: `bundle install`
- Créer la base de données: `bundle exec db:create`
- Iporter le schéma de la base: `bundle exec db:migrate`
- Importer les fixtures: `bundle exec rake import:employee`
- Lancer le serveur: `rails s`

## TODO 

- Authentification depuis LDAP
- Le status des employee est toujours sur Ouvrier ? Pk ?
