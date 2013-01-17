module ArticlesHelper
  def score_class(article)
    score = article.score
    if score > 90
      " gold"
    elsif (70..90).include? score
      " silver"
    elsif (50..70).include? score
      " orange"
    else
      " red"
    end
  end
end
