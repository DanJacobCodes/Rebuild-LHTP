class AddChapterIdToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :chapter_id, :integer
  end
end
