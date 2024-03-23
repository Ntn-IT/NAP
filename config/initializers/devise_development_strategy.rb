# In config/initializers/local_override.rb:

# https://gist.github.com/jancel/1367606

require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class Development < Authenticatable
      def valid?
        true
      end

      def authenticate!
        raise unless params[:user]

        employee_id = params[:user][:username]
        user = User.find_by(employee_id:) || User.create!(employee_id:, username: employee_id)

        success!(user)
      rescue ActiveRecord::RecordInvalid => e
        raise
      rescue StandardError => e
        raise
      end
    end
  end
end

Warden::Strategies.add(:development, Devise::Strategies::Development)
