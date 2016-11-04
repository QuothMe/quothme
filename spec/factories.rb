FactoryGirl.define do 
  factory :quote do
    citation 'Quothed'
    association :user

    
    end

    factory :tag, :class => ActsAsTaggableOn::Tag do
      sequence :quote do |n|
        'tag #{n}'
      end


      
    end

    factory :tagging, class: ActsAsTaggableOn::Tagging do
      tag
      association :tagging, factory: :quote
      context 'tags'
    end
  end
  
  factory :user do
    sequence :user_id do |n|
      "#{n}"
    end
    sequence :email do |n|
      "email#{n}@email.com"
    end
    password 'supersecretpassword'
    password_confirmation 'supersecretpassword'

    first_name "Brad"
    last_name "Pitt"

   # quotes {[FactoryGirl.create(:quote, author_first_name: 'Johnny', author_last_name: 'Bravo')]}
    admin false


  end

  factory :admin do

    sequence :email do |n|
      'adminemail#{n}@gmail.com'
    end
    password 'supersecretpassword'
    password_confirmation 'supersecretpassword'
  end




end