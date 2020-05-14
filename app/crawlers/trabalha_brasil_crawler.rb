class TrabalhaBrasilCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.job__container')
	  	
	  	jobs.each do |job|
	  		
	  		photo = nil
	  		name = job.css('.job-vacancy-occupation').text
	  		company = "Não Informado"
	  		description = job.css('.job-vacancy-description').text
	  		post_date = "Não identificado"
	  		link = "https://trabalhabrasil.com.br#{job.css('.job-vacancy').attribute('href').value}"
	  		salary = Nokogiri::HTML(open("https://trabalhabrasil.com.br#{link}")).css('.job-plain-text')[2].children.text
	  		
			CentralCrawler.new.call(all_jobs, photo, name, company, description, post_date, link, salary)
		end
	end
end