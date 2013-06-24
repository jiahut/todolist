class User < ActiveRecord::Base
  attr_accessor :remember
  validates :name, uniqueness: true
  validates :passwd ,uniqueness: true
end
