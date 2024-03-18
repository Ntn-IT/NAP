
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

- Authentification depuis LDAP <---FAIT
- Le status des employee est toujours sur Ouvrier ? Pk ? <--- En cours>
- Créer Model review template dans le namespace review (Reviews::ReviewTemplate)
- Rajouter dans la table review un title et aussi un status (index unique)
- Créer une tâche pour les créations des reviews templates

ex :
[{
  title: "FORMATION",
  questions: [
    {
      title: "Efficacité",
      type: "formation_table" 
    },
        {
      title: "Souhaits_formation",
      type: "formation_table" 
    }
  ]
}],
{
  title: "FORMATION",
  questions: [
    {
      title: "Efficacité",
      type: "formation_table" 
    },
        {
      title: "Souhaits_formation",
      type: "formation_table" 
    }
  ]
}

faire en sorte que la tache soit une mise à jour (prévoir une clés) (le status)