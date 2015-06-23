json.array!(@losts) do |lost|
  json.extract! lost, :id, :name, :animal, :gender, :size, :about, :city, :bairro, :date, :phone, :another_phone
  json.url lost_url(lost, format: :json)
end
