require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be instantiated' do
    expect(User.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:user)).to be_persisted
    expect(create(:user)).to be_persisted
  end
end
