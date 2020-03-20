class User < ApplicationRecord
    has_secure_password
    
    has_many :articles 

    validates :username , presence: true,
               uniqueness:{case_sensitive:false},
    length: { minimum:3, maximum:30}

    validates :email , presence: true,
                uniqueness: true,
                length:{minimum:5,maximum:100},
                format:/\w+@\w+\.{1}[a-zA-Z]{2,}/



end