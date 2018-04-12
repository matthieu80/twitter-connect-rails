FactoryGirl.define do
	factory :user do
		id 1
		uid "MyString"
		name "Zorro"
		provider "twitter"
		secret "mySecret"
		token "987654"
		avatar "https://myavatar.com/avatar"
	end
end