# frozen_string_literal: true

Trestle.admin(:dashboard) do
  menu do
    item :"Tableau de bord", icon: 'fa fa-tachometer'
  end

  controller do
    def index; end
  end
end
