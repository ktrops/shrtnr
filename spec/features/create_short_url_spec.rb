require 'spec_helper'

describe "creating a short url" do
	  context "when not signed in" do
      let(:link) { create(:link)}

  		it "shows the shortened link" do
        
        visit root_path
        fill_in 'link_long_url', :with => link.long_url

  			click_on("Shorten It!")
        expect(page).to have_content link.short_url
        expect(page).to have_content link.long_url
  				
  		end
  	end
  

  context "when signed in" do
    let(:user) { create(:user) }
    
    before do
      login_as user
     
    end
    let(:link) { create(:link)}
    it "should show the short url" do
      visit dashboard_path 
      fill_in 'link_long_url', :with => link.long_url
      click_on("Shorten It!")
      expect(page).to have_content link.short_url
    end

  end
end
