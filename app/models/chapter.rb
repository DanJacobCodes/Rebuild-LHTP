class Chapter < ActiveRecord::Base
  has_many :sections
  validates :name, :presence => true

  scope :most_sections, -> {(
    select("chapters.name, count(sections.id) as sections_count")
    .joins(:sections)
    .group("chapters.id")
    .order("sections_count DESC")
    .limit(3)
    )}
end
