class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.find_or_initialize_by(name: params[:name], subject: params[:subject])

    @student.marks = params[:marks]

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student created successfully.'
        format.html { redirect_to students_path, notice: "Student was successfully created or updated." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        flash[:notice] = 'Student updated successfully.'
        format.json { render json: { message: "Student was successfully updated." }, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_path, status: :see_other, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :subject, :marks)
    end
end
