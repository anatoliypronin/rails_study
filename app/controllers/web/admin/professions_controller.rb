class Web::Admin::ProfessionsController < Web::Admin::ApplicationController
  def index
    @search = Profession.ransack(params[:q])
    @pagy, @professions = pagy(@search.result)
  end

  def new
    @profession = Profession.new
    authorize @profession
  end

  def create
    @profession = Profession.new(profession_attrs)

    if @profession.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @profession = Profession.find(params[:id]).decorate
  end

  def edit
    @profession = Profession.find(params[:id])
    authorize @profession
  end

  def update
    @profession = Profession.find(params[:id])

    if @profession.update(profession_attrs)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def del
    profession = Profession.find(params[:profession_id])
    profession.del!
    redirect_to action: :index
  end

  def restore
    profession = Profession.find(params[:profession_id])
    profession.restore!
    redirect_to action: :index
  end

  private

  def profession_attrs
    params.require(:profession).permit(:title, :description, course_ids: [])
  end
end
