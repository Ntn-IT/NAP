# frozen_string_literal: true

module Reviews
  class ReviewCategory
    include ActiveModel::API

    attr_accessor :title, :description, :questions

    def questions=(questions)
      @questions = questions.map do |question|
        Questions::Question.build(question)
      end
    end

    def merge_answers(questions_answers)
      questions_answers.each do |(str_index, question_answers)|
        questions[str_index.to_i].merge_answers(question_answers)
      end
    end
  end
end
