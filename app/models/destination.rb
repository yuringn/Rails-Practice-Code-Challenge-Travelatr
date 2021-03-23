class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        if self.posts.count > 0
            self.posts.sort {|post_a, post_b| post_b.likes <=> post_a.likes}.first
        else 
            "There are no posts written about this destination"
        end       
    end

    def average_blogger_age
        if self.bloggers.count > 0 
            total_ages = self.bloggers.uniq.map { |blogger| blogger.age }.sum
            total_ages / self.bloggers.uniq.count
        else   
            "No bloggers have written about this destination"
        end 
    end

    def most_recent_five
        sorted = self.posts.sort {|post_a, post_b| post_b.created_at <=> post_a.created_at}
            sorted[0..4]
    end

    def self.most_posted_about
        destination_ids = Post.all.map { |post| post.destination_id }
        most_pop = destination_ids.max_by { |dest_id| destination_ids.count(dest_id) }
        Destination.find(most_pop)
    end
end
