user = FactoryGirl.create(:user, :confirmed, email: "email@example.com")
FactoryGirl.create_list(:article, 15, user: user)
