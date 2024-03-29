# frozen_string_literal: true

module Reviews
  class ReviewDocument
    include ActiveModel::Model

    attr_accessor :title, :description, :categories

    def categories=(categories)
      @categories = categories.map do |category|
        ReviewCategory.new(**category)
      end
    end

    def merge_answers(categories_answers)
      categories_answers.each do |(str_index, category_answers)|
        categories[str_index.to_i].merge_answers(category_answers['questions'])
      end
    end
  end
end
