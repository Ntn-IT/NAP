# frozen_string_literal: true

module Reviews
  class ReviewDocument
    include ActiveModel::Model

    attr_accessor :title, :description, :questions_categories

    def questions_categories=(questions_categories)
      @questions_categories = questions_categories
    end
  end
end
