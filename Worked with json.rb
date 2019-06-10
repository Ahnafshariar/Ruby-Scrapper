require 'open-uri'
require 'nokogiri'
require 'csv'
require 'json'
  
PAGE_TO_VISIT = 'https://www.timeanddate.com/holidays/russia/'
 
content = open(PAGE_TO_VISIT).read
html_doc = Nokogiri::HTML(content)
api = []

    html_doc.css('table tbody tr').each do |row|


        date = row.at_css('th:nth-child(1)').content
        weekday = row.at_css('td:nth-child(2)').content
        holiday_name = row.at_css('td:nth-child(3)').content
        holiday_type = row.at_css('td:nth-child(4)').content
        
            api.push(
                
                date:  date, 
                weekday: weekday,
                holiday_name: holiday_name , 
                holiday_type: holiday_type
            )

            puts api

            #weekday = student_row.at_css('td:nth-child(2)').content
            #holiday_name = student_row.at_css('td:nth-child(3)').content
        
            #holiday_type = student_row.at_css('td:nth-child(4)').content

            
            #puts date, weekday, holiday_name, holiday_type 
          
    end


#api.to_json

json = JSON.pretty_generate(api)
File.open("Api.json", 'w') { |file| file.write(json) }
    

