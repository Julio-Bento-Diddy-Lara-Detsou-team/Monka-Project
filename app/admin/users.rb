ActiveAdmin.register User do
  permit_params :email,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :first_name,
                :last_name,
                :company_name,
                :address,
                :zip_code,
                :country,
                :phone_number,
                :company_id,
                :is_admin
  
end
