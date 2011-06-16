class SnippetsController < ApplicationController
  before_filter :authenticate_user, :except => ["index", "show", "run", "new", "sms"]
  before_filter :authenticate_author, :only => ["edit", "update"]
  skip_before_filter :verify_authenticity_token

  def index
    @snippet = Snippet.new
  
    @sort=params[:sort_by]
    
    @tags = Snippet.tag_counts_on(:tags).limit(25)
    @snippets = Snippet.search(params[:search]).sortby(@sort).order("created_at desc")
    print Snippet.tag_counts
    @request=Request.new()
    
    if params[:search]
      @tagged = Snippet.tagged(params[:search])
      for snippet in @tagged
        unless @snippets.index(snippet)
          @snippets << snippet
        end
      end
    end
    
    if params[:tag]
      @snippets = Snippet.order("votes_count desc").tagged_with(params[:tag]).paginate(:per_page => 10, :page => params[:page])
      
      #@snippets = Snippet.limit(100)
    end
    
  
      
    #@snippets.sort! { |a,b| a.g <=> b.g}
    
    unless @sort
      @snippets.sort! do |a,b|
         ta=(Time.now - a.created_at)/(1000*60) 
         pa=a.votes_count
         ga=(pa - 1) / (ta + 2)**1.5
      
         tb=(Time.now - b.created_at)/(1000*60) 
         pb=b.votes_count
         gb=(pb - 1) / (tb + 2)**1.5
          gb <=> ga
      end
    end
    @snippets=@snippets.paginate(:per_page => 10, :page => params[:page])
    
    session[:next]=nil

    respond_to do |format|
        format.html
        format.rss { render :layout => false }  
    end

  end
  
  def show
    @snippet = Snippet.find(params[:id])
    @snippet.views+=1
    @snippet.save()
    @snippet.revert_to(params[:version].to_i) if params[:version]
    @report=Report.new
    session[:next]=snippet_path(@snippet)
    respond_to do |format|
      format.json { render :json => @snippet, :callback => params[:callback] }
      format.html
    end
  end
  
  def run
      @snippet = Snippet.find(params[:id])
      render :action => 'run', :layout => 'run'
  end
  
  def new
    unless current_user
      session[:next]=new_snippet_path()
      redirect_to "/login"
    end
    @snippet = Snippet.new
    @snippet.request_id |= params[:request_id] 
  end
  
  def create
    @snippet = Snippet.new(params[:snippet])
    @snippet.user_id = session[:user_id]
    @snippet.tag_list = params[:snippet][:tags]
    @snippet.code=params[:url] if params[:url] != ""
    
    if @snippet.save
      redirect_to "/snippets/sort/recent"
    else
      render :action => 'new'
    end
  end

  def sms
    user = User.find_by_phone params["From"]
    if user
      lesson = Snippet.new :name => params["Body"]
      lesson.user_id = user.id
      lesson.save

      Twilio.connect "AC5e628b141b52477fee2a54dd877afe3c", "78df19170f673075a306813da6c83555"
      Twilio::Sms.message '4155992671', user.phone, "Done, check your lesson at #{url_for lesson}"
    end
  end
  
  def edit
    @action="edit"
    @snippet = Snippet.find(params[:id])
    @tags=@snippet.tags.join(",")
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
