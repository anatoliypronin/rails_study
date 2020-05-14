class Web::ProfessionsController < Web::ApplicationController
  def index
    @professions = Profession.all.decorate
  end

  def show
    @profession = Profession.find(params[:id])
  end
end
