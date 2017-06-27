chapter_list = [
  ["C#"],
  ["Go"],
  ["Scala"],
  ["C"]
]

chapter_list.each do |name|
  Chapter.create( name: name )
end
