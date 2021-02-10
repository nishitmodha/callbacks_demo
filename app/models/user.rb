class User < ApplicationRecord
    validates :email, presence: true
    
    before_create :downcase_name
    
    before_validation :default_email

    after_touch do |user|
        puts "You have touched an object"
    end

    after_create :created

    after_save :saved

    before_update :b_update

    after_update :updated

    before_destroy :b_destroy

    after_destroy :destroyed


    private

    def downcase_name
        self.name = name.downcase
    end

    def default_email
        self.email = "abc@gmail.com" if email.blank?
    end

    def created
        puts "USER CREATED!"
    end

    def saved
        puts "USER SAVED!"
    end
    
    def b_update
        puts "BEFORE UPDATE"
    end

    def updated
        puts "USER UPDATED!"
    end

    def b_destroy
        puts "BEFORE DESTROY!"    
    end

    def destroyed
        puts "USER DESTROYED!"
    end

end
