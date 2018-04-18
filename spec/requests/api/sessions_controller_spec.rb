# frozen_string_literal: true

module Api
  describe SessionsController, type: :request do
    let!(:user) { create(:user) }

    context 'successful sign in' do
      before { login(user) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
