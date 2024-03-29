## Description

...

## Developement

- Installer rbenv: https://github.com/rbenv/rbenv
- Installer la version du fichier `.ruby-version`: `rbenv install 3.2.1`
- Installer les dépendances: `bundle install`
- Créer la base de données: `bundle exec db:create`
- Iporter le schéma de la base: `bundle exec db:migrate`
- Importer les fixtures: `bundle exec rake import:employee`
- Importer jeu de test des reviews: `rake reviews:local_reset`
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
- [x] Ajouter propriété cycle de vie dans ReviewPeriod (créé, terminé)
- [ ] Récupérer la date d'embauche dans le fichier employee pour calculer la seniority dans les Reviews
- [x] Route show des campagnes
- [x] Renommer ReviewPeriod par ReviewCampaigns
- [x] Ajouter le champ période d'évaluation
- [ ] Problème d'affichage des icones du menu
- [ ] Gestion des roles, voir avec les RHs quelles actions possibles par rôle (admin, viewer, editor, admin_rh, rh)
- [x] Ajouter liste des templates dans campaigns
- [ ] Pouvoir ajouter une ligne sur tableau simple 
- [x] Ajouter filtre d'application sur template
- [x] Pouvoir terminer un entretien
- [ ] A la cloture d'une campagne terminer tous les entretiens
- [ ] Ajouter condition/filtre sur catégorie et question (comme pour les campagnes)
- [x] Ajouter filtre sur l'employée/manager connecté dans les reviews
- [ ] A la cloture de la campagne, cloturer aussi tous les reviews

Manu, ce que tu fois faire en prio

- Revoir le JSON pour bien que les form généré soit iso avec ceux des RH
- Si l'employee à pas de mail, l'afficher avec une alert dans les vues show et edit:
  ```ruby
  <%= build alert("PAs d'email !", :error) %>
  ```
- VOir avec les RHs si il faut envoyer un mail et si oui, à la cloture de l'entretien ou à la cloture de la campagne ?
- A la cloture de la campagne, cloturer aussi tous les reviews 
- Problème d'affichage des icones du menu
- Gestion des roles, voir avec les RHs quelles actions possibles pour chaque rôle (admin, viewer, editor, admin_rh, rh) (juste pour admin_rh et rh)
- Voir avec les RH leurs besoins de syntèse sur les données des entretiens pour leurs sortir dans le show des campaign des jolie tableau voir graph (données, filtre sur les employée )
