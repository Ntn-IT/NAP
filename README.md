# README

Portail applicatif pour NTN Transmission Europe.

  Créer ressource trestle :

  Faire un scaffold normal au singulier sans maj

  rails generate scaffold siteid site_ID:integer site_Region:text site_Country:text site_Town:text site_Street:text site_NStreet:integer site_Postal:integer
rails generate scaffold empid emp_ID:integer emp_SITEID:integer emp_FName:text emp_LName:text emp_CName:text emp_Mat:text emp_MatHR:integer emp_Department:text emp_Service:text emp_M1:text emp_PI_ID:integer 

  Faire un rails db:migrate

  et ensuite faire une génération trestle
  rails generate trestle:resource siteid

