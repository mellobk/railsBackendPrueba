class Comentario < ApplicationRecord


    belongs_to :user
    belongs_to :postp

    validates :nombre, presence: true
    validates :contenido, presence: true
    validates :user_id, presence: true
    validates :postp_id, presence: true

    
end
