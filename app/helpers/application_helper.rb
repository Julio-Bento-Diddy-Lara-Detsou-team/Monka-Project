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

  def get_turnover
    invoices = []
    invoices << curent_user.quotes.where(is_invoice: true).all.amount
    turnover = invoices.sum
  end

end
