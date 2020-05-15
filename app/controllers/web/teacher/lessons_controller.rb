class Web::Teacher::LessonsController < Web::Teacher::ApplicationController
  def index
    @lessons = Lesson.where(teacher: lesson.course.teacher).decorate
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_attrs)

    if @lesson.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    lesson = Lesson.find(params[:lesson_id])
    lesson.del!
    redirect_to action: :index
  end

  def restore
    lesson = Lesson.find(params[:lesson_id])
    lesson.restore!
    redirect_to action: :index
  end

  def lesson_attrs
    params.require(:lesson).permit(:title, :description, :homework, :course_id)
  end
end
