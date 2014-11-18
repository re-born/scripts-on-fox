require 'slack-notify'
require 'dotenv'
Dotenv.load (File.expand_path('../.env', __FILE__))

def notify message
  notifier = SlackNotify::Client.new ENV['SLACK_TEAM'],
                                     ENV['SLACK_TOKEN'],
                                     { channel: ENV['SLACK_CHANNEL'], 
                                       username: ENV['SLACK_BOT_NAME'],
                                       icon_url: ENV['SLACK_ICON_URL']}
  notifier.notify message
end

notify "*#{%x(echo $USER).chomp}* has just executed `#{ARGV[0]}` at `#{ARGV[1]}`"
