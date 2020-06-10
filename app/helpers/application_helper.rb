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
end

def current_user
  User.find(session[:user_id])
end

def log_in(user)
  session[:user_id] = user.id
end

# User can modify only if he owns the customer
def has_rights_user(customer)
  puts current_user.id
  puts customer.id

  if current_user.id != customer.user.id
    puts "Super !"
    redirect_to customers_path
  end

end