require 'rails_helper'

describe CountriesController, type: :controller do 
    it 'responds successfully to index' do 
      get :index   
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
end