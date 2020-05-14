class VagasCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.vaga')
	  	
	  	jobs.each do |job|
	  		
	  		photo = job.css('.logoEmpresa').children[1].values[1]
	  		name = job.css('.informacoes-header').css('h2').children[1].attribute('title').text
	  		company = job.css('.informacoes-header').css('span')[0].text
	  		description = job.css('.detalhes').children.children.text
	  		post_date = job.css('.data-publicacao').children[1].text
	  		link = "http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/"
	  		salary = Nokogiri::HTML(open("http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/")).css('.infoVaga')[0].css('.clearfix').css('li').css('div').css('span')[1].text
	  		
			CentralCrawler.new.call(all_jobs, photo, name, company, description, post_date, link, salary)
		end
	end
end