describe App do
  describe 'GET /' do
    it 'returns Hello World' do
      get '/'
      expect(last_response.body).to eq('Hello World!')
    end
  end
end
