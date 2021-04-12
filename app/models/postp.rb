class Postp < ApplicationRecord
    belongs_to :user
    has_many :comentarios

    validates :nombre, presence: true
    validates :contenido, presence: true
    validates :user_id, presence: true

end
