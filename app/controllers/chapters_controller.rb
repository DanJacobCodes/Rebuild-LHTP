class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.all
    render :index
  end

  def new
    @chapter = Chapter.find(params [:chapter_id])
    @section = @chapter.sections.new
    render :new
  end

  def show
    @chapter = Chapter.find(params[:id])
    render :show
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      flash[:notice] = "Chapter successfully added!"
      redirect_to chapters_path
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params [:id])
    render :edit
  end

  def update
   @chapter = Chapter.find(params [:id])
   if @chapter.update(chapter_params)
     redirect_to chapters_path
   else
     render :edit
   end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to chapters_path
  end
end

private
  def chapter_params
    params.require(:chapter).permit(:name)
  end
