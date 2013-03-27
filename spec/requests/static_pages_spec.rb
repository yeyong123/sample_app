require 'spec_helper'

describe "Static pages" do
  subject { page }
  let(:base_title) {'Ruby on Rails Tutorial Sample App'}
  
  describe "Home page" do
    before {visit root_path }
    it { should have_selector('h1', text: 'Sample App')}
    it { should have_selector 'title',text: "#{base_title} | Home"}
    
    describe "for signed-in user" do
      let(:user) { FactoryGirl.create(:user)}
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsom")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
       end
     end
  end

  describe "Help pages" do  
    before { visit help_path }                        
    it { should have_selector('h1',text: 'Help')}
    it { should have_selector 'title',text: "#{base_title} | Help"}
  end
	
	describe "About Us" do
	  before { visit about_path }
	  it { should have_selector('h1',text: 'About Us')}
	  it { should have_selector 'title',text: "#{base_title} | About Us"}
	end
	
	describe "Contact" do
	  before { visit contact_path }
	  it { should have_selector('h1', text: 'Contact')}
	  it { should have_selector 'title', text:"#{base_title} | Contact"}
	end
end



