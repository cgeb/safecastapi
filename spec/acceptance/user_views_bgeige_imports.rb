require "spec_helper"

feature "User views bGeigie imports" do
  let!(:user) { Fabricate(:user) }
  let!(:bgeigie_import) { Fabricate(:bgeigie_import, :user => user, :name => 'my import', :status => "done") }
  let!(:public_bgeigie_import) { Fabricate(:bgeigie_import, :status => "done") }
  let!(:pending_bgeigie_import) { Fabricate(:bgeigie_import) }

  scenario "viewing bGeigie imports" do
    sign_in(user)
    visit('/')
    click_link("Imports")
    page.should have_content("Yours")
    page.should have_content("Public")

    page.should have_content(bgeigie_import.name)
    page.should have_content('[unnamed]') #public_bgeigie_import has no name.
  end


 end 
