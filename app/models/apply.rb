class Apply < ActiveRecord::Base
  belongs_to :user

  enum profession: %w(office_worker self_employed student business_owner)
  enum timeLimit: %w(month_3 month_6 year_1 year_2 year_3 year_5 year_10 year_20 year_30)
  enum use: %w(tourism car purchase decoration education capitalization other)
  enum state: %w(applying success failed)
end
