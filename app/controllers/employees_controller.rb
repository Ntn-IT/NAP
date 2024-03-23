# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :define_employee, only: %i[show edit update]

  def index_init_query
    Employee.all
  end

  def index_search_scopes
    {
      names_mathrs: proc do |query, value| 
        query.where(
          "(fname ILIKE :search OR lname ILIKE :search OR id ILIKE :search)", 
          search: "%#{ sanitize_sql_like(value) }%"
        ) 
      end,
    }
  end

  def index_default_sort
    :cname
  end

  def index_default_sort_order
    :asc
  end

  def index_sort_scopes
    {
      created_at: ->(query, order) { query.order(created_at: order) },
      cname: ->(query, order) { query.order(cname: order) },
    }
  end

  def show
    authorize(@employee)
  end

  def edit
    authorize(@employee)
  end

  def update
    handle_update do
      authorize(@employee)

      @employee.update!(employee_params)
      @employee
    end
  end

  private

  def define_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    @employee_params ||= whitelisted_params(@employee || Employee)
  end
end
