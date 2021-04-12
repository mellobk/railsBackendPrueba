class ComentarioSerializer < ActiveModel::Serializer
  attributes :id,:nombre,:contenido

  belongs_to :user
end
