class ProjectsController < ApplicationController
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.assign_attributes(project_params)

    if @project.save
      redirect_to edit_project_path(@project), notice: "yeah good"
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, tasks_attributes: [:_destroy, :id, :name])
  end
end
