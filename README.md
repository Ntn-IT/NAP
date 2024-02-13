# README

Portail applicatif pour NTN Transmission Europe.

  Créer ressource trestle :

  Faire un scaffold normal au singulier sans maj
  rails generate scaffold siteid site_ID:integer site_Region:text site_Country:text site_Town:text site_Street:text site_NStreet:integer site_Postal:integer

  Faire un rails db:migrate

  et ensuite faire une génération trestle
  rails generate trestle:resource siteid

