# README

Portail applicatif pour NTN Transmission Europe.

  Créer ressource trestle :

  Faire un scaffold normal au singulier sans maj

  rails generate scaffold siteid site_ID:integer site_Region:text site_Country:text site_Town:text site_Street:text site_NStreet:integer site_Postal:integer
rails generate scaffold empid emp_ID:integer siteid:integer fname:text lname:text cname:text matsnr:text mathr:integer department:text service:text m1:text emp_PI_ID:integer 

  Faire un rails db:migrate

  et ensuite faire une génération trestle
  rails generate trestle:resource siteid


Pour faire une belle indentation > bundle exec rubocop --parallel -a


    table do
      column 'Thierry CHAUSSE'
      for line in Empid.where(m1: "4040").select("cname").all
        a = line.cname
        puts a.to_s
        select :a
      end
    end




    remove_action :destroy
  scopes do
    scope 'A faire', -> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : '
    scope 'En cours', -> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : '
    scope 'Terminé', -> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : '
  end
  

    form do |api|
    puts "avant !!!!!!!!"
    a = (text_field :id).split("=",2).to_s
    puts a
    if a.include? "value="
      puts "String includes 'cde'"
    end
    tab  :"entretien de " do |api|
      text_field :id
      puts "après !!!!!!!!"
      

      
    end
end




save du 28/02 am

Trestle.resource(:apis, model: api) do
 remove_action :destroy, :new
  menu do  
    group :applications, priority: :first do
      item :"Entretiens annuels", icon: "fa fa-handshake"
  end
end
  scopes do
    scope 'A faire',-> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : ', default: true
    scope 'En cours', -> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : '
    scope 'Terminé', -> { Empid.where(m1: current_user.mathr)}, group: 'Status entretiens : '
  end
  table do :api
    actions do |toolbar, instance, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
    end
    column :cname, link: false
    column :mathr, link: false
    column :department,link: false
    column :service,link: false
  end
  form do |apis|
    puts "avant !!!!!!!!"
    a = (text_field :id).split("=",2).to_s
    puts a
    if a.include? "value="
      puts "String includes 'cde'"
    end
    tab  :"entretien de " do |apis|
      text_field :id
      puts "après !!!!!!!!"
    end
  end
end




=begin   

  # binding.pry
  table() do
    column :entretien do
      'test'
    end
    #column :cname, link: true
    column :mathr, link: true
    #column :department, link: true
    #column :service, link: true
  end
  form do |_entretiens|
    puts 'avant !!!!!!!!'
    a = (text_field :id).split('=', 2).to_s
    puts a
    puts "String includes 'cde'" if a.include? 'value='
    tab :"entretien de " do |_entretiens|
      text_field :id
      puts 'après !!!!!!!!'
    end
  end =end
end


  collection do 
    puts "la !!!!!!!!"
    #a = User.n1(current_user)
    puts current_user.mathr
    #binding.pry
  end


    collection do 
    puts "la !!!!!!!!"
    #a = User.n1(current_user)
    puts current_user.mathr
    #binding.pry
  end


      def create_entretien_table
      ttable = Array.new
      ttable << ['cname'] ; ['tmathr']
      for line in Personne.where(m1: current_user.mathr).all
        tcname = line.cname
        tmathr = line.mathr
        tservice = line.service
        tqualification = line.qualification
        tbdate = line.bdate
        tstatus = line.status
        puts tcname,tmathr
      end
      binding.pry
    end

        Personne.distinct.pluck(:mathr).each do |mathr|
      scope mathr, -> { Personne.where(mathr: current_user.mathr) }
      puts mathr