class User < ActiveRecord::Base
    has_secure_password
    has_many :todos
    has_one :location

    validates :username, :email, :password_digest, presence: true
    validates :email, :username, uniqueness: true
    

end