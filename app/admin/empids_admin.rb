Trestle.resource(:empids) do
  menu do
    group :"configuration des apps", priority: :first do
      item :"Gestion des employés", icon: "fa fa-key"
    end
  end
  table do
    column :emp_MatHR
    column :emp_CName
    actions
  end
  form do |empid|
    tab :api do
      text_field :emp_CName
    end
  end
end
