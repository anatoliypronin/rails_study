class Admin::StudentsController < Admin::ApplicationController
  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_attrs)

    if @student.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    redirect_to action: :index
  end

  private

  def student_attrs
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number)
  end
end