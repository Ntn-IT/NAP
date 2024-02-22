Trestle.resource(:apis) do
    menu do
      group :applications, priority: :first do
        item :"1_Entretien Annuel", icon: "fa fa-handshake"
      end
    end
    form do |empid|
      connected_user = current_user.email
      for line in Empid.where(emp_M1: current_user.mat_hr).select("emp_MatHR").all 
        a = line.emp_MatHR
        b = Empid.where(emp_MatHR: a).select("emp_CName").first
        c = b.emp_CName
        total = [a,c].join(" ")
        static_field :"Matricule , Nom/Prénom", total
      end

    end 
  end

