# frozen_string_literal: true

Trestle.resource(:personnes) do
  remove_action :destroy, :new
  menu do
    group :"configuration des apps", priority: :first do
      item :"Gestion des employés", icon: 'fa fa-key'
    end
  end
  table do # This defines TasksAdmin.tables[:index]
    column :fname, link: true
    column :lname, align: :center
    column :cname, align: :center
    column :matsnr, align: :center
    column :mathr, align: :center
    column :department, align: :center
    column :service, align: :center
    column :m1, align: :center
    column :qualification, align: :center
    column :bdate, align: :center
    column :status, align: :center
    actions
  end

  table :personne do # This defines TasksAdmin.tables[:index]
    column :fname, link: true
    column :lname, align: :center
    column :cname, align: :center
    column :matsnr, align: :center
    column :mathr, align: :center
    column :department, align: :center
    column :service, align: :center
    column :m1, align: :center
    column :qualification, align: :center
    column :bdate, align: :center
    column :status, align: :center
    actions
  end
end
