# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %w[admin editor viewer admin_rh rh]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable

  belongs_to :employee, class_name: 'Employee', foreign_key: :employee_id

  before_save :define_employee_id

  validate :validate_roles

  def admin?
    roles.include?('admin')
  end

  def editor?
    admin? || roles.include?('editor')
  end

  def viewer?
    admin? || roles.include?('viewer')
  end

  def rh?
    admin? || admin_rh? || roles.include?('rh')
  end

  def admin_rh?
    admin? || roles.include?('admin_rh') 
  end

  private

  def define_employee_id
    return nil if Rails.env.development?

    employee_id = Devise::LDAP::Adapter.get_ldap_param(username, 'employeeID')
    self.employeeid = employee_id.first.to_s unless employee_id.nil?
  end

  def validate_roles
    roles.each do |role|
      next if ROLES.include?(role)

      errors.add(:roles, "Unknown '#{role}' role")
    end
  end
end
