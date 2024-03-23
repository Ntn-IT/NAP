
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
- [x] Le status des employee est toujours sur Ouvrier ? Pk ?
- [ ] Message d'erreur dans le formulaire de login
- [x] Ajouter la colonne email à Employee, la rendre modifiable 
- [ ] FIl d'ariane
- [ ] Cron de mise à jour des employés
- [ ] Il manque des status dans l'import des employés
- [ ] Formulaire de recherche
- [ ] Dossier app/tasks avec les classes des tasks
- [ ] Ajouter propriété cycle de vie dans ReviewPeriod (créé, terminé) 
- [ ] Récupérer la date d'embauche dans le fichier empoyee pour calculer la seniority dans les Reviews
- [ ] Route show des campagnes
