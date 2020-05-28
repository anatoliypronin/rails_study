class Web::Admin::LessonsController < Web::Admin::ApplicationController
    def index
      @search = Lesson.ransack(params[:q])
      @pagy, @lessons = pagy(@search.result)
    end
  
    def new
      @lesson = Lesson.new
      authorize @lesson
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
      @lesson = Lesson.find(params[:id]).decorate
    end
  
    def edit
      @lesson = Lesson.find(params[:id])
      authorize @lesson
    end
  
    def update
      @lesson = Lesson.find(params[:id])
  
      if @lesson.update(lesson_attrs)
        redirect_to action: :show
      else
        render action: :edit
      end
    end
  
    def del
      lesson = Lesson.find(params[:lesson_id])
      lesson.del
      redirect_to action: :index
    end
  
    def restore
      lesson = Lesson.find(params[:lesson_id])
      lesson.restore
      redirect_to action: :index
    end
  
    private
  
    def lesson_attrs
      params.require(:lesson).permit(:title, :description, :homework, :course_id)
    end
  end
  