require 'nokogiri'
require 'open-uri'

class Scraper
  def get_jobs
  	phrase = "Assistente"

  	all_jobs = []

  	url = "https://www.vagas.com.br/vagas-de-#{phrase}?b%5B%5D=Home+office"
    # vagas(all_jobs, url)

    

    url = "https://www.infojobs.com.br/empregos.aspx?Palabra=#{phrase}%20remoto"
  	info_jobs(all_jobs, url)

  	url = "https://www.indeed.com.br/empregos?q=#{phrase}&l="
  	# indeed(all_jobs, url)

  	# puts all_jobs
  end

  def vagas(all_jobs, url)
	  	html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.vaga')

	  	
	  	jobs.each do |job|
			website_scraping(all_jobs, job.css('.logoEmpresa').children[1].values[1], 
							 job.css('.informacoes-header').css('h2').children[1].attribute('title').text,
							 job.css('.informacoes-header').css('span')[0].text,
							 job.css('.detalhes').children.children.text,
							 job.css('.data-publicacao').children[1].text,
							 "http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/",
							 Nokogiri::HTML(open("http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/")).css('.infoVaga')[0].css('.clearfix').css('li').css('div').css('span')[1].text)
		end
  end

  def info_jobs(all_jobs, url)
	  	html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.element-vaga')

	  	jobs.each do |job|
	  		if (job.css('.vaga').css('h2').text).include?("emot")
				website_scraping(all_jobs, (job.css('.vaga-logo').children[1].values[5].present?) ? job.css('.vaga-logo').children[1].values[5].present? : nil, 
								 job.css('.vaga').css('h2').text,
								 job.css('.container-vaga').css('.vaga-company').text,
								 job.css('.container-vaga').css('.area').text,
								 job.css('.container-vaga').css('.location2').css('span')[0].text,
								 job.css('.vaga').css('a').attribute('href').text,
								 Nokogiri::HTML(open(job.css('.vaga').css('a').attribute('href').text)).css('.divSubTitle').text)
			end
		end
  end

  def indeed(all_jobs, url)
	  	html = open(url)

	    doc = Nokogiri::HTML(html)

	  	jobs = doc.css('.result')

	  	jobs.each do |job|
			website_scraping(all_jobs, job.css('.title').children.text,
							 job.css('.company').text,
							 job.css('.summary').text,
							 job.css('.date')[0].text,
							 "http://indeed.com.br#{job.css('.title').css('a').attribute('href').value}",
							 job.css('.salaryText').text)
		end
  end

  def website_scraping(all_jobs, photo, name, company, description, post_date, link, salary)
  		setting_array(all_jobs, 
  					  name.strip.delete("\n").delete("\r"), 
  					  company.strip.delete("\n").delete("\r"), 
  					  description.strip.delete("\n").delete("\r"), 
  					  post_date.strip.delete("\n").delete("\r"), 
  					  link.strip.delete("\n").delete("\r"), 
  					  salary.split.join(" "))
  end

  def setting_array(all_jobs, photo, name, company, description, post_date, link, salary)
	  	job_array = {
	  		photo: photo,
	    	name: name,
	    	company: company,
	    	description: description,
	    	post_date: post_date,
	    	link: link,
	    	salary: salary
	    }

	    all_jobs << job_array
  end

end

scrape = Scraper.new
scrape.get_jobs
puts scrape.get_jobs