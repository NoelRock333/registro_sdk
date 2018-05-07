json.extract! assistant, :id, :reservation_code, :name, :last_name, :email, :pay_method, :ticket_quantity, :reservation_date, :created_at, :updated_at
json.url assistant_url(assistant, format: :json)
