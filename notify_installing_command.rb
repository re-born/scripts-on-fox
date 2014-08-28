require 'slack-notify'
require 'dotenv'
Dotenv.load (File.expand_path('../.env', __FILE__))

def notify message
  notifier = SlackNotify::Client.new ENV['SLACK_TEAM'],
                                     ENV['SLACK_TOKEN'],
                                     { channel: ENV['SLACK_CHANNEL'], 
                                       username: 'fox @ Ubuntu',
                                       icon_url: 'http://l0o0l.co/material/sakai_lab/fox.png'}
  notifier.notify message
end

notify "#{%x(echo $USER).chomp} has just executed `#{ARGV.join(' ')}`"
