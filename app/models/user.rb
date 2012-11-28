class User < ActiveRecord::Base
  after_create :default_deck
  has_many :decks
  has_many :cards
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  private

  def default_deck
    self.decks.create(:name => "All cards")
  end

end
