class User < ApplicationRecord
    has_many :postps
    has_many :comentarios
    has_many :userlikeposts

    
    validates :email, presence: true
 

end