# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionNotation < Question
      attr_accessor :note, :justification

      def note=(value)
        @note = value.to_i
      end
    end
  end
end
