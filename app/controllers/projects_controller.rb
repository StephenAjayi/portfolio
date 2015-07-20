class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "project successfully added!"
      redirect_to skill_path(@project.skill)
    else
      render :new
    end
  end

  def show
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to skill_path(@skill)
    else
      flash[:alert] = "There were errors!"
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    @project.destroy
    "Project successfully destroyed!"
    redirect_to skill_path(@skill)
  end


private
  def project_params
    params.require(:project).permit(:name, :description , :url)
  end
end
