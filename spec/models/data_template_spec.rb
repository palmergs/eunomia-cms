require 'rails_helper'

RSpec.describe DataTemplate, type: :model do
  it 'can be instantiated' do
    expect(DataTemplate.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:data_template)).to be_persisted
    expect(create(:data_template)).to be_persisted
  end

  describe 'validations' do
    it 'is not valid without a name' do
      expect(build(:data_template)).to be_valid
      expect(build(:data_template, name: nil)).to_not be_valid
      expect(build(:data_template, name: '')).to_not be_valid
      expect(build(:data_template, name: ' ')).to_not be_valid
    end
  end
end
