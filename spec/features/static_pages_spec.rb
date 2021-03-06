require 'spec_helper'
 
describe "Static pages" do
 
 let(:base_title) { "Buy My Idea" }
  describe "Home page" do
 
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1') do |heading|
        heading.should have_content('Buydea')
      end
    end
    
    it "should not have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                       :text => "#{base_title}")

    end
  end
 
  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1') do |heading|
        heading.should have_content('Help')
      end
    end
    
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
        :text => "#{base_title} | Help")
      
    end
  end
 
  describe "About" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1') do |heading|
        heading.should have_content('About Us')
      end
    end
    
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                       :text => "#{base_title} | About Us")
      
    end
  end

  describe "Contact" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1') do |heading|
        heading.should have_content('Contact')
      end
    end
    
    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
                       :text => "#{base_title} | Contact")
      
    end
  end  
end