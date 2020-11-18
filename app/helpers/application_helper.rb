module ApplicationHelper
  include Pagy::Frontend

  SHORT_DATE = '%d %B %Y, %H:%M'.freeze
  DEFAULT_DATE = '%d %B %Y'.freeze
  DATE = '%d/%m'.freeze
  TIME = '%H:%M'.freeze

  def active_tab_link
    'text-indigo-600 focus:text-indigo-800 focus:border-indigo-700 border-indigo-500'
  end

  def inactive_tab_link
    'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 focus:text-gray-700 focus:border-gray-300'
  end

  def active_icon
    'text-indigo-500 group-focus:text-indigo-600'
  end

  def inactive_icon
    'text-gray-400 group-hover:text-gray-500 group-focus:text-gray-600'
  end

  def dynamic_dashboard_url
    return students_dashboard_path if current_user.sign_up_as == 'student'
    return tutors_dashboard_path if current_user.sign_up_as == 'tutor'
    return admins_dashboard_path(subdomain: 'admin') if current_user.sign_up_as == 'admit'

    root_path
  end

  def og_properties(blog)
    { title: blog.title,
      type: blog.show(:category),
      image: Rails.env.development? ? image_path(blog.thumbnail) : blog.thumbnail.service_url,
      url: blog_url(blog) }
  end

  def meta_og_tags(properties = {})
    return unless properties.is_a? Hash

    properties.map do |property, value|
      tag(:meta, property: "og:#{property}", content: value)
    end.join.html_safe
  end

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
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

  def blog_thumbnail(post, size = 20)
    post.thumbnail.variant(resize: "#{size}x#{size}!")
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
    active_condition = { background: 'none', text: 'text-indigo-600', border: "border-indigo-600", display: "hidden", display_text: "block" }
    completed_condition = { background: 'bg-indigo-600', text: 'text-gray-900', border: "border-indigo-600", display: "block", display_text: "hidden" }
    disabled_condition = { background: 'none', text: 'text-gray-500', border: "border-gray-400", display: "hidden", display_text: "block" }

    case action_name
    when 'show'
      { general: active_condition, bio: disabled_condition, photo: disabled_condition, video: disabled_condition, schedule: disabled_condition }
    when 'photo'
      { general: completed_condition, bio: disabled_condition, photo: active_condition, video: disabled_condition, schedule: disabled_condition }
    when 'bio'
      { general: completed_condition, bio: active_condition, photo: completed_condition, video: disabled_condition, schedule: disabled_condition }
    when 'video'
      { general: completed_condition, bio: completed_condition, photo: completed_condition, video: active_condition, schedule: disabled_condition }
    when 'schedule'
      { general: completed_condition, bio: completed_condition, photo: completed_condition, video: completed_condition, schedule: active_condition }
    end
  end

  def lesson_status_background
    { 'pending' => 'bg-gray-100 text-gray-800',
      'paid' => 'bg-green-100 text-green-800',
      'canceled' => 'bg-red-100 text-red-800',
      'completed' => 'bg-orange-100 text-orange-800' }
  end

  def countries_to_select
    Country.all.map do |country|
      [I18n.t("countries.#{country.code}"), country.id]
    end
  end

  def languages_to_select
    Language.all.map do |l|
      [I18n.t("countries.language.#{l.name}"), l.id]
    end
  end

  SANITIZER          = Rails::Html::Sanitizer.white_list_sanitizer
  ALLOWED_TAGS       = SANITIZER.allowed_tags + [ ActionText::Attachment::TAG_NAME, "figure", "figcaption", "iframe" ]
  ALLOWED_ATTRIBUTES = SANITIZER.allowed_attributes + ActionText::Attachment::ATTRIBUTES

  def render_action_text_content(content)
    content = content.render_attachments do |attachment|
      unless attachment.in?(content.gallery_attachments)
        attachment.node.tap do |node|
          node.inner_html = render(attachment, in_gallery: false).chomp
        end
      end
    end

    content = content.render_attachment_galleries do |attachment_gallery|
      render(layout: attachment_gallery, object: attachment_gallery) do
        attachment_gallery.attachments.map do |attachment|
          attachment.node.inner_html = render(attachment, in_gallery: true).chomp
          attachment.to_html
        end.join("").html_safe
      end.chomp
    end

    sanitize content.to_html, tags: ALLOWED_TAGS + ["iframe"], attributes: ALLOWED_ATTRIBUTES
  end
end
