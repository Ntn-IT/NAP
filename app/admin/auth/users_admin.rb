# frozen_string_literal: true

Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :"Administration du site", priority: :last do
      item :"Site Users", icon: 'fas fa-users'
    end
  end

  table do
    column :avatar, header: false do |user|
      avatar_for(user)
    end
    column :email, link: true
    column :first_name
    column :last_name
    column :matsnr
    column :mathr
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |_user|
    text_field :email

    row do
      col(sm: 6) { text_field :first_name }
      col(sm: 6) { text_field :last_name }
    end
    row do
      col(sm: 6) { text_field :mathr }
      col(sm: 6) { text_field :matsnr }
    end
    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
  end
end
