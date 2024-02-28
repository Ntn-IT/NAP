Trestle.resource(:empids) do
  menu do
    group :"configuration des apps", priority: :first do
      item :"Gestion des employés", icon: "fa fa-key"
    end
  end
  table do |empid|
    column :emp_MatHR
    column :emp_CName
    actions
  end
  form do |empid|
    concat Trestle::Form::Automatic.new(admin).render(self, empid)
    tab :api do
      static_field :emp_CName
      text_field :emp_MatHR
    end
  end
end
