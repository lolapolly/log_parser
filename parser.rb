require './lib/log_parser'

parser = LogParser.new(ARGV[0])

puts "Calculating views"

parser.calculate_views.each { |k, v| print "#{k} #{v} visits " }

puts "\nCalculating unique views"

parser.calculate_unique_views.each { |k, v| print "#{k} #{v} unique views " }
