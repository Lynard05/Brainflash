package com.techelevator.model;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCDeckDAO implements DeckDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCDeckDAO (DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveDeck(Deck deck) {
		Integer deckId = deck.getDeckId();
		Integer userId = deck.getUserId();
		String name = deck.getName();
		String description = deck.getDescription();
		String sqlInsertDeck = "INSERT INTO deck (user_id, deckname , deckdescription) VALUES (?, ?, ?)";
		jdbcTemplate.update(sqlInsertDeck, userId, name, description);
	}

	@Override
	public Integer getDeckIdByName(String deckName) {
		Deck theDeck = null;
		String sqlSearchtDeck = "SELECT user_id, deck_id, deckname, deckdescription FROM deck where deckname = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchtDeck, deckName);
		if(results.next()) {
			 theDeck = mapRowToDeck(results);
			}
			return theDeck.getDeckId();	
		
	}
	@Override
	public Deck getDeckById(Integer deckId) {
		Deck theDeck = null;
		String sqlSearchDeck = "SELECT user_id, deck_id, deckname, deckdescription FROM deck where deck_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchDeck, deckId);
		if(results.next()) {
			 theDeck = mapRowToDeck(results);
			}
			return theDeck;
	}
	
	@Override
	public List<Deck> getAllDecks() {
		ArrayList<Deck> decks = new ArrayList<>();
		String sqlGetAllDecks = "SELECT user_id, deck_id, deckname, deckdescription FROM deck";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllDecks);
		while (results.next()) {
			Deck theDeck = mapRowToDeck(results);
			decks.add(theDeck);
		}
		return decks;
	}
	@Override
	public Integer getLastDeckId() {
		ArrayList<Deck> decks = new ArrayList<>(getAllDecks());
		Integer finalDeckId = decks.get(decks.size() - 1).getDeckId();
		return finalDeckId;
	}
	
	@Override
	public Deck getNewestDeck() {
		ArrayList<Deck> decks = new ArrayList<>(getAllDecks());
		Deck deck = decks.get(decks.size() - 1);
		return deck;
	}

	private Deck mapRowToDeck(SqlRowSet results) {
		Deck deck = new Deck();
		deck.setUserId(results.getInt("user_id"));
		deck.setDeckId(results.getInt("deck_id"));
		deck.setName(results.getString("deckname"));
		deck.setDescription(results.getString("deckdescription"));
		return deck;
	}

	public List<Deck> getDecksByUserId(Integer userId) {
		ArrayList<Deck> decks = new ArrayList<>();
		String sqlGetDecksByUserId = "SELECT user_id, deck_id, deckname, deckdescription FROM deck WHERE user_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetDecksByUserId, userId);
		while (results.next()) {
			Deck theDeck = mapRowToDeck(results);
			decks.add(theDeck);
		}
		return decks;
	}
	@Override
	public void deleteCard(int cardId) {
		String sqlDeleteFlashcard = "DELETE FROM deck " + 
				"WHERE card_id = ?; " + 
				"DELETE FROM note_card " + 
				"WHERE card_id = ?; ";
		jdbcTemplate.update(sqlDeleteFlashcard, cardId);
		
	}

	@Override
	public List<Deck> getDecksByUserName(String userName) {
		ArrayList<Deck> decks = new ArrayList<>();
		String sqlGetDecksByUserId = "SELECT user_id, deck_id, deckname, deckdescription FROM deck WHERE user_name = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetDecksByUserId, userName);
		while (results.next()) {
			Deck theDeck = mapRowToDeck(results);
			decks.add(theDeck);
		}
		return decks;
	}

	@Override
	public Deck saveDeck(Integer userId, String name, String description) {
		jdbcTemplate.update("INSERT INTO deck (user_id, name, description) VALUES (?, ?, ?);", 
				userId, name, description);
		SqlRowSet result = jdbcTemplate.queryForRowSet("SELECT currval('seq_deck_id');");
		result.next();
		return getDeckById(result.getInt("currval"));
	}
	@Override
	public List<Card> getCardsByUserId(Integer userId){
		List<Card> allCards = new ArrayList<Card>();
		String sqlGetFlashcardById = "SELECT card_id FROM note_card" + 
		"JOIN deck ON deck.deck_id = note_card.deck_id" +
		"JOIN app_user ON app_user.id = deck.user_id WHERE id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetFlashcardById, userId);
		while(results.next()) {
			allCards.add(mapRowToCard(results));
		
		}
		return allCards;
	}
	
	private Card mapRowToCard(SqlRowSet results) {
		Card card = new Card();
		User user = new User();
		user.setUserId(results.getInt("user_id"));
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

	@Override
	public List<Integer> getAllDeckIdsForCard(int cardId) {
		String sqlGetDeckIds = "SELECT deck_id FROM note_card WHERE card_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetDeckIds, cardId);
		List<Integer> deckIds = new ArrayList<>();
		while(results.next()) {
			deckIds.add(results.getInt("deck_id"));
		}
		return deckIds;
	}

}