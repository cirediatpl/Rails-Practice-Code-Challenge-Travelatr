class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts(int)
        array = self.posts.sort_by do |post|
            post.created_at
        end
        array[0..int]
    end

    def most_liked_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def average_age_of_unique_bloggers
        # sum = self.bloggers.uniq.map(&:age).reduce(:+)
        sum = self.bloggers.uniq.reduce(0) do |n, blogger|
            n + blogger.age
        end
        blogger_count = self.bloggers.count.to_f
        sum / blogger_count
    end

end
