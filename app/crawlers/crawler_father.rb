require 'nokogiri'
require 'open-uri'
require 'byebug'

class CrawlerFather
  def call(phrase)
  	all_jobs = []

    phrase = phrase.gsub("á", "a")
    phrase = phrase.gsub("é", "e")
    phrase = phrase.gsub("í", "i")
    phrase = phrase.gsub("ó", "o")
    phrase = phrase.gsub("ú", "u")
    phrase = phrase.gsub("ç", "c")
    phrase = phrase.gsub("ã", "a")
    phrase = phrase.gsub("ẽ", "e")
    phrase = phrase.gsub("ĩ", "i")
    phrase = phrase.gsub("õ", "o")
    phrase = phrase.gsub("ũ", "u")


  	url = "https://www.vagas.com.br/vagas-de-#{phrase.gsub(" ","-")}?b%5B%5D=Home+office"
    VagasCrawler.new.call(all_jobs, url)


    url = "https://www.infojobs.com.br/empregos.aspx?Palabra=#{phrase.gsub(" ","%20")}%20remoto"
  	InfoJobsCrawler.new.call(all_jobs, url)

  	url = "https://www.indeed.com.br/empregos-de-#{phrase.gsub(" ","-")}-remoto"
  	IndeedCrawler.new.call(all_jobs, url)

  	all_jobs
  end
end