require 'rails_helper'

describe 'nativigate' do
	describe 'homepage' do
		it 'can be reached successfully' do
			visit root_path
			expect(page.status_code).to eq(200)
		end
	end
	describe 'articles' do
		it 'can be reached successfully' do
			visit articles_path
			expect(page.status_code).to eq(200)
			expect(page).to have_content(/Article/)
		end
	end
end