# frozen_string_literal: true

require 'csv'

namespace :reviews do
  desc 'Local reset of reviews data'
  task local_reset: [:environment] do
    # /!\ A Décommenter une fois l'app en prod et fonctionnelle
    # raise "Not in dev environment" unless Rails.env.development?

    ActiveRecord::Base.connection.execute('truncate table review_templates')
    ActiveRecord::Base.connection.execute('truncate table review_campaigns')
    ActiveRecord::Base.connection.execute('truncate table reviews')

    file = 'ressources/review_templates.json'
    json_templates = JSON.parse(File.read(file))

    review_templates = json_templates.map do |json_template|
      review_template = Reviews::ReviewTemplate.new(
        title: json_template['title'],
        application_filter: json_template['application_filter'],
        json_document: json_template['document']
      )

      review_template.save(validate: false)

      review_template
    end

    review_campaign = Reviews::ReviewCampaign.create!(
      status: 'in_progress',
      title: '2024',
      from_date: '31/03/2023 00:00:00 +0100'.to_datetime,
      to_date: '01/04/2024 00:00:00 +0100'.to_datetime,
      review_templates:
    )

    Reviews::CreateReviewsForCampaignService.call(review_campaign:)
  end
end
