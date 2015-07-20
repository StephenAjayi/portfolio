class SkillsController < ApplicationController

  def index
    @skills = Skill.all
    render :index
  end

  def new
    @skill = Skill.new
   render :new
 end

 def create
   @skill = Skill.new(skill_params)
   if @skill.save
     flash[:notice] = "Skill successfully added!"
     redirect_to  skills_path
   else
     flash[:alert] = "There were errors!"
     render :new
   end
 end

 def edit
   @skill = Skill.find(params[:id])
   render :edit
 end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill successfully updated!"
      redirect_to skills_path
    else
      flash[:alert] = "There were errors!"
      render :edit
    end
  end


 def show
   @skill = Skill.find(params[:id])
   render :show
 end

 def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill successfully destroyed!"
    redirect_to skills_path
  end

 private
 def skill_params
   params.require(:skill).permit(:name, :description)
   end
 end
