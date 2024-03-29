# frozen_string_literal: true

module Reviews
  module ReviewHelper
    def review_page(review, form, **kwargs)
      ReviewComponent.new(review:, form:, page: true, **kwargs)
    end

    def review_form(review, form, **kwargs)
      ReviewComponent.new(review:, form:, page: false, **kwargs)
    end
  end
end
