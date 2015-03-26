require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET 'home'" do
    before{get 'home'}
    specify{expect(response).to be_success}
    specify{expect(response).to render_template(:home)}
  end
end
