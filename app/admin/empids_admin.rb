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
    tab :apis, badge: empids.apis.size do
      table empid.apis, admin: :apis do
        column :api_M1, link: true
        column :done, align: :center
        column :created_at, align: :center
        actions
      end

      concat admin_link_to("New Task", admin: :apis, action: :new, params: { empid_id: empid }, class: "btn btn-success")
    end
  end
end
