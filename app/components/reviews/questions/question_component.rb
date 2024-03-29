# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionComponent < ::Ntn::Component
      def self.question_types_classes_map
        @question_types_classes_map ||= {
          table: QuestionTableComponent,
          labeled_table: QuestionTableComponent,
          notation: QuestionNotationComponent,
          text: QuestionTextComponent
        }
      end

      def self.build(question, **)
        question_types_classes_map[question.type.to_sym].new(question:, **)
      end

      configure(
        question: nil,
        review_component: nil,
        form: nil
      )

      delegate_missing_to :review_component
    end
  end
end
