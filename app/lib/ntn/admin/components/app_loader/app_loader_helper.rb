# frozen_string_literal: true

module Ntn
  module Admin
    module Components
      module AppLoader
        module AppLoaderHelper
          def app_loader(**, &yield_block)
            AppLoaderComponent.new(**, yield_block:)
          end
        end
      end
    end
  end
end
