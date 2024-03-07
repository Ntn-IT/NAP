# frozen_string_literal: true

class User < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  has_many :entretiens 
  has_many :personnes

  scope(:n1, ->(current_user) { where(mathr: current_user.mathr) })
end
