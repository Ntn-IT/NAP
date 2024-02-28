# README

Portail applicatif pour NTN Transmission Europe.

  Créer ressource trestle :

  Faire un scaffold normal au singulier sans maj

  rails generate scaffold siteid site_ID:integer site_Region:text site_Country:text site_Town:text site_Street:text site_NStreet:integer site_Postal:integer
rails generate scaffold empid emp_ID:integer emp_SITEID:integer emp_FName:text emp_LName:text emp_CName:text emp_Mat:text emp_MatHR:integer emp_Department:text emp_Service:text emp_M1:text emp_PI_ID:integer 

  Faire un rails db:migrate

  et ensuite faire une génération trestle
  rails generate trestle:resource siteid



    table do
      column 'Thierry CHAUSSE'
      for line in Empid.where(emp_M1: "4040").select("emp_CName").all
        a = line.emp_CName
        puts a.to_s
        select :a
      end
    end




    remove_action :destroy
  scopes do
    scope 'A faire', -> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : '
    scope 'En cours', -> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : '
    scope 'Terminé', -> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : '
  end
  