class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #모든 컨트롤러에 상속을 해주고 있기 때문에.
  #application.controll.rb에 작성한 메소드는 모든 컨트롤러에서 쓸 수 있다.
  def current_user
    #현재 로그인이 되어 있지 않다면,
    #session[:user_id]값이 없을테니까 nil
    if session[:user_id].nil?
      @user = nil
    else
      #현재 로그인이 되어있으니까
      #세션에 id값이 있으니까 찾아서 넣는다
      @user = User.find(session[:user_id])
    end
  end
    #view에서 보여주기 위해서는 컨트롤러에서 뷰로 넘겨야 하는데
    #helper_method를 활용하여 바로 view에서 쓸 수 있도록 할 수 있다.
    helper_method :current_user
end
