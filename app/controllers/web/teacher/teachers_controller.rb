class Web::Teacher::TeachersController < Web::Teacher::ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_attrs)

    if @teacher.save
      redirect_to action: :show
    else
      render action: :new
    end
  end

  def show
    @teacher = Teacher.find(current_teacher.id).decorate
  end

  def edit
    @teacher = Teacher.find(current_teacher.id)
  end

  def update
    @teacher = Teacher.find(current_teacher.id)

    if @teacher.update(teacher_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def teacher_attrs
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :description)
  end
end
