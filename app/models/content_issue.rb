class ContentIssue < ActiveRecord::Base
  attr_accessible :name, :value
  has_and_belongs_to_many :marker_comments
end
