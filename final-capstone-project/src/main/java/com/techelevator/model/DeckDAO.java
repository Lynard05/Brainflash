package com.techelevator.model;

import java.util.List;

public interface DeckDAO {
	public void saveDeck(Deck deck);
	public Integer getDeckIdByName(String deckName);
	public Integer getLastDeckId(); 
	public void deleteCard(int cardId);
	public List<Deck> getAllDecks();
	public List<Deck> getDecksByUserId(Integer userId);
	public Deck getNewestDeck();
	public Deck getDeckById(Integer deckId);
	public List<Deck> getDecksByUserName(String userName);
	public Deck saveDeck(Integer userId, String string, String string2);
	public List<Card> getCardsByUserId(Integer userId);
	public List<Integer> getAllDeckIdsForCard(int cardId);
}