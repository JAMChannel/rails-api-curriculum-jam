# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  # attributes :id
  attributes :id, :name, :email
end
