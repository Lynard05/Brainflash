package com.techelevator;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.Card;
import com.techelevator.model.CardDAO;
import com.techelevator.model.JDBCCardDAO;

public class CardDAOIntegrationTest extends DAOIntegrationTest {
	/*
	 * Using this particular implementation of DataSource so that every database
	 * interaction is part of the same database session and hence the same database
	 * transaction
	 */
	private JdbcTemplate jdbcTemplate;
	private CardDAO cardDao;
	private Card card;

	private static final Integer cardId = 8888;
	private static final Integer deckId = 1;
	private static final String question = "test question?";
	private static final String answer = "test answer";
	private static final String tags = "test tags";
	private static final String keyword1 = "key";
	private static final String keyword2 = "word";
	private static final String keyword3 = "potato";

	@Before
	public void setup() {
		cardDao = new JDBCCardDAO(getDataSource());
		jdbcTemplate = new JdbcTemplate(getDataSource());
		Card card = makeCard(
				cardId,
				deckId,
				question,
				answer,
				tags,
				keyword1,
				keyword2,
				keyword3);
	}

	@Test
	public void create_card_increases_number_of_cards_by_one_for_selected_deckId() {
		String sizeSql = "SELECT COUNT(card_id) AS card_count FROM note_card";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sizeSql);
		result.next();
		int originalSize = result.getInt("card_count");

		cardDao.createCard(card);

		SqlRowSet newResult = jdbcTemplate.queryForRowSet(sizeSql);
		newResult.next();

		int updatedSize = newResult.getInt("card_count");

		Assert.assertEquals(originalSize + 1, updatedSize);
	}

	private Card makeCard(
			Integer cardId,
			Integer deckId, String question, String answer, String tags, String keyword1, String keyword2,
			String keyword3) {

		this.card = new Card();

		card.setCardId(cardId);
		card.setDeckId(deckId);
		card.setQuestion(question);
		card.setAnswer(answer);
		card.setTags(tags);
		card.setKeyword1(keyword1);
		card.setKeyword2(keyword2);
		card.setKeyword3(keyword3);

		return card;

	}

}
