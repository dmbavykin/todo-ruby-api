# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :project
  validates :content, :order, presence: true
end
