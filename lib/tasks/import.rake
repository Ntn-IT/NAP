# frozen_string_literal: true

require 'csv'

def parse_date(date)
  Date.strptime(date, '%m/%d/%Y')
end

namespace :import do
  desc 'Import employee from csv file'
  task employees: [:environment] do
    # En dev on utilise un fichier de fixtures
    # TODO: faire le process pour la production
    file = 'ressources/employes.csv'

    CSV.foreach(file, col_sep: ',', headers: true) do |row|
      employee_hash = row.to_hash.symbolize_keys

      id = employee_hash[:id] = employee_hash.delete(:mathr)

      employee_hash[:created_at] = parse_date(employee_hash[:created_at])
      employee_hash[:updated_at] = parse_date(employee_hash[:updated_at])

      employee = Employee.find_by(id:) || Employee.new
      employee.assign_attributes(employee_hash)

      employee.save(validate: false)
    end

    Rails.logger.info('Employee correctly imported')
  rescue StandardError => e
    BugNotifierService.call(e)

    raise
  end

  desc "Import des modèles d'entretiens"
  task review_templates: [:environment] do
    Reviews::ReviewTemplate.statuses.each do |(status, _)|
      file = "ressources/#{status}_review_template.json"
      template = JSON.parse(File.read(file))

      review_template = Reviews::ReviewTemplate.find_by(status:) || Reviews::ReviewTemplate.new
      review_template.assign_attributes(status:, template:)

      review_template.save(validate: false)
    end

  rescue StandardError => e
    BugNotifierService.call(e)

    raise
  end

end

