# frozen_string_literal: true

module Reviews
  class ReviewTemplateContext < Ntn::HelperContext
    self.context_name = :review_template_context

    attributes(
      title: {
        name: t('Titre du modèle'),
        value: proc { |vc, rec| vc.record_link(rec, :title) },
        field: proc { |_vc, form| form.text_field(:title) }
      },
      application_filter: {
        name: t("Filtre d'application"),
        value: proc { |_vc, rec| rec.application_filter },
        field: proc do |_vc, form|
          form.textarea_field(:application_filter, rows: 3)
        end
      },
      json_document: {
        name: t('Document JSON'),
        value: proc do |vc, rec|
          vc.tag.code do
            vc.tag.pre do
              rec.json_document_as_string
            end
          end
        end,
        field: proc do |_vc, form|
          form.textarea_field(:json_document_as_string, rows: 30)
        end
      }
    )
  end
end
