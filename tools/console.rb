require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###




author1=Author.new("Anwar")
author2=Author.new("Yahy")
author3=Author.new("Moh")

mag1=Magazine.new("Citizen","FUN")
mag2=Magazine.new("ktn","lol")
mag3=Magazine.new("mg3","SAD")
mag4=Magazine.new("Citizen","SAD")

mag4=Magazine.find_by_name("Citizen")

# author3=Author.new("Anwar")
# p author1.articles


# p author1.magazines

# p Magazine.all
# p Article.all
# p Author.all


# p article1.author
# p Article.all
# p Author.all

article1=Article.new(author1,mag1,"hello")
article2=Article.new(author1,mag1,"hell")
article3=Article.new(author3,mag3,"hel")
p Article.all





### DO NOT REMOVE THIS
binding.pry

0
