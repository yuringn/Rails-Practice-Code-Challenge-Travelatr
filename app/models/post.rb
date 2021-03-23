class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates :title, :content, presence: true
    validates :content, length: { minimum: 100 }
    
    def add_like
        self.likes += 1
    end
end
