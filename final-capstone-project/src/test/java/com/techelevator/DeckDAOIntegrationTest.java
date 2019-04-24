package com.techelevator;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.Deck;
import com.techelevator.model.DeckDAO;
import com.techelevator.model.JDBCDeckDAO;

public class DeckDAOIntegrationTest extends DAOIntegrationTest {

	private DeckDAO deckDao;
	private JdbcTemplate jdbcTemplate;
	private Deck deck;
	private static final Integer deckId = 100;
	private static final Integer userId = 1;
	private static final String name = "test name";
	private static final String description = "test description";

	@Before
	public void setup() {
		deckDao = new JDBCDeckDAO(getDataSource());
		jdbcTemplate = new JdbcTemplate(getDataSource());
		Deck deck = makeDeck(deckId, userId, name, description);
	}

	@Test
	public void create_deck_increases_number_of_decks_by_one() {
		String sizeSql = "SELECT COUNT(deck_id) AS deck_count FROM deck";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sizeSql);
		result.next();
		int originalSize = result.getInt("deck_count");

		deckDao.saveDeck(deck);

		SqlRowSet newResult = jdbcTemplate.queryForRowSet(sizeSql);
		newResult.next();

		int updatedSize = newResult.getInt("deck_count");

		Assert.assertEquals(originalSize + 1, updatedSize);
	}

	private Deck makeDeck(Integer deckId, Integer userId, String name, String description) {
		this.deck = new Deck();

		deck.setDeckId(deckId);
		deck.setUserId(userId);
		deck.setName(name);
		deck.setDescription(description);

		return deck;
	}

}
