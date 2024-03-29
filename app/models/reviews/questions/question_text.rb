# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionText < Question
      attr_accessor :lines, :answer

      def lines
        @lines || 1
      end
    end
  end
end
