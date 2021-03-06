# frozen_string_literal: true

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def identifier
    email
  end
end
