class MarkerComment < ActiveRecord::Base
  belongs_to :review
  attr_accessible :comment, :selection, :content_issue_ids
  has_and_belongs_to_many :content_issues

  def score
    content_issues.sum('value')
  end
end
