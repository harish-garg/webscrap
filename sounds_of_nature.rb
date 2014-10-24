# Downloads a list of MP3 files from the Archive.org's sounds of nature page.

require 'rubygems'
require 'nokogiri'
require 'open-uri'

DOWNLOAD_DIR = "downloads/"
Dir.mkdir(DOWNLOAD_DIR) unless File.exists?(DOWNLOAD_DIR)
LIST_FILE = "#{DOWNLOAD_DIR}/list.txt"
fo = File.new(LIST_FILE, "w" )

BASE_URL = "https://archive.org"
LIST_URL="https://archive.org/details/Sounds_of_Nature_Collection"

HEADERS = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

page = Nokogiri::HTML(open(LIST_URL))
links = page.css("a")
links.each do |link|	 
	if link["href"].match(".mp3")
		fo.puts BASE_URL+link["href"]
	end
end
