require 'rails_helper'

RSpec.describe "Notes", type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { { title: "Test Note", content: "This is a test note" } }

  context "when user is not authenticated" do
    it "redirects to the login page when trying to create a note" do
      post notes_path, params: { note: valid_attributes }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "when user is authenticated" do
    before do
      sign_in user
    end

    describe "GET /notes" do
      it "returns http success" do
        get notes_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /notes/:id" do
      it "returns http success" do
        note = Note.create!(valid_attributes.merge(user: user))
        get note_path(note)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /notes/new" do
      it "returns http success" do
        get new_note_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /notes" do
      it "creates a new note and redirects" do
        expect {
          post notes_path, params: { note: valid_attributes }
        }.to change(Note, :count).by(1)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(note_path(Note.last))
      end
    end

    describe "GET /notes/:id/edit" do
      it "returns http success" do
        note = Note.create!(valid_attributes.merge(user: user))
        get edit_note_path(note)
        expect(response).to have_http_status(:success)
      end
    end

    describe "PATCH /notes/:id" do
      it "updates the note and redirects" do
        note = Note.create!(valid_attributes.merge(user: user))
        patch note_path(note), params: { note: { title: "Updated Title" } }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(note_path(note))
        note.reload
        expect(note.title).to eq "Updated Title"
      end
    end

    describe "DELETE /notes/:id" do
      it "deletes the note and redirects" do
        note = Note.create!(valid_attributes.merge(user: user))
        expect {
          delete note_path(note)
        }.to change(Note, :count).by(-1)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(notes_path)
      end
    end
  end
end