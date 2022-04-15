class Subdomain
  def self.matches?(request)
    return true if Rails.env.development?

    request.subdomain.present? && request.subdomain == 'admin.studygo'
  end
end
