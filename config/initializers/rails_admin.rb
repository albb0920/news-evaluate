RailsAdmin.config do |config|
  config.model Article do
    edit do
      include_all_fields
      field :content, :text do
        ckeditor true
      end
    end
  end
end
