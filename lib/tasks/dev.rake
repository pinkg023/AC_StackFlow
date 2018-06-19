namespace :dev do
  task fake_user: :environment do
    User.destroy_all

    20.times do
      User.create!(
        name:  FFaker::Name.first_name,
        email: FFaker::Internet.unique.email,
        password: '12345678'
      )
    end
    puts 'have created fake users'
    puts "now you have #{User.count} users data"
  end

  task fake_question: :environment do
    Question.destroy_all
    10.times do
      Question.create!(
        subject: FFaker::Lorem.sentence,
        content: FFaker::Lorem.paragraph,
        user: User.all.sample
      )
    end
    puts 'have created fake questions'
    puts "now you have #{Question.count} questions data"
  end

  task fake_answer: :environment do
    Answer.destroy_all
    Question.all.each do |question|
      3.times do
        question.answer.create!(
          content: FFaker::Lorem.paragraph,
          user: User.all.sample
        )
      end
    end
    puts 'have created fake answers'
    puts "now you have #{Answer.count} Answer data"
  end

  task fake_answer_upvote: :environment do
    AnswerUpvote.destroy_all
    Answer.all.each do |answer|
      3.times do
        answer.answer_upvotes.create!(
          user: User.all.sample,
          answer: answer
        )
      end
    end
    puts 'have created fake answer upvotes'
    puts "now you have #{AnswerUpvote.count} Answer upvotes data"
  end

  task fake_question_upvote: :environment do
    QuestionUpvote.destroy_all
    Question.all.each do |question|
      3.times do
        question.question_upvotes.create!(
          user: User.all.sample,
          question: question
        )
      end
    end
    puts 'have created fake question upvotes'
    puts "now you have #{QuestionUpvote.count} Question upvotes data"
  end

end