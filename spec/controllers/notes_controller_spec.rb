require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe NotesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }
  let(:valid_attributes) { { title: "Test Note", content: "This is a test note" } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Note" do
      expect {
        post :create, params: { note: valid_attributes }
      }.to change(Note, :count).by(1)
    end

    it "redirects to the created note" do
      post :create, params: { note: valid_attributes }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(Note.last)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      note = Note.create! valid_attributes.merge(user: user)
      get :show, params: { id: note.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      note = Note.create! valid_attributes.merge(user: user)
      get :edit, params: { id: note.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { { title: "Updated Title", content: "Updated content" } }

    it "updates the requested note" do
      note = Note.create! valid_attributes.merge(user: user)
      put :update, params: { id: note.to_param, note: new_attributes }
      note.reload
      expect(note.title).to eq "Updated Title"
      expect(note.content).to eq "Updated content"
    end

    it "redirects to the note" do
      note = Note.create! valid_attributes.merge(user: user)
      put :update, params: { id: note.to_param, note: valid_attributes }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(note)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested note" do
      note = Note.create! valid_attributes.merge(user: user)
      expect {
        delete :destroy, params: { id: note.to_param }
      }.to change(Note, :count).by(-1)
    end

    it "redirects to the notes list" do
      note = Note.create! valid_attributes.merge(user: user)
      delete :destroy, params: { id: note.to_param }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(notes_url)
    end
  end
end