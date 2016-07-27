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
    if @project.save
      # @project.add_tags(@project, params[:skills])
      # @project.add_tags(@project, params[:courses])
      byebug
      @project.add_positions(@project, project_position_params)
      redirect_to @project
    else
      redirect_to action: 'new'
    end
  end

  def project_params
    params.require(:project).permit(:title, :subtitle, :startdate, :enddate, :app_deadline, :description,
                                    :hours_per_week, :compensation, :education_level, :state, :field)
  end

  def project_position_params
    params.require(:project).permit(:position1, :position2, :position3, :position4, :position5)
  end
end
