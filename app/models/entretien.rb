# frozen_string_literal: true

class Entretien < ApplicationRecord
  has_one :user
  paginates_per 650
end
