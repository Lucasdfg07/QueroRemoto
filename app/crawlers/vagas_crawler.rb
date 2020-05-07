class VagasCrawler
	def call(all_jobs, url)
		html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.vaga')
	  	
	  	jobs.each do |job|
			CentralCrawler.new.call(all_jobs, job.css('.informacoes-header').css('h2').children[1].attribute('title').text,
							 job.css('.informacoes-header').css('span')[0].text,
							 job.css('.detalhes').children.children.text,
							 job.css('.data-publicacao').children[1].text,
							 "http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/",
							 Nokogiri::HTML(open("http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/")).css('.infoVaga')[0].css('.clearfix').css('li').css('div').css('span')[1].text)
		end
	end
end