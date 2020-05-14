class IndeedCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.result')

	  	jobs.each do |job|
	  		
	  		photo = nil
	  		name = job.css('.title').children.text
	  		company = job.css('.company').text
	  		description = job.css('.summary').text
	  		post_date = job.css('.date')[0].text
	  		link = "http://indeed.com.br#{job.css('.title').css('a').attribute('href').value}"
	  		salary = job.css('.salaryText').text

	  		if (job.css('.title').children.text).include?("emot")
				CentralCrawler.new.call(all_jobs, photo, name, company, description, post_date, link, salary)
			end
		end
	end
end