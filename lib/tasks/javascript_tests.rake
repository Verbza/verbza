namespace :test do
  desc "create some test data for jasmine tests, run jasmine tests, then destroy data"
  task :js_test => :environment do
    Rails.env = 'test'
    deck = Deck.create(:name => "Test")
    c1 = Card.create(:native_word => "laptop", :foreign_word => "whizzbang")
    c2 = Card.create(:native_word => "mug", :foreign_word => "caffeine vessel")
    c3 = Card.create(:native_word => "hat", :foreign_word => "head warmer")

    deck.cards << c1
    deck.cards << c2
    deck.cards << c3

    Rake::Task['jasmine:ci'].invoke

    # [deck, c1, c2, c3].each { |test_obj| test_obj.destroy }
  end
end