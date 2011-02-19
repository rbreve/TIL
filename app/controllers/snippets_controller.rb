class SnippetsController < ApplicationController
  before_filter :authenticate_user, :except => ["index", "show", "run"]
  
  def index
    @sort=params[:sort_by]
    #@sort ||= "popular"
    @snippets = Snippet.search(params[:search]).sortby(@sort).order("created_at desc")
    if params[:tag]
      @snippets = Snippet.order("votes_count desc").tagged_with(params[:tag]).paginate(:per_page => 10, :page => params[:page])
      
      #@snippets = Snippet.limit(100)
    end
    
  
      
    #@snippets.sort! { |a,b| a.g <=> b.g}
    @snippets.sort! do |a,b|
       ta=(Time.now - a.created_at)/(1000*60) 
       pa=a.votes_count
       ga=(pa - 1) / (ta + 2)**1.5
      
       tb=(Time.now - b.created_at)/(1000*60) 
       pb=b.votes_count
       gb=(pb - 1) / (tb + 2)**1.5
        print "x"
       gb <=> ga
    end
    @snippets=@snippets.paginate(:per_page => 10, :page => params[:page])
    
    session[:next]=nil

  end
  
  def show
    @snippet = Snippet.find(params[:id])
    @snippet.views+=1
    @snippet.save()
    @snippet.revert_to(params[:version].to_i) if params[:version]
    @report=Report.new
    session[:next]=snippet_path(@snippet)
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
