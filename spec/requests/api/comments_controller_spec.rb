# frozen_string_literal: true

module Api
  describe CommentsController, type: :request do
    let!(:user) { create(:user) }
    let!(:headers) { user.create_new_auth_token }
    let!(:project) { create(:project, user: user) }
    let!(:todo) { create(:todo, project: project) }
    let!(:comment_params) { attributes_for(:comment, todo: todo).stringify_keys }

    context 'GET #index' do
      it 'returns status code 200' do
        get api_project_todo_comments_path(project, todo), headers: headers
        expect(response).to have_http_status(200)
      end

      it 'returns data' do
        comment = create(:comment, todo: todo)
        get api_project_todo_comments_path(project, todo), headers: headers
        expect(json).not_to be_nil
      end
    end

    context 'POST #create' do
      it 'returns status code 201' do
        post api_project_todo_comments_path(project, todo), headers: headers, params: comment_params
        expect(response).to have_http_status(201)
      end

      it 'creates todo' do
        expect {
          post api_project_todo_comments_path(project, todo), headers: headers, params: comment_params
        }.to change(Comment, :count).by(1)
      end
    end

    context 'DELETE #destroy' do
      it 'removes project' do
        comment = create(:comment, todo: todo)
        expect{ delete api_project_todo_comment_path(project, todo, comment), headers: headers }.to change(Comment, :count).by(-1)
      end
    end
  end
end
