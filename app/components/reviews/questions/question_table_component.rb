# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionTableComponent < QuestionComponent
      
      def labeled_table?
        @labeled_table ||= question.is_a?(Reviews::Questions::QuestionLabeledTable)
      end
    end
  end
end
