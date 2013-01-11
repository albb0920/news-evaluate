class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :reporters
end
