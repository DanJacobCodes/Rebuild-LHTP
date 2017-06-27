class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:section_id])
    @lesson = @chapter.section.lesson.new
  end

end
