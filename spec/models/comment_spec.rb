# frozen_string_literal: true

describe Comment, type: :model do
  context 'check relations' do
    it 'belongs to todo' do
      is_expected.to belong_to(:todo)
    end
  end

  context 'validate' do
    it "validates presence of content" do
      is_expected.to validate_presence_of(:content)
    end
  end
end
