class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session 
  #Tokenが一致しなかった場合にsessionを空にする.エラーを吐きたがる挙動にしたくないから :null sessionを使用。
  class AuthenticationError < StandardError; end # 独自の例外クラスを作成. 「rescue」でキャッチ.AuthenticationErrorへ継承

  rescue_from ActiveRecord::RecordInvalid, with: :render_422
  # バリデーションのエラーが起こった場合に,render_422をする
  rescue_from AuthenticationError, with: :not_authenticated
  # 「rescue_from」で例外の処理を実行。AuthenticationErrorが起きた場合、not_authenticatedメソッドを実行

  def authenticate
    raise AuthenticationError unless current_user
  end
  # 現在ログイン中のuserでなければエラーを発生させるメソッド

  def current_user
    @current_user ||= Jwt::UserAuthenticator.call(request.headers)  # 引数にはリクエストのヘッダー情報を送る
  end
  # ログイン中のuserかどうかを判定するメソッド

  private

  def render_422(exception)
    render json: { error: { messages: exception.record.errors.full_messages } }, status: :unprocessable_entity
  end

  def not_authenticated
    render json: { error: { messages: ['ログインしてください'] } }, status: :unauthorized
  end
  # json形式でエラーメッセージとstatusを返すメソッド
end
