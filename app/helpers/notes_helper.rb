module NotesHelper
  def format_date(date, ordinalize_day = false)
    return date.strftime("%B %d, %Y") unless ordinalize_day

    date.strftime("%B #{date.day.ordinalize}, %Y")
  end

  def has_description?(description)
    description.present?
  end

  def status_button_class(status)
    case status
    when 'to_do'
      'secondary'
    when 'in_progress'
      'info'
    when 'completed'
      'success'
    when 'over_due'
      'danger'
    else
      'secondary'
    end
  end

  def format_status(status)
    status.titleize
  end
end
