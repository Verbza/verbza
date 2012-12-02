describe("Deck", function() {
	beforeEach(function() {
		loadFixtures("quiz.html.erb");
		deck = new Deck();
		deck.loadCards([{"native_word":"hello",
						 "foreign_word":"marhabaan"},
						{
						 "native_word":"student",
						 "foreign_word":"thalib"}]);
	});
	
	it("creates cards with the correct values", function() {
		expect(deck.cards[0].foreign_word).toEqual("marhabaan");
	});
	
	describe("quiz", function() {
		describe("on load", function() {
			it("displays a start game message", function() {
				expect($("#word_display")).toHaveText("Start game");
			});
		});
		
		describe("first click", function() {
			it("displays the native word of the first card", function() {
				$("#word_display").click();
				expect($("#word_display")).toHaveText(deck.cards[0].native_word);
			});
		});
		
		describe("second click", function() {
			it("displays the foreign word of the first card", function() {
				$("#word_display").click();
				$("#word_display").click();				
				expect($("#word_display")).toHaveText(deck.cards[0].foreign_word);
			});
		});
		
		describe("third click", function() {
			it("displays the native word of the second card", function() {
				$("#word_display").click();
				$("#word_display").click();
				$("#word_display").click();
				
				expect($("#word_display")).toHaveText(deck.cards[1].native_word);
			});
		});
		
		describe("end of deck", function() {
			it("displays a 'quiz complete' message", function() {
				for(var i = 0; i <= (deck.cards.length * 2); i++) {
					$("#word_display").click();
				}
				expect($("#word_display")).toHaveText("Quiz complete!");
			});
		});
	});
	
	describe("AJAX functions", function() {
		// tests for actual JSON calls
		
		it("makes an AJAX request to the correct URL", function() {
			spyOn($, "ajax");
			var ajax_deck = new Deck('url.json');
			expect($.ajax.mostRecentCall.args[0]["url"]).toEqual("url.json");
		});
		
		xit("makes a real AJAX request", function() {
			// how to test?
		})
	});
});