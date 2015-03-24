describe TasksController do
  describe 'GET /tasks' do
    context 'Client Accepts JSON' do
      it 'returns all the tasks as json' do
        header 'ACCEPT', 'application/json'
        get '/tasks'

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq Task.all().to_json
      end
    end

    context 'Client Accepts HTML' do
      it 'returns all the tasks as html' do
        names = Task.all().map { |task| task.name }

        get '/tasks'

        expect(last_response.status).to eq 200
        expect(last_response.body).to have_tag('li', text: /#{names.join("|")}/, count: 3)
      end
    end
  end
end
