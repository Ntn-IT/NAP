# frozen_string_literal: true

module Reviews
  module Page
    class PageComponent < ::Ntn::Component

      configure(
        review: nil
      )

      def document
        @document ||= review.document
      end

    end
  end
end
