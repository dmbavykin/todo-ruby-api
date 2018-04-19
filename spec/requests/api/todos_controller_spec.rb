# frozen_string_literal: true

module Api
  describe TodosController, type: :request do
    let!(:user) { create(:user) }
    let!(:headers) { user.create_new_auth_token }
    let!(:project) { create(:project, user: user) }

    context 'POST #create' do
      it 'returns status code 201' do
        post api_project_todos_path(project), headers: headers, params: attributes_for(:todo).stringify_keys
        expect(response).to have_http_status(201)
      end

      it 'creates todo' do
        expect { post api_project_todos_path(project), headers: headers, params: attributes_for(:todo).stringify_keys }.to change(Todo, :count).by(1)
      end
    end

    context 'GET #show' do
      before do
        todo = create(:todo, project: project)
        get api_project_todo_path(project, todo), headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'PUT #update' do
      before do
        todo = create(:todo, project: project)
        put api_project_todo_path(project, todo), headers: headers, params: attributes_for(:todo).stringify_keys
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'DELETE #destroy' do
      it 'removes project' do
        todo = create(:todo, project: project)
        expect{ delete api_project_todo_path(project, todo), headers: headers }.to change(Todo, :count).by(-1)
      end
    end
  end
end
