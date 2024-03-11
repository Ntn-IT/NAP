# frozen_string_literal: true

Trestle.admin(:abi) do
  menu do
    group :applications, priority: :first do
      item :"Demande d'invest.", icon: 'fa fa-briefcase'
    end
  end
end
