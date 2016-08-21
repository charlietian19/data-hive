class ResearchApplicationsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @research_application = ResearchApplication.new
    @questions = @project.questions
  end

  def create
    @app = ResearchApplication.new(app_params)
    @app.answers = params[:answers]
    @app.status = 2
    @app.project = Project.find(params[:project_id])
    if @app.save
      redirect_to @app.project
    else
      redirect_to action: 'new'
    end
  end

  def show
    @app = ResearchApplication.find(params[:id])
    @questions = @app.project.questions
    @answers = @app.answers
  end

  def bookmark
    @project = Project.find(params[:project_id])
    ResearchApplication.create(project: @project, user: current_user, status: 1)
    redirect_to @project
  end

  def app_params
    params.require(:research_application).permit(:user_id, :project_id, :status)
  end
end
