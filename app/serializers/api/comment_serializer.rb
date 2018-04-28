module Api
  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :todo_id, :custom_created_at, :file

    def custom_created_at
      object.created_at.strftime('%d/%m/%y')
    end
  end
end
