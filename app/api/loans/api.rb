module Loans
  # 错误格式化
  module ErrorFormatter
    def self.call(message, _backtrace, _options, env)
      return message.to_json if message.is_a?(Hash) && message.key?(:swaggerVersion)
      result = {
          state: 0,
          error: message
      }
      result.to_json
    end
  end

  # 数据格式化
  module BodyFormatter
    def self.call(object, _env)
      return object.to_json if object.is_a?(Hash) && object.key?(:swagger)
      result = { state: 1 }
      result.merge(object).to_json
    end
  end

  class API < Grape::API
    version 'v1', using: :header, vendor: 'loans'
    format :json
    content_type    :json, 'application/json;charset=UTF-8'
    default_format  :json
    formatter       :json, BodyFormatter
    error_formatter :json, ErrorFormatter

    helpers do

    end

    resource :user do
      desc 'register'
      params do
        requires :phoneNum, type: Integer
        requires :passWord, type: String
      end
      post :register do
        user = User.find_by(telephone: params[:phoneNum])
        error!('用户已存在', 409) if user
        user = User.create(telephone: params[:phoneNum], password: params[:passWord])
        { phoneNum: user.telephone }
      end

      desc 'login'
      params do
        requires :phoneNum, type: Integer
        requires :passWord, type: String
      end
      post :login do
        user = User.find_by(telephone: params[:phoneNum])
        error!('用户未注册', 404) unless user
        error!('密码错误', 401) unless user.authenticate(params[:passWord])
        { phoneNum: user.telephone }
      end
    end

    resource :online do
      desc '借款'
      params do
        requires :profession, type: String, values: %w(office_worker self_employed student business_owner)
        requires :moneyAmount, type: Integer
        requires :timeLimit, type: String, values: %w(month_3 month_6 year_1 year_2 year_3 year_5 year_10 year_20 year_30)
        requires :use, type: String, values: %w(tourism car purchase decoration education capitalization other)
        requires :name, type: String
        requires :workLocation, type: String
        requires :income, type: Integer
        requires :hasCard, type: Integer
        requires :phone, type: String
      end
      post :apply do
        user = User.find_by(telephone: params[:phone])
        error!('用户未注册', 404) unless user
        error!('审核中的借款未处理', 401) if user.applies.present? && user.applies.last.applying?
        apply = user.applies.create(
            profession: params[:profession], money_amount: params[:moneyAmount], time_limit: params[:timeLimit],
            use: params[:use], name: params[:name], work_location: params[:workLocation], income: params[:income],
            has_card: params[:has_card], phone: params[:phone], state: 'applying'
        )
        {state: 1}
      end
    end
    resource :loan do
      desc '贷款banner'
      get :banner do
        {data: Banner.loan.enable }
      end
      desc '贷款推荐列表'
      get :hotlist do
        {data: LoanList.enable.hot}
      end
      desc '全部贷款列表'
      get :list do
        {data: LoanList.enable}
      end
    end

    resource :cp do
      desc '彩票banner'
      get :banner do
        {data: Banner.cp.enable }
      end
    end
  end
end