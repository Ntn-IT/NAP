# frozen_string_literal: true

Trestle.admin(:ptm) do
  menu do
    group :applications, priority: :first do
      item :"Gestion des essais", icon: 'fa fa-infinity'
    end
  end
end
