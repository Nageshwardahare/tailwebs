require 'rails_helper'

RSpec.describe StudentsController, type: :controller do


  let(:teacher) { FactoryBot.create(:teacher) }

  before do
    sign_in teacher
  end

  let!(:student) { create(:student) }

  describe "GET #index" do
    it "assigns @students and renders the index template" do
      get :index
      expect(assigns(:students)).to eq([student])
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested student and renders the show template" do
      get :show, params: { id: student.id }
      expect(assigns(:student)).to eq(student)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new student" do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "assigns the requested student and renders the edit template" do
      get :edit, params: { id: student.id }
      expect(assigns(:student)).to eq(student)
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new student and redirects to the index" do
        expect {
          post :create, params: { name: 'John Doe', subject: 'Math', marks: 90 }
        }.to change(Student, :count).by(1)

        expect(response).to redirect_to(students_path)
        expect(flash[:notice]).to eq("Student was successfully created or updated.")
      end
    end

    context "with invalid parameters" do
      it "does not create a new student and re-renders the new template" do
        expect {
          post :create, params: { name: '', subject: '', marks: '' }
        }.not_to change(Student, :count)

        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH/PUT #update" do
    let(:student) { FactoryBot.create(:student) }

    context "with valid parameters" do
      it "updates the student and responds with JSON success message" do
        patch :update, params: { id: student.id, student: { name: 'Jane Doe', subject: 'Science', marks: 95 }, format: :json }

        student.reload
        expect(student.name).to eq('Jane Doe')
        expect(student.subject).to eq('Science')
        expect(student.marks).to eq(95)
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['message']).to eq("Student was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "does not update the student and responds with JSON error message" do
        patch :update, params: { id: student.id, student: { name: '', subject: '', marks: '' }, format: :json }

        student.reload
        expect(student.name).not_to eq('')
        expect(student.subject).not_to eq('')
        expect(student.marks).not_to eq('')
        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)).to include("name" => ["can't be blank"], "subject" => ["can't be blank"], "marks" => ["can't be blank"])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student and redirects to the index" do
      expect {
        delete :destroy, params: { id: student.id }
      }.to change(Student, :count).by(-1)

      expect(response).to redirect_to(students_path)
      expect(flash[:notice]).to eq("Student was successfully destroyed.")
      expect(response.status).to eq(303)
    end
  end

  describe "POST #create" do
    context "with invalid parameters" do
      it "does not create a new student and re-renders the new template" do
        expect {
          post :create, params: { name: '', subject: '', marks: '' }
        }.not_to change(Student, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end
