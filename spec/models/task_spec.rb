describe Task do
  describe '.all' do
    it 'returns all the tasks' do
      expect(Task.all().length).to eq 3
      expect(Task.all()[0]).to be_an_instance_of Task
    end
  end
end
