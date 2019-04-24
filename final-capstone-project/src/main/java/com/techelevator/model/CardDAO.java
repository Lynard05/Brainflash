package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public interface CardDAO {

	public Card getCardCountByDeckId(Integer deckId);
	public List<Card> getCardsByDeckId(Integer deckId);
	public void createCard(Card card);
	public Card getCardByCardId(Integer cardId);
}
