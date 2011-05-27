class RequestsController < ApplicationController
  before_filter :authenticate_user, :except => ["index", "show", "new"]
  
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find(params[:id])
  end
  
  def new
      unless current_user
        session[:next]=new_request_path()
        redirect_to "/login"
      end
    
    @request = Request.new
  end
  
  def create
    
    @request = Request.new(params[:request])
    @request.user_id = session[:user_id]
    
    if @request.save
      flash[:notice] = "Your request has been received, we will notify you when someones replies."
      redirect_to @request
    else
      render :action => 'new'
    end
  end
  
  def edit
    @request = Request.find(params[:id])
  end
  
  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      flash[:notice] = "Successfully updated request."
      redirect_to @request
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:notice] = "Successfully destroyed request."
    redirect_to requests_url
  end
end
