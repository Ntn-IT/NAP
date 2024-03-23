# frozen_string_literal: true

module Reviews

  class ReviewPeriodContext < Ntn::HelperContext
    self.context_name = :review_period_context

    attributes(
      title: {
        name: t('Titre de la campagne'),
        value: proc { |vc, rec| vc.record_link(rec, :title) },
        field: proc { |vc, form| form.text_field(:title) }
      },
      status: {
        name: t('Statut de la campagne'),
        value: proc { |vc, rec| rec.status }
      },
    )

  end
  
end