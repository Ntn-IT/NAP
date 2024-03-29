# frozen_string_literal: true

class ReviewsContext < Ntn::HelperContext
  Reviews::ReviewContext.define_context_method(self)
  Reviews::ReviewTemplateContext.define_context_method(self)
  Reviews::ReviewCampaignContext.define_context_method(self)

  self.context_name = :reviews
end
