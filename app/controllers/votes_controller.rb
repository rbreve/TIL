class VotesController < ApplicationController
   
  
  def voteup
    #VOTE!
    if session[:user_id]
      user_id=session[:user_id]
      snippet_id = params[:snippet_id]
    
      @voted=false
      @snippet = Snippet.find(snippet_id)
      @vote = Vote.where(["user_id = ? AND snippet_id = ?", user_id, snippet_id]).first
    
      if not @snippet.blank? and @vote.blank?
        @snippet.vote(user_id)
      else
        @voted=true
      end
    else
      @nologin=true
    end
    respond_to do |format|
        format.js
    end
  end
end
