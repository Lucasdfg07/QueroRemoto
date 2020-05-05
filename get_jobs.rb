require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scraper
  def get_jobs
  	phrase = "Assistente"

  	url = "https://www.vagas.com.br/vagas-de-#{phrase}?b%5B%5D=Home+office"

    html = open(url)

    doc = Nokogiri::HTML(html)

    all_jobs = []

    vagas_elements(all_jobs, doc)
    # byebug
  end

  def vagas_elements(all_jobs, doc)
  	jobs = doc.css('.vaga')
  	
  	jobs.each do |job|
		website_scraping(all_jobs, job.css('.informacoes-header').css('h2').children[1].attribute('title').text,
						 job.css('.informacoes-header').css('span')[0].text,
						 job.css('.detalhes').children.children.text,
						 job.css('.data-publicacao').children[1].text,
						 "http://vagas.com.br#{job.css('.link-detalhes-vaga').attribute('href').text}/")
	end

	puts all_jobs
  end

  def website_scraping(all_jobs, name, company, description, post_date, link)
  	setting_array(all_jobs, name, company, description, post_date, link)
  end

  def setting_array(all_jobs, name, company, description, post_date, link)
  	job_array = {
    	name: name,
    	company: company,
    	description: description,
    	post_date: post_date,
    	link: link
    }

    all_jobs << job_array
  end

end

scrape = Scraper.new
scrape.get_jobs