# frozen_string_literal: true

module Reviews
  module Questions
    class Question
      include ActiveModel::API

      def self.question_types_classes_map
        @question_types_classes_map ||= {
          table: QuestionTable,
          labeled_table: QuestionLabeledTable,
          notation: QuestionNotation,
          text: QuestionText
        }
      end

      def self.build(raw)
        klass = question_types_classes_map[raw[:type].to_sym] || self

        klass.new(**raw)
      end

      attr_accessor :type, :title, :description, :answer

      def merge_answers(question_answers)
        question_answers.each do |(str_key, question_answer)|
          send(:"#{str_key}=", question_answer)
        end
      end
    end
  end
end
