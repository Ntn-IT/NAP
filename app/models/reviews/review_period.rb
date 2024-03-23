# frozen_string_literal: true

module Reviews
  class ReviewPeriod < ApplicationRecord
    
    enum status: { in_progress: "in_progress", finished: "finished" }

    validate :validate_in_progress

    private

    def validate_in_progress
      return unless in_progress?
      return unless self.class.all.any? { _1.in_progress? }

      errors.add(:status, "Veuillez cloturer la campagne d'entretien en cours")
    end

  end
end
