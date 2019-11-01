class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'admin'
  end
end
