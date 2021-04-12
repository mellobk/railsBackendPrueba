class Postp < ApplicationRecord
    belongs_to :user
    has_many :comentarios
    has_many :userlikeposts

    validates :nombre, presence: true
    validates :contenido, presence: true
    validates :user_id, presence: true

end
