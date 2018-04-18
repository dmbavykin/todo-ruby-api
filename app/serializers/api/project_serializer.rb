module Api
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
end
