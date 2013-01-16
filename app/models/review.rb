#encoding: UTF-8
class Review < ActiveRecord::Base
  attr_accessible :article, :title_issues
  belongs_to :article
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
end
