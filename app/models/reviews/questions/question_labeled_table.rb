# frozen_string_literal: true

module Reviews
  module Questions
    class QuestionLabeledTable < QuestionTable
      attr_accessor :labels

      def rows
        @rows ||= labels.map do |_title|
          columns[1..].map do |question|
            nil
          end
        end
      end

    end
  end
end
