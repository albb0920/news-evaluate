require 'spec_helper'

describe Article do
  it 'can create an new article' do
    expect do
      FactoryGirl.create(:article)
    end.to change {
      Article.count
    }.by(1)
  end
end
