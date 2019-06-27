class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes_on_posts
        self.posts.reduce(0) do |n, post|
            n + post.likes
        end
    end

    def featured_post
       self.posts.max_by do |post|
        post.likes
       end 
    end

end
