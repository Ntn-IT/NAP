# frozen_string_literal: true

module Reviews
  class ImportReviewTemplatesService < Service
    
    def call
      Reviews::ReviewTemplate.statuses.each do |(status, _)|
        file = "ressources/#{status}_review_template.json"
        json_document = JSON.parse(File.read(file))
        title = json_document["title"]
  
        review_template = Reviews::ReviewTemplate.find_by(status:) || Reviews::ReviewTemplate.new
        review_template.assign_attributes(title:, status:, json_document:)
  
        review_template.save(validate: false)
      end
    end
  end
end
