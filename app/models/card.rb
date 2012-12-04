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
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"
    

  validates :native_word,
    :presence => true

  validates :foreign_word,
    :presence => true

end