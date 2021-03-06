class Web::Teacher::StudentHomeworksController < Web::Teacher::ApplicationController
  def index
    @student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids).decorate
  end

  def new
    @student_homework = StudentHomework.new
  end

  def create
    @student_homework = StudentHomework.new(student_homework_attrs)
    @student_homework.date_begin = DateTime.now

    if @student_homework.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids)
    @student_homework = student_homeworks.find(params[:id]).decorate
  end

  def edit
    student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids)
    @student_homework = student_homeworks.find(params[:id])
  end

  def update
    student_homeworks = StudentHomework.where(lesson_id: current_teacher.lessons.ids)
    @student_homework = student_homeworks.find(params[:id])

    if @student_homework.update(student_homework_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def check
    student_homework = StudentHomework.where(lesson_id: current_teacher.lessons.ids).find(params[:student_homework_id])
    student_homework.check!
    redirect_to action: :index
  end

  def modify
    student_homework = StudentHomework.where(lesson_id: current_teacher.lessons.ids).find(params[:student_homework_id])
    student_homework.modify!
    redirect_to action: :index
  end

  def adopted
    student_homework = StudentHomework.where(lesson_id: current_teacher.lessons.ids).find(params[:student_homework_id])
    student_homework.date_end = DateTime.now
    student_homework.adopted!
    redirect_to action: :index
  end

  private

  def student_homework_attrs
    params.require(:student_homework).permit(:raiting, :student_comment, :teacher_comment, :date_begin, :date_end, :link_homework, :student_id, :lesson_id)
  end
end
