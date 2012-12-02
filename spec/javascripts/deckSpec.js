describe("Deck", function() {
	beforeEach(function() {
		loadFixtures("quiz.html.erb");
		deck = new Deck();
		deck.loadCards([{"created_at":"2012-12-01T23:18:17Z",
						 "foreign_word":"hello",
						 "id":2,
						 "native_word":"marhabaan",
						 "updated_at":"2012-12-01T23:18:17Z",
						 "user_id":1}]);
	});
	
	it("creates cards with the correct values", function() {
		expect(deck.cards[0].foreign_word).toEqual("hello");
	});
	
	describe("quiz", function() {
		describe("on load", function() {
			it("displays a start game message", function() {
				expect($("#word_display")).toHaveText("Start game");
			})
		})
		
		describe("first click", function() {
			it("displays the native word of the first card", function() {
				$("#word_display").click();
				expect($("#word_display")).toHaveText(deck.cards[0].native_word);
			})
		})
	})
	
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