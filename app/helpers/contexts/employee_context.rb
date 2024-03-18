# frozen_string_literal: true

module Contexts
  class EmployeeContext < Ntn::HelperContext
    configure(
      context_name: :employee_context,

      attributes: {
        id: {
          header: t('Mathr'),
          value: proc { |vc, rec| vc.record_link(rec) }
        },
        fname: {
          header: t('First name'),
          value: proc { |_vc, rec| rec.fname }
        },
        lname: {
          header: t('Last name'),
          value: proc { |_vc, rec| rec.lname }
        },
        cname: {
          header: t('Complete name'),
          value: proc { |_vc, rec| rec.cname }
        },
        matsnr: {
          header: t('Matsnr'),
          value: proc { |_vc, rec| rec.matsnr }
        },
        department: {
          header: t('Department'),
          value: proc { |_vc, rec| rec.department }
        },
        service: {
          header: t('Service'),
          value: proc { |_vc, rec| rec.service }
        },
        manager: {
          header: t('Manager'),
          value: proc { |vc, rec| vc.record_link(rec.manager, :cname) }
        },
        qualification: {
          header: t('Qualification'),
          value: proc { |_vc, rec| rec.qualification }
        },
        bdate: {
          header: t('Birthdate'),
          value: proc { |vc, rec| vc.date_format(rec.bdate) }
        },
        status: {
          header: t('Status'),
          value: proc { |_vc, rec| rec.status }
        }
      }
    )
  end
end
