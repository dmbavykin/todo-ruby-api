# frozen_string_literal: true

describe Todo, type: :model do
  context 'check relations' do
    it 'belongs to project' do
      is_expected.to belong_to(:project)
    end

    it 'has many comments' do
      is_expected.to have_many(:comments)
    end
  end

  context 'validate' do
    %i[content order].each do |field|
      it "validates presence of #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end
end
