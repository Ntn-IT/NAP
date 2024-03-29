# frozen_string_literal: true

module Reviews
  class ReviewComponent < ::Ntn::Component
    configure(
      review: nil,
      form: nil,
      page: nil
    )

    def document
      @document ||= review.document
    end

    def page?
      page
    end

    def form?
      !page
    end

    def disabled
      page?
    end

    attr_reader :form

    def review_question(question, form, **)
      Questions::QuestionComponent.build(
        question,
        review_component: self,
        form:,
        **
      )
    end
  end
end
