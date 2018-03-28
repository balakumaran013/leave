json.extract! leavelog, :id, :reason_for_leave, :status, :leave_date_from, :leave_date_to, :user_id, :created_at, :updated_at
json.url leavelog_url(leavelog, format: :json)
