class User < ApplicationRecord
    has_many :postps
    has_many :comentarios
 
    validates :email, presence: true
 

end