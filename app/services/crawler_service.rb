class CrawlerService
  def call(all_jobs, name, company, description, post_date, link)
    website_scraping(all_jobs, name, company, description, post_date, link)
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