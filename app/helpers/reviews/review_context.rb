# frozen_string_literal: true

module Reviews
  class ReviewContext < Ntn::HelperContext
    self.context_name = :review_context

    attributes(
      title: {
        name: t('Entretien (Cliquez sur le lien pour commencer)'),
        value: proc do |vc, rec|
          vc.record_link(
            rec,
            text: "#{rec.review_campaign.title} - #{rec.json_document['title']} "
          )
        end
      },

      employee: EmployeeContext.bind_attribute(:link) { |rec| rec.employee },
      manager: EmployeeContext.bind_attribute(:link, name: t('Manager')) { |rec| rec.manager },



      status: {
        name: t('Statut'),
        value: proc { |_vc, rec| rec.status }
      }
    )
    
    def finish_button(record)
      vc.warning_button(
        text: t("Cloturer"),
        method: :put,
        policy: [record, :finish?],
        confirm: true, 
        confirm_text: "Cloturer l'entretien ? (vous ne pourrez plus le modifier)",
        url: build_model_url(
          Reviews::Review,
          action: :finish, 
          params: record.id,
        )
      )
    end
    
    def print_button_watermark(record)
      vc.primary_button(
        url: build_model_url(Reviews::Review, action: :print, params: record),
        policy: [record, :print_watermark?],
        text: t("Imprimer entretien prérempli"),
        turbo: false,
        target: "_blank"
      )
    end

    def help_button()
      info_button(
        text: t("Outils et supports"),
        url: "/reviews/reviews/help",
        target: "_blank" 
      )
    end

    def print_button(record)
      vc.primary_button(
        url: build_model_url(Reviews::Review, action: :print, params: record), 
        policy: [record, :print?],
        text: t("Imprimer"),
        turbo: false,
        target: "_blank"
      )
    end
  end

end
