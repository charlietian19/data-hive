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
    @compensations = Project.compensations.keys
    @fields = Project.fields.keys
  end

  def create
    @project = Project.new(project_params)
    @project.positions = params[:positions]
    byebug
    if @project.save
      @project.add_questions(@project, params[:questions])
      # @project.add_tags(@project, params[:skills])
      # @project.add_tags(@project, params[:courses])
      redirect_to @project
    else
      redirect_to action: 'new'
    end
  end

  def project_params
    params.require(:project).permit(:title, :subtitle, :startdate, :enddate, :app_deadline,
                                    :description, :hours_per_week, :compensation, :education_level, :field,
                                    positions: [])
  end
end
