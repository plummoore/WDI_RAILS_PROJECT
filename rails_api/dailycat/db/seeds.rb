Cat.destroy_all
Category.destroy_all


# c1 = Category.create!(category_name: "classy")
# c2 = Category.create!(category_name: "cute")
# c3 = Category.create!(category_name: "funny")
# c4 = Category.create!(category_name: "grumpy")
# c5 = Category.create!(category_name: "hungry")
# c6 = Category.create!(category_name: "sleepy")

cats = [
  Category.create!(category_name: "classy"),
  Category.create!(category_name: "cute"),
  Category.create!(category_name: "funny"),
  Category.create!(category_name: "grumpy"),
  Category.create!(category_name: "hungry"),
  Category.create!(category_name: "sleepy")
]
# cat1 = Cat.create!(name:"cat 1!", giphy_image:"url here", category_id: c1.id)

cats.each do |i|
  puts i

  images = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=WiiFEDiAc1HJfz3xeToFL0N3f5z7Hcmr&q=#{i["category_name"]}_cat&limit=25&offset=0&rating=G&lang=en")
  #
  # puts images["data"][0]["url"]

  # you want to loop through the results
  images["data"].each do | image |
    cat = Cat.create!(name:image["title"], giphy_image: image["url"], category_id:i["id"])
    puts "#{cat["name"]} was created!!"
  end

end
# for each result you want to log its url
