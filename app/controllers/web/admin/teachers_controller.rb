class Web::Admin::TeachersController < Web::Admin::ApplicationController
  def index
    @pagy, @teachers = pagy(Teacher.all)
  end

  def new
    @teacher = Teacher.new
    authorize @teacher
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
    @teacher = Teacher.find(params[:id]).decorate
  end

  def edit
    @teacher = Teacher.find(params[:id])
    authorize @teacher
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    teacher = Teacher.find(params[:teacher_id])
    teacher.del!

    redirect_to action: :index
  end

  def restore
    teacher = Teacher.find(params[:teacher_id])
    teacher.restore!

    redirect_to action: :index
  end

  private

  def teacher_attrs
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :description)
  end
end
