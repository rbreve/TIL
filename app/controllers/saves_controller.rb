class SavesController < ApplicationController
  def index
    #TODO hacer lo de usuario 

    #@user=User.find_by_username(params[:username])
    @user=User.find(params[:username])
    @snippets = @user.snippets.all
    ids=[]
    #@saves.each {|s| ids << s.snippet_id}
    #@snippets = Snippet.where("id in (?)", ids)
  end
  
   
  def create
    @save = Save.new(:snippet_id=>params[:snippet_id], :user_id => current_user.id)
    if @save.save
      respond_to do |format|
          format.js
      end
    end
  end
  
  def destroy
    @save = Save.find(params[:id])
    @save.destroy
    flash[:notice] = "Successfully destroyed save."
    redirect_to saves_url
  end
end
