# frozen_string_literal: true

class UserContext < Ntn::HelperContext
  self.context_name = :user_context

  attributes(
    username: {
      name: t('Utilisateur'),
      value: proc { |vc, rec| vc.record_link(rec, :username) },
      field: proc { |vc, form| form.text_field(:username, disabled: true) }
    },

    employee: EmployeeContext.bind_attribute(:link) { |rec| rec.employee },

    roles: {
      name: t('Rôles'),
      value: proc { |vc, rec| vc.list(rec.roles) },
      field: proc { |vc, form| 
        form.list_field(
          :roles,
          multiple: true,
          optional: false,
          options: User::ROLES
        )
      }
    },

    last_sign_in_at: {
      name: t('Dernière connexion'),
      value: proc { |vc, rec| vc.date_format(rec.last_sign_in_at) }
    }
  )

end
