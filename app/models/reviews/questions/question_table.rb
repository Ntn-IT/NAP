# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionTable < Question

      class Column 
        include ActiveModel::API

        attr_accessor :title, :width, :input, :input_options

        def input_options
          @input_options || {}
        end
      end


      attr_accessor :line_title, :labels, :default_lines, :columns, :rows

      def merge_answers(answers)
        answers['rows'].each do |(str_row_key, row_answers)|
          row_answers.each do |(str_question_key, question_answer)|
            rows[str_row_key.to_i][str_question_key.to_i] = question_answer
          end
        end
      end

      def rows
        @rows ||= default_lines.times.map do |_title|
          columns.map do |question|
            nil
          end
        end
      end

      def columns=(columns)
        @columns = columns.map do |column|
          Column.new(column)
        end
      end
  
    end
  end
end
