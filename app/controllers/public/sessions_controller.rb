# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別(!&&にしなくてもいい？デフォルト値参照) 
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      redirect_to new_customer_session_path
    end

  end

end
