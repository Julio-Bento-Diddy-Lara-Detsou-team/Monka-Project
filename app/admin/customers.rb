ActiveAdmin.register Customer do

  permit_params :first_name,
                :last_name,
                :company_name,
                :company_id,
                :email,
                :is_professional,
                :address,
                :zip_code,
                :country,
                :phone_number,
                :user_id

end
