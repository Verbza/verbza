# Notes
 * Goal: Learn when it counts
 * Users: Language Learners

# Flow


  1. First Iteration (due by Wednesday):

	 	* Users: 
	 		- sign up 
	 		- log in 
	 		- account management via Devise

		* Input: 
			- via a web form
			- User enters a term in their mother tongue, optional upload of associated background image
			- User also enters the word in the foreign language

    * Decks: 

    	- Every user has a default ‘all cards’ deck

		* Quiz: 

			- start quiz for a deck,
			- User is presented with the cards (in some kind of order?).
			- User has the option to flip the same card back and forth and to proceed to the next card.


		* Models:
			
			- Card Model: 
		 		belongs_to :user, has_many :decks, :through => cards_decks, native_word, foreign_word, picture (check out paperclip for more info)
			- Deck Model: belongs_to, :user, has_many :cards, :through => cards_decks, name
			- User Model: has_many :decks, has_many :cards
