class Web::Teacher::LessonsController < Web::Teacher::ApplicationController
  def index
    @lessons = current_teacher.lessons.decorate
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
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def edit
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def update
    @lesson = current_teacher.lessons.find(params[:id])

    if @lesson.update(lesson_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    lesson = current_teacher.lessons.find(params[:lesson_id])
    lesson.del!
    redirect_to action: :index
  end

  def restore
    lesson = current_teacher.lessons.find(params[:lesson_id])
    lesson.restore!
    redirect_to action: :index
  end

  def lesson_attrs
    params.require(:lesson).permit(:title, :description, :homework, :course_id)
  end
end
