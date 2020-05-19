class Web::Admin::CoursesController < Web::Admin::ApplicationController
  def index
    @pagy, @courses = pagy(Course.all)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_attrs)

    if @course.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @course = Course.find(params[:id]).decorate
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def del
    course = Course.find(params[:course_id])
    course.del
    redirect_to action: :index
  end

  def restore
    course = Course.find(params[:course_id])
    course.restore
    redirect_to action: :index
  end

  private

  def course_attrs
    params.require(:course).permit(:title, :description, :teacher_id, profession_ids: [])
  end
end
