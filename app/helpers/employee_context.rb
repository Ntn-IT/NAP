# frozen_string_literal: true

class EmployeeContext < Ntn::HelperContext
  self.context_name = :employee_context

  attributes(
    link: {
      name: t('Employé'),
      value: proc { |vc, rec| vc.employee_context.build_record_link(rec) }
    },
    id: {
      name: t('Mathr'),
      value: proc { |vc, rec| vc.record_link(rec) }
    },
    fname: {
      name: t('Prénom'),
      value: proc { |_vc, rec| rec.fname }
    },
    lname: {
      name: t('Nom famille'),
      value: proc { |_vc, rec| rec.lname }
    },
    cname: {
      name: t('Nom'),
      value: proc { |_vc, rec| rec.cname }
    },
    email: {
      name: t('Email'),
      value: proc { |_vc, rec| rec.email }
    },
    matsnr: {
      name: t('Matsnr'),
      value: proc { |_vc, rec| rec.matsnr }
    },
    department: {
      name: t('Departement'),
      value: proc { |_vc, rec| rec.department }
    },
    service: {
      name: t('Service'),
      value: proc { |_vc, rec| rec.service }
    },
    qualification: {
      name: t('Qualification'),
      value: proc { |_vc, rec| rec.qualification }
    },
    manager: {
      name: t('Manager'),
      value: proc { |vc, rec| vc.employee_context.build_record_link(rec.manager) }
    },
    bdate: {
      name: t('Date naissance'),
      value: proc { |vc, rec| vc.date_format(rec.bdate) }
    },
    status: {
      name: t('Statut'),
      value: proc { |_vc, rec| rec.status }
    },
    subordinates: {
      name: t('Subordonnés'),
      value: proc do |vc, rec| 
        vc.list(
          rec.subordinates.map do |subordinate|
            
            vc.employee_context.build_record_link(subordinate)
          end
        )
        #vc.employee_context.build_record_link(rec.manager) 
      end
    },
  )

  def build_record_link(rec)
    vc.record_link(rec, text: "#{rec.cname}(#{rec.id})")
  end
end
