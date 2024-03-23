# frozen_string_literal: true

module Reviews

  class ReviewTemplateContext < Ntn::HelperContext
    self.context_name = :review_template_context

    attributes(
      title: {
        name: t('Titre du modèle'),
        value: proc { |vc, rec| rec.title }
      },
      status: {
        name: t('Appliqué au statut'),
        value: proc { |vc, rec| rec.status }
      },
    )

  end
  
end