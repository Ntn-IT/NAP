# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module Form
        module FormHelper
          def form(**, &)
            FormComponent.new(**, &)
          end

          def record_form(record, namespace = nil, **, &)
            FormComponent.new(
              bind_to: record,
              namespace: namespace || record.class.name.demodulize.underscore,
              **,
              &
            )
          end
        end
      end
    end
  end
end
