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

  def is_nav_link_active(controller, action)
    controller_name === controller && action_name === action ? 'active' : nil
  end

  def is_nav_link_current(controller, action)
    controller_name === controller && action_name === action ? "<span class='sr-only'>(current)</span>" : nil
  end

  def calculate_total_quote(goods)
    @total_quote = 0

    goods.each do |good|
      @total_quote += good.price * good.quantity
    end

    @total_quote
  end

  def get_annual_turnover(quotes)
    turnover = 0

    quotes.each do |quote|
      turnover += quote.amount
    end

    turnover
  end

  def get_monthly_turnover(invoices)
    turnover = 0

    invoices.each do |invoice|
      turnover += invoice.amount if DateTime.now.strftime("%m") === invoice.invoice_sending_date.strftime("%m")
    end

    turnover
  end

  def get_calendar_turnover(invoices, month)
    turnover = 0

    invoices.each do |invoice|
      turnover += invoice.amount if month === invoice.invoice_sending_date.strftime("%m")
    end

    turnover
  end

end
