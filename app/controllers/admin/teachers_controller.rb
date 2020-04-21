class Admin::TeachersController < Admin::ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_attrs)

    if @teacher.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy

    redirect_to action: :index
  end

  private

  def teacher_attrs
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :description)
  end
end
