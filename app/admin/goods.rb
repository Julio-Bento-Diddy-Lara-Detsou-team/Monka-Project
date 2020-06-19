ActiveAdmin.register Good do
  permit_params :title,
                :description,
                :quantity,
                :price,
                :user_id
end
