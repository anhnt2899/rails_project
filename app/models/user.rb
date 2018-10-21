class User < ApplicationRecord
    has_one :school
    before_save {email.downcase!}
    before_save:default_value
    validates :username, presence: true, length: {maximum: 50}, length: {minimum: 5}, uniqueness: {case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:50},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence:true, length: {maximum: 50}, length: {minimum: 8}
    def default_value
        self.is_active= true
        self.is_admin = false
    end  
end
