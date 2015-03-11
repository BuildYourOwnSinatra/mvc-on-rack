describe Task do
	it "should return all the tasks" do
		Task.all().length.should equal 3
		Task.all()[0].should be_an_instance_of Task
	end
end
