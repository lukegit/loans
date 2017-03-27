class Banner < ActiveRecord::Base
  enum banner_type: %w(cp loan)
  enum state: %w(enable disable)
end
