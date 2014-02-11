namespace :db do
  desc "Fill database with sample data when the page in full of JS"
  task populate: :environment do
		# encoding: utf-8
		 
		require 'capybara'
		require 'capybara/dsl'
		require 'capybara-webkit'
		require 'nokogiri'
	
		 
		extend Capybara::DSL
		Capybara.run_server = false
		Capybara.current_driver = :webkit
		# Capybara.app_host = '<mon-hôte>'
		 
		mon_url = "http://www.biilink.com/pages/projets"
		visit mon_url
		html = page.body
		doc = Nokogiri::HTML(html)
		 
		mes_items = doc.css('http://www.biilink.com/pages/projets')
		mes_trucs_interessants = mes_items.map do |item|
			project_name = item.children.css('div.seaocore_title').children.text.strip
    		like = item.children.css('div.seaocore_stats.seaocore_txt_light').children.text.strip
    		nb_like[like.rindex('s')+1,like.length].lstrip.gsub(/[^\d]/, '').to_i

    		Project.create(name:project_name, likes:nb_like)

			end
		end
    end
   