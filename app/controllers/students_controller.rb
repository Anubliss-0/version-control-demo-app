class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to root_path, notice: "Student was successfully created." }
        format.json { render json: @student, status: :created }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @student.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Student was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.expect(student: [ :name, :email ])
    end
end
