module Jwt::TokenDecryptor
  extend self

  def call(token)
    decrypt(token)
  end

  private

  def decrypt(token) # 引数のtokenをもとに復号化
    JWT.decode(token, Rails.application.credentials.secret_key_base)
  rescue StandardError
    raise InvalidTokenError # raiseでInvalidTokenErrorという自分で定義したエラーを起こします
  end
end
class InvalidTokenError < StandardError; end