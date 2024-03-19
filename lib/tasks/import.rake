# frozen_string_literal: true

require 'csv'
require 'json'

def parse_date(date)
  Date.strptime(date, '%m/%d/%Y')
end

namespace :import do
  desc 'Importer employees depuis un csv'
  task employee: [:environment] do
    # En dev on utilise un fichier de fixtures
    # TODO: faire le process pour la production
    csv_file = 'lib/tasks/fixtures/employes.csv'

    CSV.foreach(csv_file, col_sep: ',', headers: true) do |row|
      employee_hash = row.to_hash.symbolize_keys

      id = employee_hash[:id] = employee_hash.delete(:mathr)

      employee_hash[:created_at] = parse_date(employee_hash[:created_at])
      employee_hash[:updated_at] = parse_date(employee_hash[:updated_at])

      employee = Employee.find_by(id:)
      next employee.update!(employee_hash) if employee
      
      Employee.create!(employee_hash)

      Rails.logger.info('Employee correctly imported')
    end
  rescue StandardError => e
    BugNotifierService.call(e)

    raise
  end

  #---------------------------------------------------------------------------------------------

  desc 'Import de la structures des templates des entretiens pour les Ouvriers'
  task review_template_ouvrier: [:environment] do
    json_file = "lib/tasks/fixtures/ouvrier.json"
    # [ouvrier cadre].each do |status|
    raw_data = File.read(json_file)
    parsed_data = JSON.parse(raw_data)
    json_data = JSON.generate(parsed_data)
    puts json_data

  rescue StandardError => e
    BugNotifierService.call(e)

    raise
  end
  
  desc 'Import de la structures des templates des entretiens pour les Cadres'
  task review_template_cadre: [:environment] do
    json_file = "lib/tasks/fixtures/cadre.json"
    # [ouvrier cadre].each do |status|
    raw_data = File.read(json_file)
    parsed_data = JSON.parse(raw_data, symbolize_names: true)
    puts parsed_data

  rescue StandardError => e
    BugNotifierService.call(e)

    raise
  end
end
