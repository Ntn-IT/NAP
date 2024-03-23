# frozen_string_literal: true

class User < ApplicationRecord
  #before_save :get_last_name, :get_first_name, :get_mail, :get_employee_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable

  ROLES = %w[admin editor viewer]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :employee, class_name: 'Employee', foreign_key: :employee_id

  before_save :define_employee_id

  validate :validate_roles

  def admin?
    roles.include?('admin')
  end

  def editor?
    roles.include?('editor')
  end

  def viewer?
    roles.include?('viewer')
  end

  private

  def get_last_name
    last_name = Devise::LDAP::Adapter.get_ldap_param(username, 'sn')
    self.last_name = last_name.first.force_encoding('UTF-8') unless last_name.nil?
  end

  def get_first_name
    first_name = Devise::LDAP::Adapter.get_ldap_param(username, 'givenName')
    self.first_name = first_name.first.force_encoding('UTF-8') unless first_name.nil?
  end

  def get_mail
    mail = Devise::LDAP::Adapter.get_ldap_param(username, 'mail')
    self.mail = mail.first.to_s unless mail.nil?
  end

  def define_employee_id
    return if Rails.env.devlopment?
    #employee_id = Devise::LDAP::Adapter.get_ldap_param(username, 'employeeID')
    #self.employee_id = employee_id.first.to_s unless employee_id.nil?
  end

   def validate_roles
    roles.each do |role|
      next if ROLES.include?(role)

      errors.add(:roles, "Unknown '#{role}' role")
    end
  end
end
