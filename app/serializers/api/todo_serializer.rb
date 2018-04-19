module Api
  class TodoSerializer < ActiveModel::Serializer
    attributes :id, :content, :order, :is_done, :expiration_date
  end
end
