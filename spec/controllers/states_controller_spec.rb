require 'rails_helper'

describe CitiesController, type: :controller do 
    it 'responds successfully to index' do    
      get :index, params: {name: "para"}
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
end