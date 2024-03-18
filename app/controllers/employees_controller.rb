# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :define_employee, only: %i[show]

  def index_init_query
    Employee.all
  end

  def index_search_scopes
    {
      cname: ->(query, value) { query.where('cname ILIKE ?', "%#{sanitize_sql_like(value)}%") }
    }
  end

  def index_sort_scopes
    {
      created_at: ->(query, order) { query.order(created_at: order) }
    }
  end

  def show
    authorize(@employee)
  end

  private

  def define_employee
    @employee = Employee.find(params[:id])
  end
end
