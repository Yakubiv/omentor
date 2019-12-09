web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers -e production -t 25 -C config/sidekiq.yml