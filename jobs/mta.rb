require 'nokogiri'

MTA_URL = 'http://www.mta.info/status/serviceStatus.txt'
LINES = %W[123 456 7 ACE L S BDFM NQR JZ G]

def status_as_class description
  case description.downcase
  when 'good service' then 'online'
  when 'service change' then 'delays'
  else 'offline'
  end
end

def line_status line, in_lines, feed
  line_status = feed
    .css("line:contains(#{in_lines})")
    .find {|line| line.css('name').text.chomp == in_lines}
  status = line_status.css('status').text.chomp
  {name: line, status: status_as_class(status)}
end

SCHEDULER.every '5m', first_in: 0 do
  feed = Nokogiri::XML.parse HTTParty.get(MTA_URL)

  line_statuses = LINES.collect do |lines|
    lines.split(//).map do |line|
      line_status(line, lines, feed)
    end
  end.flatten

  send_event('mta', {items: line_statuses})
end
