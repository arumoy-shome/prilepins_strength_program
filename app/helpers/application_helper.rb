module ApplicationHelper

  def full_title title
    base_title = "Prilepin's Strength"
    if title.empty?
      return base_title
    else
      "#{title}"
    end
  end
end
