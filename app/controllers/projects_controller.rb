class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @tags = Tag.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.add_tags(@project, params[:skills])
      @project.add_tags(@project, params[:courses])
      redirect_to @project
    else
      redirect_to action: 'new'
    end
  end

  def project_params
    params.require(:project).permit(:title, :startdate, :enddate, :app_deadline, :description,
                                    :hours_per_week, :compensation, :education_level, :state)
  end
end
