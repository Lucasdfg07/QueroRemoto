class InfoJobsCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.element-vaga')

	  	jobs.each do |job|
	  		
	  		photo = (!job.css('.vaga-logo').children[1].nil?) ? job.css('.vaga-logo').children[1].values[5] : nil
	  		name = job.css('.vaga').css('h2').text
	  		company = job.css('.container-vaga').css('.vaga-company').text
	  		description = job.css('.container-vaga').css('.area').text
	  		post_date = job.css('.container-vaga').css('.location2').css('span')[0].text
	  		link = job.css('.vaga').css('a').attribute('href').text
	  		salary = Nokogiri::HTML(open(job.css('.vaga').css('a').attribute('href').text)).css('.divSubTitle').text
	  		
	  		if (job.css('.vaga').css('h2').text).include?("emot")
				CentralCrawler.new.call(all_jobs, photo, name, company, description, post_date, link, salary) 
			end
	end
end