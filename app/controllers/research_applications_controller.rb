class ResearchApplicationsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @research_application = ResearchApplication.new
    @questions = @project.questions
    @submitted = !ResearchApplication.where(user: current_user, proejct: @project, status: 2).empty?
  end

  def create
    @app = ResearchApplication.new(app_params)
    @app.answers = params[:answers]
    @app.status = 'submitted'
    @app.project = Project.find(params[:project_id])
    if @app.save
      redirect_to @app.project
    else
      redirect_to action: 'new'
    end
  end

  def bookmark
    @project = Project.find(params[:project_id])
    ResearchApplication.create(project: @project, user: current_user, status: 2)
    redirect_to @project
  end

  def app_params
    params.require(:research_application).permit(:user_id, :project_id, :status)
  end
end
