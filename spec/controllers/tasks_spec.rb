describe "TasksController" do 
	it "should return all tasks" do
		get '/tasks'
		last_response.status.should == 200
		last_response.body.should == Task.all().to_json
	end
end
