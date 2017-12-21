class UserController < ApplicationController

  def index
    @users = User.all
  end

  def new
    #사용자에게 보여주는 창
  end

  def create
    #db생성
    @user = User.create(
      email: params[:email],
      name: params[:name],
      password: params[:password]
    )
  end

  def login
    #로그인을 위한 form
  end

  def login_process
    # 0. 사용자에게 받는 것(params[:email], params[:password], params[:name])
    @user = User.find_by(email: params[:email])
    @msg = ""
    # 1. mail주소가 우리 db에 없으면(가입한 적이 없으면)
    if @user.nil?
      # 1-1. 없는 아이디라고 말해주고 -> 회원가입으로 유도
      @msg ="존재하지 않는 회원입니다. 가입해주세요"
    # 2. mail주소가 db에 있으면, 비밀번호를 확인
    else
      # 2-1. 맞으면, 로그인
      if @user.password == params[:password]
          @msg ="로그인 성공"
          #로그인을 했는지 안했는지 유저가 계속 확인할 수 있도록
          session[:user_id] = @user.id
      # 2-2. 틀리면, 비밀번호가 틀렸습니다.
      else
          @msg ="비밀번호를 확인해주세요"
      end
    end
  end
end
