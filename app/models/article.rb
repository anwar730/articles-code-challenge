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








