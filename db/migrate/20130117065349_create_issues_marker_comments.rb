class CreateIssuesMarkerComments < ActiveRecord::Migration
  def change
    create_table(:content_issues_marker_comments, id: false) do |t|
      t.integer :content_issue_id
      t.integer :marker_comment_id
    end
  end
end
