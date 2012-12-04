class Card < ActiveRecord::Base
  belongs_to :user

  has_many :card_decks
  has_many :decks, :through => :card_decks

  attr_accessible :decks, :foreign_word, :native_word, :user_id, :image_file_name, :image

  has_attached_file :image,
      :styles => { 
      :medium => "300x300>", 
      :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_KEY']
    },
    :path => "/:style/:id/:filename"
    

  validates :native_word,
    :presence => true

  validates :foreign_word,
    :presence => true

end