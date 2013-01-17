#encoding: UTF-8
class Review < ActiveRecord::Base
  attr_accessible :article, :title_issues, :score
  belongs_to :article
  has_many :marker_comments
  has_many :content_issues, through: :marker_comments

  TITLE_ISSUES = ['低俗騷擾', '誇大不實', '詞語濫用', '亂貼標籤', '種族歧視', '預設立場', '語意不明', '人工新聞']
  serialize :title_issues, JSON

  def title_issues
    Set.new read_attribute(:title_issues) || []
  end

  def title_issues=(new_title_issues)
    write_attribute(:title_issues, new_title_issues.to_a)
  end

  def toggle_title_issue(issue)
    self.title_issues ^= [issue]
  end

  def final_score
    80 + (score * 5) + (title_issues.count * -5) + content_issues.sum('value')
  end
end
