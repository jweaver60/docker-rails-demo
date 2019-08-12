# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
# threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
# threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
# port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
# environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
# plugin :tmp_restart



# Before configuring Puma, you should look up the number of CPU cores your server has, change this to match your CPU core count
workers Integer(ENV['WEB_CONCURRENCY'] || [1, `grep -c processor /proc/cpuinfo`.to_i].max)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup

# HTTP interface
port 3000

# HTTPS inteface
# How to generate certificate: https://gist.github.com/tadast/9932075
# ssl_bind '0.0.0.0', '3001', { key: 'ssl/server.key', cert: 'ssl/server.crt' }

environment ENV['RACK_ENV'] || 'development'

stdout_redirect(stdout = '/dev/stdout', stderr = '/dev/stderr', append = true)

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end