module EventsHelper
  def header_background_image_url
    "https://az810058.vo.msecnd.net/site/global/Content/img/home-search-bg-0#{rand(6)}.jpg"
  end

  def check_event_validation?(event)
    !!(event.starts_at > Time.now)
  end

  def same_user?(event)
    !!(user_signed_in? &&current_user.id == event.user_id)
  end
end
