require 'nokogiri'
require 'open-uri'
require 'byebug'

class CrawlerFather
  def call(phrase)
  	all_jobs = []

  	url = "https://www.vagas.com.br/vagas-de-#{phrase.gsub(" ","-")}?b%5B%5D=Home+office"
    VagasCrawler.new.call(all_jobs, url)


    url = "https://www.infojobs.com.br/empregos.aspx?Palabra=#{phrase.gsub(" ","%20")}%20remoto"
  	InfoJobsCrawler.new.call(all_jobs, url)

  	url = "https://www.indeed.com.br/empregos?q=#{phrase.gsub(" ","-")}&l="
  	IndeedCrawler.new.call(all_jobs, url)

  	puts all_jobs
  end
end