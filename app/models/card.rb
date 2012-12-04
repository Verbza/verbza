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


  validates :native_word,  :presence => true, :if => :foreign_word?
  validates :foreign_word, :presence => true, :if => :native_word?

  def foreign_word?
    :foreign_word == nil
  end

  def native_word?
    :native_word == nil
  end


end