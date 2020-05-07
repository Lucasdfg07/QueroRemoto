class IndeedCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.result')

	  	jobs.each do |job|
			CentralCrawler.new.call(all_jobs, job.css('.title').children.text,
							 job.css('.company').text,
							 job.css('.summary').text,
							 job.css('.date')[0].text,
							 "http://indeed.com.br#{job.css('.title').css('a').attribute('href').value}",
							 job.css('.salaryText').text)
		end
	end
end