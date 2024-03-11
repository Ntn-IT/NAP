# frozen_string_literal: true

module Review
  class Template
    class Question
      def initialize(title:, questions:)
        @title = title
        @questions = questions.map { Question.new(_1) }
      end

      attr_reader :title, :questions
    end
  end
end
