# frozen_string_literal: true

class Personne < ApplicationRecord
  belongs_to :user, foreign_key:"m1", optional: true
  paginates_per 50
end
