class Web::ProfessionsController < Web::ApplicationController
  def index
    @professions = Profession.active.decorate
  end

  def show
    @profession = Profession.find(params[:id]).decorate
  end
end
