class Web::Student::ProfilesController < Web::Student::ApplicationController
    def edit
      @student = current_student
    end
  
    def update
      @student = current_student
  
      if @student.update(student_attrs)
        redirect_to student_root_path
      else
        render action: :edit
      end
    end
  
    private
  
    def student_attrs
      params.require(:student).permit(:first_name, :last_name, :phone_number, :email)
    end
  end