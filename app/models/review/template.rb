# frozen_string_literal: true

module Review
  class Template < ApplicationRecord
    self.table_name = 'review_templates'

    def template
      template = super.map { Category.new(**_1.deep_symbolize_keys) }
    end
  end
end
