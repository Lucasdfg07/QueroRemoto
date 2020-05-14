class CathoCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.boxVaga')
	  	
	  	jobs.each do |job|
	  		
	  		photo = nil
	  		name = job.attribute('data-gtm-dimension-38').value
	  		company = "Não Informado"
	  		description = job.css('.descriptionComplete').text
	  		post_date = job.css('.dataAnuncio').text
	  		link = job.css('.viewVagaAction').attribute('href').value
	  		salary = jobs.css('.salarioLocal').text
	  		
			CentralCrawler.new.call(all_jobs, photo, name, company, description, post_date, link, salary)
		end
	end
end