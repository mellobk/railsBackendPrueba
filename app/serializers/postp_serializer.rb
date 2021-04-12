class PostpSerializer < ActiveModel::Serializer

  { status: 'Success', message:'load user'}
  attributes :id, :nombre
  belongs_to :user
  has_many :comentarios
end
