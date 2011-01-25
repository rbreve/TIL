class TagsController < ApplicationController
  def new
    @tag=params[:tag]
    respond_to do |format|
        format.js
    end
  end
end
