# Please copy/paste all three classes into this file to submit your solution!
class Article

    attr_reader :author, :magazine, :title

    @@all=[]
    
    def initialize(author,magazine,title)
        @author=author
        @title=title
        @magazine=magazine
        magazine.author_callback(author)
        @@all << self
        author.magazine_call_back(magazine)
        
    end    

    def title
        @title
    end

    def self.all
        @@all
    end

    def author
        @author.name
    end

    def magazine
        @magazine.name
    end

    
end

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

  class Magazine
    attr_accessor :name, :category
  
    @@all=[]
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
      @authors=[]
      
    
  
    end
  
    def name
      @name
    end
  
    def category
      @category
    end
    
    def self.all
      @@all
    end
  
    def author_callback(author)
      @authors<<author
    end  
  
    def contributors
      @authors
    end  
  
     def self.find_by_name(name)
      @@all.find do |magazine|
        magazine.name == name
      end
    end
  
    def article_titles
      titles=[]
      Article.all.map do |article|
        if article.magazine==self.name
          titles << article.title
        end 
  
      end
      titles
  
    end
  
    def contributing_authors
      authors=[]
      counter=0
      self.contributors.map do |contributor|
        contributor.articles.map do |article|
          if article.magazine==self.name
            counter+=1
          end
          
        end
        if counter >= 2 
          authors<<contributor
        end
        counter=0
  
  
  
  
      end
      authors.uniq
  
  
      
    end
  
  
  
  
  end
  


