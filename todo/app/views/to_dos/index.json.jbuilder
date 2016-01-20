json.array!(@to_dos) do |to_do|
  json.extract! to_do, :id, :start_date, :end_date, :priority, :description, :status
  json.url to_do_url(to_do, format: :json)
end
