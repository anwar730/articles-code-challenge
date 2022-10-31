# require 
class Author
  attr_reader :name, :magzs

  @@all=[]
  
  def initialize(name)
    @name = name
    @@all<<self
    @magzs=[]

  
  end

  def name
    @name
  end

  def articles
    Article.all.select { |article| @name== article.author}
  end

  def magazines
    articles.map { |article| article.magazine}.uniq
  end  

  def self.all
    @@all
  end  

  def add_articles(magazine,title)
    Article.new(self,magazine,title)
  end

  def topic_areas
    categories=[]
    magzs.map do |magazine|
      categories << magazine.category 
    end 
    categories.uniq
  end

  def magazine_call_back(magazine)
    @magzs<<magazine
  end  


end
