class SectionsController < ApplicationController


    def index
      @sections = Section.all
      render :index
    end

    def new
      @section = Section.new
      render :new
    end

    def show
      @section = Section.find(params[:id])
      render :show
    end

    def create
      @section = Section.new(section_params)
      if @section.save
        flash[:notice] = "Section successfully added!"
        redirect_to sections_path
      else
        render :new
      end
    end

    def edit
      @section = Section.find(params [:id])
      render :edit
    end

    def update
     @section = Section.find(params [:id])
     if @section.update(section_params)
       redirect_to sections_path
     else
       render :edit
     end
    end

    def destroy
      @section = Section.find(params[:id])
      @section.destroy
      redirect_to sections_path
    end
  end

  private
    def section_params
      params.require(:section).permit(:name)
    end
  end
