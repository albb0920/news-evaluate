class MarkerComment < ActiveRecord::Base
  belongs_to :review
  attr_accessible :comment, :selection, :content_issue_ids
  has_and_belongs_to_many :content_issues

  def score
    content_issues.sum('value')
  end

  def content_issues_string
    content_issues.map(&:name)
  end

  def as_json(options)
    super(methods: [:content_issues_string])
  end
end
