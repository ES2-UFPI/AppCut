# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:rate] = "postado em %d/%m/%Y às %H:%M"
