class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'admin.studygo'
  end
end
