# frozen_string_literal: true

require 'csv'

def parse_date(date)
  Date.strptime(date, '%m/%d/%Y')
end

namespace :import do
  desc 'Import employee from csv file'
  task employee: [:environment] do
    # En dev on utilise un fichier de fixtures
    # TODO: faire le process pour la production
    file = 'lib/tasks/fixtures/employes.csv'

    CSV.foreach(file, col_sep: ',', headers: true) do |row|
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
end
