class Article < ActiveRecord::Base
  attr_accessible :content, :title, :reporter_ids, :reporters_attributes, :url
  has_and_belongs_to_many :reporters
  accepts_nested_attributes_for :reporters, allow_destroy: true
end
