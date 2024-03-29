# frozen_string_literal: true

module Reviews
  class ReviewCampaignContext < Ntn::HelperContext
    self.context_name = :review_campaign_context

    attributes(
      title: {
        name: t('Titre de la campagne'),
        value: proc { |vc, rec| vc.record_link(rec, :title) },
        field: proc { |_vc, form| form.text_field(:title) }
      },
      from_date: {
        name: t("Début de la période d'évaluation"),
        value: proc { |vc, rec| vc.date_format(rec.from_date) },
        field: proc { |_vc, form| form.date_field(:from_date) }
      },
      to_date: {
        name: t("Fin de la période d'évaluation"),
        value: proc { |vc, rec| vc.date_format(rec.to_date) },
        field: proc { |_vc, form| form.date_field(:to_date) }
      },
      period: {
        name: t("Période d'évaluation"),
        value: proc { |vc, rec| "Du: #{vc.build(vc.date_format(rec.from_date))} au: #{vc.build(vc.date_format(rec.to_date))}" },
      },
      review_templates: {
        name: t("Modèles d'entretien"),
        value: proc do |vc, rec|
          vc.list(
            rec.review_templates.map do |review_template|
              vc.reviews.review_template_context.title.value.call(vc, review_template)
            end
          )
        end,
        field: proc do |_vc, form|
          form.list_field(
            :review_template_ids,
            multiple: true,
            optional: false,
            options: Reviews::ReviewTemplate.all.map do
              { label: _1.title, value: _1.id }
            end
          )
        end
      },
      status: {
        name: t('Statut de la campagne'),
        value: proc { |_vc, rec| rec.status }
      }
    )

    def start_button(record)
      vc.primary_button(
        text: t("Commencer"),
        method: :put,
        policy: [record, :start?],
        url: build_model_url(
          Reviews::ReviewCampaign,
          action: :start, 
          params: record.id,
        )
      )
    end
    
    def finish_button(record)
      vc.warning_button(
        text: t("Cloturer"),
        method: :put,
        policy: [record, :finish?],
        confirm: true, 
        confirm_text: "Cloturer la campagne ainsi que tous les entretiens associés ?",
        url: build_model_url(
          Reviews::ReviewCampaign,
          action: :finish, 
          params: record.id,
        )
      )
    end
    
    def destroy_button(record)
      vc.delete_record_button(
        record, 
        policy: [record, :destroy?],
        confirm: true, 
        confirm_text: "Supprimer la campagne ainsi que tous les entretiens associés ?"
      )
    end
    
  end
end
