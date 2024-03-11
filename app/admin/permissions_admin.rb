# frozen_string_literal: true

Trestle.resource(:permissions) do
  menu do
    group :"configuration des apps", priority: :first do
      item :"Gestion des droits", icon: 'fa fa-handshake'
    end
  end
end

# Customize the table columns shown on the index view.
#
# table do
#   column :name
#   column :created_at, align: :center
#   actions
# end

# Customize the form fields shown on the new/edit views.
#
# form do |permission|
#   text_field :name
#
#   row do
#     col { datetime_field :updated_at }
#     col { datetime_field :created_at }
#   end
# end

# By default, all parameters passed to the update and create actions will be
# permitted. If you do not have full trust in your users, you should explicitly
# define the list of permitted parameters.
#
# For further information, see the Rails documentation on Strong Parameters:
#   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
#
# params do |params|
#   params.require(:permission).permit(:name, ...)
# end
