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
