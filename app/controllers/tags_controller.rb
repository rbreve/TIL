class TagsController < ApplicationController
  def new
    @tag=params[:tag]
    respond_to do |format|
        format.js
    end
  end
  
  def index
    @tag=params[:tag]
    @tags=Snippet.tag_counts_on(:tags)
    respond_to do |format|
        format.json { render :json => @tags }
    end
  end
end
