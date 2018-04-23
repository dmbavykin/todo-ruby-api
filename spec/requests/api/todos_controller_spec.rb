# frozen_string_literal: true

module Api
  describe TodosController, type: :request do
    let!(:user) { create(:user) }
    let!(:headers) { user.create_new_auth_token }
    let!(:project) { create(:project, user: user) }
    let!(:todo_params) { attributes_for(:todo, project: project).stringify_keys }

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
        put api_project_todo_path(project, todo), headers: headers, params: todo_params
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'changes todo content' do
        expect(Todo.last.content).to eq(todo_params['content'])
      end
    end

    context 'DELETE #destroy' do
      it 'removes project' do
        todo = create(:todo, project: project)
        expect{ delete api_project_todo_path(project, todo), headers: headers }.to change(Todo, :count).by(-1)
      end
    end

    context 'POST #sorting' do
      before do
        @first_todo = create(:todo, project: project)
        @second_todo = create(:todo, project: project)
        post api_project_todos_sorting_path(project), headers: headers, params: {
          todos: [
            { id: @first_todo.id, order: 2 },
            { id: @second_todo.id, order: 1 }
          ]
        }
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates order' do
        expect(Todo.find_by(id: @first_todo.id).order).to eq(2)
        expect(Todo.find_by(id: @second_todo.id).order).to eq(1)
      end
    end
  end
end
