class GenerateEventsJob
  include Sidekiq::Job

  def perform
    3.times do
      event = Event.new(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph,
                        venue: Faker::Address.street_address << ',' << Faker::Address.city << '.',
                        host: Faker::Name.name,
                        eventdate: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1))
      event.save
    end
  end
end
