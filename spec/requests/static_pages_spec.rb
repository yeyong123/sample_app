require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1',:text => 'Sample App')
    end
    it "should have the title 'Home'" do            #测试是首页上的内容是不是Sample App的单词。
      visit '/static_pages/home'                    #测试首页所在的路由位置,由capybara\
      page.should have_selector('title',            #页面上标题含有这个Sample App的单词.
                           :text => 'Ruby on Rails Tutorial Sample App | Home')       
                         
    end
  end

  describe "Help pages" do                         #测试帮助页面的h1里面的子是不是这个单词 
    it "should have the h1 'Help'" do         #检查这个页面内容中又Help这个字吗
      visit '/static_pages/help'                   #链接要测试的路由地址
      page.should have_selector('h1',:text => 'Help')
    end
    it "should have have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', 
                           :text => 'Ruby on Rails Tutorial Sample App | Help')             
                           #页面的内容是否含有这个单词
    end
  end
	
	describe "About Us" do
	  it "should have the h1 'About Us'" do
	    visit "/static_pages/about"
	    page.should have_selector('h1',:text => 'About Us')
	  end
	    it "should have the title 'About Us'" do
	    visit '/static_pages/about'
	    page.should have_selector('title', 
	                         :text => 'Ruby on Rails Tutorial Sample App | About Us')
	  end
	end
end
