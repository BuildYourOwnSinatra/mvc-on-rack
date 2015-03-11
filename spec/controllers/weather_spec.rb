describe "WeatherController" do 
	it "should return the weather's status" do
		get '/weather/status'
		last_response.status.should == 200
		last_response.body.should == "It is sunny with a slight chance of apocalypse!"
	end
end
