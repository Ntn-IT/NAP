# frozen_string_literal: true

module Reviews

  class ReviewContext < Ntn::HelperContext
    self.context_name = :review_context

    attributes(
      title: {
        name: t('Tire'),
        value: proc do |vc, rec| 
          vc.record_link(
            rec,
            text: "#{rec.review_period.title} - #{ rec.json_document["title"] } "
          ) 
        end
      },

      employee: EmployeeContext.bind_attribute(:link) { |rec| rec.employee },
      
      manager: EmployeeContext.bind_attribute(:link, name: t("Manager") ) { |rec| rec.manager },

      status: {
        name: t('Statut'),
        value: proc { |vc, rec| rec.status }
      },
    )

  end
  
end