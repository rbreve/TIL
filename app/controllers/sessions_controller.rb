class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]  
    print auth.to_yaml
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    
    session[:user_id] = user.id
    
    # user['username']=request.env['omniauth.auth']['user_info']['nickname']
    # user.save()
    
    user.avatar=auth['user_info']['image']
    user.save()
    
 
    if session[:til]
        
        @snippet = Snippet.new(session[:til])
        @snippet.user_id = user.id
        @snippet.save()
      
        session[:til]=""
        redirect_to root_url
        return
    end
    
    if session[:next]
      redirect_to session[:next], :notice => "Signed In"
    else
      redirect_to root_url, :notice => "Signed In"
    end
  end
  
  def index
    #nada
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed Out"
  end
end
