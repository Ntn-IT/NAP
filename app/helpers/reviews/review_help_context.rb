# frozen_string_literal: true

module Reviews
    class ReviewHelpContext < Ntn::HelperContext
      self.context_name = :review_context
  
      
      
      def print_button_watermark(record)
        vc.primary_button(
          url: build_model_url(Reviews::Review, action: :print, params: record),
          policy: [record, :print_watermark?],
          text: t("Imprimer entretien prérempli"),
          turbo: false,
          target: "_blank"
        )
      end
    end
  
  end