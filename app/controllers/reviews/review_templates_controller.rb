# frozen_string_literal: true

module Reviews 

  class ReviewTemplatesController < ApplicationController

    def index_init_query
      Reviews::ReviewTemplate.all
    end
  
    def index_sort_scopes
      {
        created_at: ->(query, order) { query.order(created_at: order) }
      }
    end
  end

end