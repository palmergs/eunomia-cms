require 'rails_helper'

RSpec.describe DataInstancesController, as: :controller do

  before(:each) { sign_in(@user = create(:user)) }

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

  describe '#edit' do
    it 'is successful' do
      di = create(:data_instance)
      get :edit, data_template_id: di.data_template_id, id: di.id
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'is successful' do
      dt = create(:data_template)
      post :create, data_template_id: dt.id, data_instance: { ident: 'title', values: {}, params: {} }
      expect(response).to redirect_to data_instance_path(id: assigns(:data_instance).id)
    end
  end

  describe '#update' do
    it 'is successful' do
      di = create(:data_instance)
      put :update, data_template_id: di.data_template_id, id: di.id, data_instance: { values: {}, params: {} }
      expect(response).to redirect_to data_instance_path(id: di.id)
    end
  end

  describe '#destroy' do
    it 'is successful' do
      di = create(:data_instance)
      delete :destroy, data_template_id: di.data_template_id, id: di.id
      expect(response).to redirect_to data_instances_path
    end
  end
end
