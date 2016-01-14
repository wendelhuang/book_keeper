module ApplicationHelper
  def flash_bootstrap_class(level)
    case level.to_sym
    when :success then "alert alert-success"
    when :notice then "alert alert-info"
    when :alert then "alert alert-danger"
    when :error then "alert alert-danger"
    end
  end
end
