# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :todos, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
end
