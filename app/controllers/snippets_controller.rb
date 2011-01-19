class SnippetsController < ApplicationController

  
  def index
    @snippets = Snippet.all
  end
  
  def show
    @snippet = Snippet.find(params[:id])
    @snippet.revert_to(params[:version].to_i) if params[:version]
  end
  
  def run
      @snippet = Snippet.find(params[:id])
      render :action => 'run', :layout => 'run'
  
  end
  
  def new
    @snippet = Snippet.new
  end
  
  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      flash[:notice] = "Successfully created snippet."
      redirect_to @snippet
    else
      render :action => 'new'
    end
  end
  
  def edit
    @snippet = Snippet.find(params[:id])
  end
  
  def update
    @snippet = Snippet.find(params[:id])
    if @snippet.update_attributes(params[:snippet])
      flash[:notice] = "Successfully updated snippet."
      redirect_to @snippet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    flash[:notice] = "Successfully destroyed snippet."
    redirect_to snippets_url
  end
end
