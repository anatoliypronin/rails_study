class Web::Student::ProfilesController < Web::Student::ApplicationController
  def edit
    @student = current_student
  end

  def update
    @student = current_student

    if @student.update(student_attrs)
      redirect_to student_profile_path
    else
      render action: :edit
    end
  end

  def show
    @student = current_student.decorate
    @hash_graph = hash_graph(@student)
  end

  def delete_photo
    @student = current_student
    @student.update(photo: nil)
    render action: :edit
  end

  private

  def hash_graph(student)
    result = {}
    student.student_homeworks.where.not(raiting: nil).each do |sh|
      lesson = Lesson.find(sh.lesson_id)
      result[lesson.title] = sh.raiting
    end
    result
  end

  def student_attrs
    params.require(:student).permit(:first_name, :last_name, :phone_number, :email, :student_id, :photo)
  end
end
