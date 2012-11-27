#!/usr/bin/env ruby

################################
# TODO                         #
# - error handling             #
# - add tests                  #
# - integrate with Create User #
################################

require 'net/http'

module UserInfo
  def self.get_user_info(username)
    url = "https://itwebapps.grinnell.edu/classic/asp/campusdirectory/GCdefault.asp?transmit=true&email=#{username}"
    src = fetch(url)
    number = /SomeKindofNumber=#{username}([0-9]{3})/.match(src)[1]
    url = "https://itwebapps.grinnell.edu/classic/asp/campusdirectory/GCdisplaydata.asp?SomeKindofNumber=#{username}#{number}"
    src = fetch(url)

    photo_id_match = %r{\.\./\.\./\.\./PcardImages/moved/([0-9]+)\.jpg}.match(src)
    if photo_id_match
      photo_path_fragment = photo_id_match[1]
    else
      photo_path_fragment = "link/gone"
    end

    { name: %r{Name\*?:</strong></TD><TD valign="top">(.+) <}.match(src)[1],  # "Name*:" appears if user has nickname
      year: %r{Class:</strong></TD><TD valign="top">([0-9]{4})<}.match(src)[1],
      box: %r{Campus Box:</strong></TD><TD valign="top">([0-9]{4})<}.match(src)[1],
      photo_url: "https://itwebapps.grinnell.edu/PcardImages/moved/#{photo_path_fragment}.jpg"
    }
  end

  private
    def self.fetch(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
      src = http.get(uri.request_uri).body
    end
end

# Temporary: execute this file to test scrapes by hand
if __FILE__ == $PROGRAM_NAME
  if ARGV.size != 1
    abort('Usage: ruby scrape.rb USERNAME')
  end
  
  user = UserInfo::get_user_info(ARGV[0])
  puts " Name: #{user[:name]}"
  puts " Year: #{user[:year]}"
  puts "  Box: #{user[:box]}"
  puts "Photo: #{user[:photo_url]}"
end
