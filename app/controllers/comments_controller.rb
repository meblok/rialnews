class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %w[ create ]
    before_action only: [:destroy] do
      authorized_request(["admin"])
    end
   
      def create
          @comment = current_user.comments.new(comment_params)
          @comment.publication_id = params[:publication_id]
   
      respond_to do |format|
          if @comment.save
              format.html { redirect_to publication_path(params[:publication_id]), notice: "Comentario creado correctamente." }
          else
              format.html { render publication_path(params[:publication_id]), status: :unprocessable_entity }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end
   
      def destroy
          @publication = Publication.find(params[:publication_id])
          @comment = @publication.comments.find(params[:id])
          @comment.destroy
   
          respond_to do |format|
              format.html { redirect_to publication_path(@publication), notice: "Comentario borrado" }
              format.json { head :no_content }
          end
      end
      
      private
   
      def comment_params
          params.require(:comment).permit(:body)
      end
    end
    