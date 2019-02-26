require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

attr_accessor :students

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
     scraped_students = []

     doc.css(".student-card").each do |student|
      scraped_students << {
        name: student.css("h4.student-name").text,
        location: student.css("p.student-location").text,
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
    end
    scraped_students
  end
 
 def self.scrape_profile_page(profile_url)
       doc = Nokogiri::HTML(open(profile_url))
  end	    student = Hash.new


     social_icons = doc.css("div.social-icon-container a").collect {|x| x.attribute("href").value}
    social_icons.each do |social_icon|
      if social_icon.include?("linkedin")
        student[:linkedin] = social_icon
      elsif social_icon.include?("github")
        student[:github] = social_icon
      elsif social_icon.include?("twitter")
        student[:twitter] = social_icon
      else
        student[:blog] = social_icon
      end
 end  
 




