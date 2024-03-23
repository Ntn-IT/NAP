# frozen_string_literal: true

module Ntn
  module Admin
    module ViewHelper
      include Components::Action::ActionHelper
      include Components::Alert::AlertHelper
      include Components::App::AppHelper
      include Components::AppFrame::AppFrameHelper
      include Components::AppLoader::AppLoaderHelper
      include Components::Element::ElementHelper
      include Components::Field::FieldHelper
      include Components::Form::FormHelper
      include Components::Format::FormatHelper
      include Components::Grid::GridHelper
      include Components::Input::InputHelper
      include Components::List::ListHelper
      include Components::Pagination::PaginationHelper
      include Components::Table::TableHelper
      include Components::TableAttributes::TableAttributesHelper
    end
  end
end
