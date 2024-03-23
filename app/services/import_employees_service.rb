# frozen_string_literal: true

class ImportEmployeesService < Service
  
  def initialize(file:)
    @file = file
  end

  attr_reader :file

  def call
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
  end
end
