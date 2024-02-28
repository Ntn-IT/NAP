Trestle.resource(:apis, model: Empid) do
  remove_action :destroy, :new
  menu do  
    group :applications, priority: :first do
      item :"Entretiens annuels", icon: "fa fa-handshake"
  end
end
scopes do
  scope 'A faire',-> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : ', default: true
  scope 'En cours', -> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : '
  scope 'Terminé', -> { Empid.where(emp_M1: current_user.mat_hr)}, group: 'Status entretiens : '
end
table do :api
  column :emp_CName
  column :emp_Department
  column :emp_Service
end
  form do |api|
    puts "avant !!!!!!!!"
    a = (text_field :id).split("=",2).to_s
    puts a
    if a.include? "value="
      puts "String includes 'cde'"
    end
    tab  :"entretien de " do
      text_field :id
      puts "après !!!!!!!!"
      

      
    end
end
end