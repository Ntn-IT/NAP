# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Action
        module ActionHelper
          def action(css_factory: nil, css: nil, **, &yield_block)
            ActionComponent.new(
              css: "#{css_factory} #{css}".strip,
              yield_block:,
              **
            )
          end

          def link(**, &)
            action(css_factory: 'link', **, &)
          end

          def button(**, &)
            action(css_factory: 'btn btn-default', **, &)
          end

          def primary_button(**, &)
            action(css_factory: 'btn btn-primary', **, &)
          end

          def secondary_button(**, &)
            action(css_factory: 'btn btn-secondary', **, &)
          end

          def success_button(**, &)
            action(css_factory: 'btn btn-success', **, &)
          end

          def info_button(**, &)
            action(css_factory: 'btn btn-info', **, &)
          end

          def warning_button(**, &)
            action(css_factory: 'btn btn-warning', **, &)
          end

          def danger_button(**, &)
            action(css_factory: 'btn btn-danger', **, &)
          end

          def light_button(**, &)
            action(css_factory: 'btn btn-light', **, &)
          end

          def dark_button(**, &)
            action(css_factory: 'btn btn-dark', **, &)
          end

          def submit_button(text: 'Envoyer', **, &)
            primary_button(text:, type: 'submit', **, &)
          end

          def save_button(text: 'Enregistrer', **, &)
            submit_button(text:, **, &)
          end

          def reset_button(text: 'Annuler', **, &)
            secondary_button(text:, type: 'reset', **, &)
          end

          def record_link(record, text_attribute = :id, **, &)
            link(
              text: record && text_attribute ? record.send(text_attribute) : nil,
              url: build_model_url(record&.class, params: record&.id),
              policy: [record, :show?],
              **,
              &
            )
          end

          def new_record_button(model, text: '+ Nouveau', **, &)
            primary_button(
              text:,
              url: build_model_url(model, action: :new),
              policy: [model, :new?],
              **,
              &
            )
          end

          def edit_record_button(record, text: 'Modifier', **, &)
            secondary_button(
              text:,
              url: build_model_url(record&.try(:klass) || record&.class, action: :edit, params: record&.id),
              policy: [record, :edit?],
              **,
              &
            )
          end

          def delete_record_button(record, text: 'Supprimer', **, &)
            danger_button(
              text:,
              url: build_model_url(record&.try(:klass) || record&.class, params: record&.id),
              policy: [record, :destroy?],
              method: :delete,
              **,
              &
            )
          end
        end
      end
    end
  end
end
