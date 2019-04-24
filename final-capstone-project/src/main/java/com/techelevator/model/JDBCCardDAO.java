package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCardDAO implements CardDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public JDBCCardDAO(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public Card getCardCountByDeckId(Integer deckId) {
		return null;
	}

	@Override
	public void createCard(Card card) {

		String sqlInsertCard = "INSERT INTO note_card (deck_id, question, answer, tags, keyword_1, keyword_2, keyword_3) VALUES(?, ?, ?, ?, ?, ?, ?);";
		jdbc.update(sqlInsertCard, card.getDeckId(), card.getQuestion(), card.getAnswer(), card.getTags(),
				card.getKeyword1(), card.getKeyword2(), card.getKeyword3());
	}

	@Override
	public Card getCardByCardId(Integer cardId) {
		String sqlCardById = "SELECT * FROM note_card WHERE card_id = ?";
		SqlRowSet results = jdbc.queryForRowSet(sqlCardById, cardId);
		Card card = mapRowToCard(results);

		return card;
	}

	@Override
	public List<Card> getCardsByDeckId(Integer deckId) {
		List<Card> cards = new ArrayList<>();
		String sqlGetCardsByDeckId = "SELECT card_id, deck_id, question, answer, tags, keyword_1, keyword_2, keyword_3 FROM note_card WHERE deck_id = ?;";
		SqlRowSet results = jdbc.queryForRowSet(sqlGetCardsByDeckId, deckId);

		while (results.next()) {
			Card card = mapRowToCard(results);
			cards.add(card);
		}
		return cards;
	}

	private Card mapRowToCard(SqlRowSet results) {
		Card card = new Card();
		card.setCardId(results.getInt("card_id"));
		card.setDeckId(results.getInt("deck_id"));
		card.setQuestion(results.getString("question"));
		card.setAnswer(results.getString("answer"));
		card.setTags(results.getString("tags"));
		card.setKeyword1(results.getString("keyword_1"));
		card.setKeyword2(results.getString("keyword_2"));
		card.setKeyword3(results.getString("keyword_3"));

		return card;
	}
}
