Trestle.resource(:entretiens) do
  remove_action :destroy, :new
  menu do
    group :"Applications", priority: :first do
      item :"Entretien", icon: 'fa fa-key'
    end
  end
  
  controller do
    def index
      @entretiens = Personne.where(m1: current_user.mathr)
    end
  end
end