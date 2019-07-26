require './lib/log_parser'

file_name = ARGV[0]

parser = LogParser.new(file_name)

puts 'Calculating views'

parser.calculate_views.each { |k, v| print "#{k} #{v} visits " }

puts "\nCalculating unique views"

parser.calculate_unique_views.each { |k, v| print "#{k} #{v} unique views " }
