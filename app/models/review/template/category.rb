# frozen_string_literal: true

module Review
  class Template
    class Category

      include Ntn::Configurable

      def initialize(
        
      )

      include ActiveModel::Attributes
      include ActiveModel::Validations

      def initialize(title:, questions:)
        self.title = title
        self.question = questions
      end


      def initialize(title:, questions:)
        @title = title
        @questions = questions.map { Question.new(_1) }
      end

      attr_reader :title, :questions
    end
  end
end

