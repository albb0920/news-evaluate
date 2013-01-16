class Reporter < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :company_id
end
