describe WeatherController do
  describe 'GET /weather/status' do
    it "returns the weather's status" do
      get '/weather/status'
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq 'It is sunny with a slight chance of apocalypse!'
    end
  end
end
