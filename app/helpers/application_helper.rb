module ApplicationHelper

def set_leave_dates(leave)
  if leave.leave_date_from.present? && leave.leave_date_from.present?
    "#{@leave.leave_date_from.strftime("%d/%m/%Y")} - #{@leave.leave_date_to.strftime("%d/%m/%Y")}"
  else
    ""
  end
end
end	
