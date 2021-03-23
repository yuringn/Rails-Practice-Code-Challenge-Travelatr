class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :name, :age, :bio, presence: true
    validates :age, numericality: {greater_than:0}
    validates :bio, length: {minimum: 30}

    def total_likes
        self.posts.map {|post| post.likes}.sum
    end

    def featured_post
        if self.posts.count > 0
            self.posts.sort {|post_a, post_b| post_b.likes <=> post_a.likes}.first
        else    
            "This blogger has not written any posts"
        end
    end

end
