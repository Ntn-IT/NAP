# frozen_string_literal: true

module Reviews
  module ReviewHelper

    def review_page(review, **kwargs)
      Page::PageComponent.new(review:, **kwargs)
    end

  end
end
