module ApplicationHelper
  def message_css_class(type, message, profile)
    if type == :own_by
      message.profile_id == profile.id ? 'my-message' : 'other-message'
    elsif type == :background
      message.profile_id == profile.id ? 'bg-light-blue' : 'bg-blue-custom'
    end
  end

  def lesson_durations
    [{ duration: 60, name: t('lessons.duration.one_hour') },
     { duration: 90, name: t('lessons.duration.one_and_half_hours') },
     { duration: 120, name: t('lessons.duration.two_hours') }]
  end

  def duration_in_hours
    { 60 => t('lessons.duration.one_hour'),
      90 => t('lessons.duration.one_and_half_hours'),
      120 => t('lessons.duration.two_hours') }
  end

  def string_match?(string, match: '')
    string.match?(match)
  end

  def user_avatar(user, size = 20)
    user.avatar.variant(resize: "#{size}x#{size}!")
  end

  def image_path(image)
    rails_blob_url(image) if image.attached?
  end

  def active_if?(conditions)
    active_conditions = {
      action: action_name == conditions[:action],
      category: params[:category].to_s == conditions[:category],
      controller: controller_name == conditions[:controller],
      fullpath: request.fullpath =~ conditions[:fullpath],
      starts_with: fullpath_starts_with?(conditions[:starts_with].to_s)
    }.select{ |k,_| conditions.keys.include? k }.values
    return 'active' if active_conditions.all?
  end

  def fullpath_starts_with?(path)
    request.fullpath =~ /^\/#{Regexp.quote(path)}/
  end

  def registration_step_class
    case action_name
    when 'show'
      { general: 'active', bio: 'disabled', photo: 'disabled', video: 'disabled', schedule: 'disabled' }
    when 'photo'
      { general: 'completed', bio: 'disabled', photo: 'active', video: 'disabled', schedule: 'disabled' }
    when 'bio'
      { general: 'completed', bio: 'active', photo: 'completed', video: 'disabled', schedule: 'disabled' }
    when 'video'
      { general: 'completed', bio: 'completed', photo: 'completed', video: 'active', schedule: 'disabled' }
    when 'schedule'
      { general: 'completed', bio: 'completed', photo: 'completed', video: 'completed', schedule: 'active' }
    end
  end

  def lesson_status_background
    { 'pending' => 'bg-secondary',
      'paid' => 'bg-success',
      'canceled' => 'bg-danger',
      'completed' => 'bg-warning' }
  end

  def countries_to_select
    Country.all.map do |country|
      [I18n.t("countries.#{country.code}"), country.id]
    end
  end
end
