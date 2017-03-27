class LoanList < ActiveRecord::Base
  enum state: %w(enable disable)
  enum is_hot: %w(not hot all)
end
