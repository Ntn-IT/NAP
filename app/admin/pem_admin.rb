# frozen_string_literal: true

Trestle.admin(:pem) do
  menu do
    group :applications, priority: :first do
      item :Pem, icon: 'fa fa-key'
    end
  end
end
