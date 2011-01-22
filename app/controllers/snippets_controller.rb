class SnippetsController < ApplicationController
  before_filter :authenticate_user, :except => ["index", "show"]
  
  def index
    @snippets = Snippet.order("created_at desc")
    if params[:tag]
      @snippets = Snippet.tagged_with(params[:tag])
    end
    
  end
  
  def show
    @snippet = Snippet.find(params[:id])
    @snippet.views+=1
    @snippet.save()
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
    @snippet.user_id = session[:user_id]
    @snippet.tag_list = params[:snippet][:tags]
    
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
    @snippet.tag_list = params[:snippet][:tags]

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
