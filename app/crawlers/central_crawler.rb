class CentralCrawler
	def call(all_jobs, photo, name, company, description, post_date, link, salary)
		salary = "a combinar" if salary.empty?

		setting_array(all_jobs, 
					  photo,
  					  name.strip.gsub("\n", " ").delete("\r"), 
  					  company.strip.gsub("\n", " ").delete("\r"), 
  					  description.strip.gsub("\n", " ").delete("\r"), 
  					  post_date.strip.gsub("\n", " ").delete("\r"), 
  					  link.strip.gsub("\n", " ").delete("\r"), 
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