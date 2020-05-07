class InfoJobsCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.element-vaga')

	  	jobs.each do |job|
	  		if (job.css('.vaga').css('h2').text).include?("emot")
				CentralCrawler.new.call(all_jobs, job.css('.vaga').css('h2').text,
								 job.css('.container-vaga').css('.vaga-company').text,
								 job.css('.container-vaga').css('.area').text,
								 job.css('.container-vaga').css('.location2').css('span')[0].text,
								 job.css('.vaga').css('a').attribute('href').text,
								 Nokogiri::HTML(open(job.css('.vaga').css('a').attribute('href').text)).css('.divSubTitle').text)
			end
		end
	end
end