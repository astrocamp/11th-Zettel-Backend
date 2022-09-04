class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  # 第三方log in
  def third_party_login
    if @user = User.find_by_email(params[:email])
      create_token
    else
      create_third_party_user
      if @user.save
        create_token
      else
        render json:{message:"wrong key"}
      end
    end
  end 
  
  private
  def create_token
    token = jwt_encode(user_id: @user.id)
    render json: {:message => "Ok",
      :auth_token => token,
      :user_id => @user.id }, status: :ok
  end
   
  def create_third_party_user
    @user = User.new(username: params[:authentication][:name] ,email: params[:authentication][:email] ,password: params[:authentication][:email], third_party: true)  
  end
end
