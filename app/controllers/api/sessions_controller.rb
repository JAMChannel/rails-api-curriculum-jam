# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password]) # userがnilでない場合にautheicateを実行。authenticate()は、ユーザーのパスワード一致判定を行うメソッド
      token = Jwt::TokenProvider.call(user_id: user.id) # 暗号化メソッドを呼び出し
      render json: ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer).as_json.deep_merge(user: { token: token })
      # 新しくserializerインスタンスを作成を作るのはsessionの中身はuserモデルと同じなので、
      # user情報とuserのserializerを引数にとり、その情報をもとにserializerインスタンスを作成
      # ハッシュの中にハッシュがあるような場合は「.deep_merge」を使う
      # binding.pry
    else
      render json: { error: { messages: ['メールアドレスまたはパスワードに誤りがあります。'] } }, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
