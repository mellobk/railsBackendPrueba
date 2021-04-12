class RemovePostPToComentario < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comentarios, :post_p, index:true, foreign_key: true

    drop_table :user_like_posts

    drop_table :post_ps
  end


 

end
