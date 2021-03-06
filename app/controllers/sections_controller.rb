class SectionsController < ApplicationController


    def index
      @sections = Section.all
      render :index
    end

    def new
      @chapter = Chapter.find(params[:chapter_id])
      @section = @chapter.sections.new
      render :new
    end

    def show
      @section = Section.find(params[:id])
      render :show
    end

    def create
      @chapter = Chapter.find(params[:chapter_id])
      @section = @chapter.sections.new(section_params)
      if @section.save
        flash[:notice] = "Section successfully added!"
        redirect_to chapter_path(@section.chapter)
      else
        render :new
      end
    end

    def edit
      @section = Section.find(params[:id])
      render :edit
    end

    def update
     @section = Section.find(params[:id])
     if @section.update(section_params)
       redirect_to sections_path
     else
       render :edit
     end
    end

    def destroy
      @section = Section.find(params[:id])
      @section.destroy
      redirect_to chapter_path(@section.chapter)
    end
end

  private
    def section_params
      params.require(:section).permit(:name)
    end
