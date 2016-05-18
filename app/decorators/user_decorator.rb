class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :avatar
  delegate :path, to: :avatar, prefix: true

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
