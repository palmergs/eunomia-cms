require 'rails_helper'

RSpec.describe DataInstancesController, as: :controller do
  describe '#index' do
    it 'requires a data template id' do
      dt = create(:data_template)
      get :index, data_template_id: dt.id
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'is successful' do
      dt = create(:data_template)
      get :new, data_template_id: dt.id
      expect(response).to be_success
    end
  end

  describe '#show' do
    it 'is successful' do
      di = create(:data_instance)
      get :show, data_template_id: di.data_template_id, id: di.id
      expect(response).to be_success
    end
  end
end
