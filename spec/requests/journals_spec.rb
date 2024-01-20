# spec/requests/journals_spec.rb
require 'rails_helper'

RSpec.describe JournalsController, type: :controller do
  describe 'POST #create' do
    context 'when last entry date is nil or more than 48 hours ago' do
      it 'resets the counter' do
        user = User.create(
          nickname: 'JohnDoe',
          first_name: 'John',
          last_name: 'Doe',
          gender: 'Male',
          age: 30,
          country: 'USA',
          occupation: 'Developer',
          email: 'john@example.com',
          last_entry_at: nil
        )
        post :create, params: { user_id: user.id, journal: { content: 'Some content' } }
        expect(user.journals.last.counter).to eq(1)
      end

      it 'resets the counter after 48 hours' do
        user = User.create(
          nickname: 'JaneDoe',
          first_name: 'Jane',
          last_name: 'Doe',
          gender: 'Female',
          age: 28,
          country: 'Canada',
          occupation: 'Designer',
          email: 'jane@example.com',
          last_entry_at: 3.days.ago
        )
        post :create, params: { user_id: user.id, journal: { content: 'Some content' } }
        expect(user.journals.last.counter).to eq(1)
      end
    end

    context 'when last entry date is within the last 48 hours' do
      it 'increments the counter' do
        user = User.create(
          nickname: 'Alice',
          first_name: 'Alice',
          last_name: 'Wonderland',
          gender: 'Female',
          age: 25,
          country: 'UK',
          occupation: 'Adventurer',
          email: 'alice@example.com',
          last_entry_at: 1.day.ago
        )
      
        # Pravimo prvi unos u dnevniku
        post :create, params: { user_id: user.id, journal: { content: 'First entry' } }
        expect(user.journals.last.counter).to eq(1)
      
        # Postavljamo last_entry_date za 1 dan unapred
        user.journals.last.update(last_entry_date: 1.day.from_now)
        
        puts "Counter before: #{user.journals.last.counter}"
      
        # Pravimo drugi unos u dnevniku
        puts "Counter before: #{user.journals.last.counter}"
        post :create, params: { user_id: user.id, journal: { content: 'Second entry' } }
        puts "Counter after: #{user.journals.last.counter}"
                
        puts "Counter after: #{user.journals.last.counter}"
        expect(user.journals.last.counter).to eq(2)
      end
    end
  end
end
