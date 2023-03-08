admin = User.create!(name: "Evgeny", email: "joker@gmail.com", phone: "79622692295", password: "asdf1234", password_confirmation: "asdf1234", role: "admin")
user = User.create!(name: "Юлия Морозова", email: "avatar@gmail.com", phone: "7906222222", password: "asdf1234", password_confirmation: "asdf1234", role: "user")

admin.courses.create!(title: "Happy Body", description: "bla bla bla", price: 2500.00)
course = Course.last
course.lessons.create(title: "This is title for lesson 1", content: "This is content", habit: "This is habit", equipment: "This is equipment", video: "youtube url")
course.lessons.create(title: "This is title for lesson 1", content: "This is content2", habit: "This is habit2", equipment: "This is equipment2", video: "youtube url2")

user.questions.create!(title: "My first title", body: "How are you?")
Question.last.answers.create!(body: "Nice", user_id: admin.id)