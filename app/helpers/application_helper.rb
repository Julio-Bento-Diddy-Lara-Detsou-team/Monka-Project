module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    else
      "alert-info"
    end
  end

  def get_total_turnover(quotes)
    turnover = 0

    quotes.each do |quote|
      turnover += quote.amount
    end

    turnover
  end

end
