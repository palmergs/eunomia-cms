require 'rails_helper'

RSpec.describe DataInstance, type: :model do
  it 'can be instantiated' do
    expect(DataInstance.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:data_instance))
    expect(create(:data_instance))
  end

  describe 'validations' do
    it 'is not valid without an ident' do
      expect(build(:data_instance)).to be_valid
      expect(build(:data_instance, ident: nil)).to_not be_valid
      expect(build(:data_instance, ident: '')).to_not be_valid
    end
  end
end
