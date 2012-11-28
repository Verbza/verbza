# Notes
 * Goal: Learn when it counts
 * Users: Language Learners

# TODOs

1. First Iteration (due by Wednesday):

2. Users: 
	- sign up 
	- log in 
	- account management via Devise

3. Input: 
	- via a web form.
	- User enters a term in their mother tongue, optional upload of associated background image
	- User also enters the word in the foreign language

4. Decks: 
  - Every user has a default ‘all cards’ deck

5. Quiz: 
	- start quiz for a deck,
	- User is presented with the cards (in some kind of order?)
	- User has the option to flip the same card back and forth and to proceed to the next card

6. Models:			
	- Card Model: 
	- belongs_to :user, has_many :decks, :through => cards_decks, native_word, foreign_word, picture (check out paperclip for more info)
	- Deck Model: belongs_to, :user, has_many :cards, :through => cards_decks, name
	- User Model: has_many :decks, has_many :cards




# Second iteration:

1. Input: add option to input via mobile (email/text?),
	- User sends a message containing the word in their mother tongue, 
	- option to also send the translation they want to include, 
	- option to also include an image

2. Decks: User has the option to assign a card to a custom deck,
	-	when a card is added via mobile, user must finalize the card and add it to a deck (occurs at next user login to web app)
	- User can re-assign cards to different decks/multiple decks

3. Quiz: Basic performance tracking - how many times right, how many times wrong globally

4. User Model: add a folder in /images for each user when they successfully create an account named with their user_id for storing their uploaded images

5. Deck Model: regarding sharing decks: schema will have to be changed to a deck having many users through users_decks 
(think about this later, could be  complicated; think about deleting users’ photos for their decks for privacy concerns)

