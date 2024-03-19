
## Description 

Portail applicatif NTN-TE Europe (Allonnes)

## Developement 

- Installer rbenv: https://github.com/rbenv/rbenv
- Installer la version du fichier `.ruby-version`: `rbenv install 3.2.3`
- Installer les dépendances: `bundle install`
- Créer la base de données: `bundle exec db:create`
- Iporter le schéma de la base: `bundle exec db:migrate`
- Importer les fixtures: `bundle exec rake import:employee`
- Lancer le serveur: `rails s`

## TODO 

- Authentification depuis LDAP <--- Fait
- Le status des employee est toujours sur Ouvrier ? Pk ? <--- Fait
- Créer Model review template dans le namespace review (Reviews::ReviewTemplate) <--- En cours
  -JSON Ouvrier (A2-C6) Fait
  -JSON Cadre (D7>) En cours
- Rajouter dans la table review un title et aussi un status (index unique) <--- En cours
- Créer une tâche pour les créations des reviews templates <--- En cours

faire en sorte que la tache soit une mise à jour (prévoir une clés) (le status)