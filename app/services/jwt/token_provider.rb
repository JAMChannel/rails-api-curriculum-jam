# frozen_string_literal: true

module Jwt::TokenProvider
  extend self

  def call(payload)
    issue_token(payload)
  end

  private

  def issue_token(payload) # 暗号化
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
    # 文字符号化方式の文字列を生成→$B%F%9%H(Bみたいなやつ
  end
end
