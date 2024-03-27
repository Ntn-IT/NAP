
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

- [x] Authentification depuis LDAP
- [ ] Message d'erreur dans le formulaire de login
- [x] Ajouter la colonne email à Employee, la rendre modifiable 
- [ ] FIl d'ariane
- [ ] Cron de mise à jour des employés
- [x] Il manque des status dans l'import des employés
- [x] Formulaire de recherche
- [x] Dossier app/tasks avec les classes des tasks
- [ ] Ajouter propriété cycle de vie dans ReviewPeriod (créé, terminé) 
- [ ] Récupérer la date de naissance dans le fichier employee pour calculer la seniority dans les Reviews
- [ ] Route show des campagnes
