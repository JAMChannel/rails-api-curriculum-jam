module Jwt::UserAuthenticator
  extend self
  # module内で定義したメソッドが「Jwt::UserAuthenticator.メソッド名」として使えるようになる

  def call(request_headers)
    @request_headers = request_headers
    begin
      payload, = Jwt::TokenDecryptor.call(token)
      # ヘッダー情報を格納
      User.find(payload['user_id'])
    rescue StandardError
      nil
    end
  end

  private

  def token
    @request_headers['Authorization'].split(' ').last
    # ヘッダーのauthrizationのtokenのみを取得
  end
end
