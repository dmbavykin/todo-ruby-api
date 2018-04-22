# frozen_string_literal: true

module Api
  describe ProjectsController, type: :request do
    let!(:user) { create(:user) }
    let!(:headers) { user.create_new_auth_token }
    let!(:project_params) { attributes_for(:project).stringify_keys }


    context 'GET #index' do
      before do
        create(:project, user: user)
        get api_projects_path, headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns projects' do
        expect(json.count).to eq(user.projects.count)
      end
    end

    context 'POST #create' do
      before do
        post api_projects_path, headers: headers, params: attributes_for(:project).stringify_keys
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates project' do
        expect{ post api_projects_path, headers: headers, params: attributes_for(:project).stringify_keys }.to change(Project, :count).by(1)
      end
    end

    context 'GET #show' do
      before do
        project = create(:project, user: user)
        get api_project_path(project), headers: headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'PUT #update' do
      before do
        project = create(:project, user: user)
        put api_project_path(project), headers: headers, params: project_params
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'changes title' do
        expect(Project.last.title).to eq(project_params['title'])
      end
    end

    context 'DELETE #destroy' do
      it 'removes project' do
        project = create(:project, user: user)
        expect{ delete api_project_path(project), headers: headers }.to change(Project, :count).by(-1)
      end
    end
  end
end
