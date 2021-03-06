class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
  	@project = Project.find(params[:id])     # @project instead of @projects
	end

	def new
		@project = Project.new
	end

	def create
  	@project = Project.new(project_params)
  	
  	if @project.save
    	flash[:notice] = "Project has been created."
    	redirect_to @project
  	else
    	flash.now[:alert] = "Project has not been created."
    	render "new"
		end
	end

	private

	def project_params
  	params.require(:project).permit(:name, :description)
	end

end
