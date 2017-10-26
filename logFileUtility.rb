##############################################################################
# Run logFileUtility.rb, passing in the root directory that you would like to
# 'cleanse'.
# ex: logFileUtility.rb /Users/hays5000/Documents/Development
#
# Program will recursively search for any files with a .log extension and
# replace any strings/emails within the qualified files that satisfy the
# 'email_regex' RE, with the string *protected*
#
# The 'path' variable holds the directory that was passed into the utility.
##############################################################################

puts 'Beginning Log File Utility'

email_regex = /([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4})/i
path = ARGV[0]


Dir.glob("#{path}/**/*.log") do |file_name|
  text = File.read(file_name)
  replace = text.gsub!(email_regex, '*protected*')
  File.open(file_name, "w") {
    |file| file.puts replace
  }
end

puts 'Log File Utility Completed'
