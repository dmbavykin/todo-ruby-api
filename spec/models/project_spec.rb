# frozen_string_literal: true

describe Project, type: :model do
  context 'checl relations' do
    it 'has many todos' do
      is_expected.to have_many(:todos)
    end

    it 'belongs to user' do
      is_expected.to belong_to(:user)
    end
  end

  context 'validate' do
    it 'validates presence of title' do
      is_expected.to validate_presence_of(:title)
    end
  end
end
