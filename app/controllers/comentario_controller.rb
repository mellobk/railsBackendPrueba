class ComentarioController < ApplicationController

    def index 

        @comentary = Comentario.all

        render json: @comentary, status: :ok

    end


    def postComentarys

        @postId = Postp.joins('LEFT JOIN "users" ON "users"."id" = "postps"."user_id"').select('users.email','postps.*').order('postps.created_at desc' ).where(id: params[:postp_id])
        @comentary = Comentario.where(postp_id: params[:postp_id])

        if @postId
            render json: { status: 'Success', message:'Comentary created', data:@postId, comentarios:@comentary}, status: :ok
        else
            render json: { status: 'Error', message:'Error create Comentary', data:@comentary.errors}, status: :unprocessable_entity
        end
       
    end


    def create 

        @comentary = Comentario.new(user_param)
        @postId = Postp.where(id: params[:postp_id])
        @comentarypost = Comentario..where(postp_id: params[:postp_id])

        if @comentary.save 
            @postId.update(numero_comentarios: @postId[0].numero_comentarios+1 )
            render json: { status: 'Success', message:'Comentary created', data:@comentarypost}, status: :ok
        else
            render json: { status: 'Error', message:'Error create Comentary', data:@comentary.errors}, status: :unprocessable_entity
        end
       

  

    end

    def user_param

        params.require(:comentario).permit(:user_id,:postp_id,:contenido,:nombre)

    end
    
end
