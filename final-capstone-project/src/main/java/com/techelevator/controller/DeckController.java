package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Card;
import com.techelevator.model.CardDAO;
import com.techelevator.model.Deck;
import com.techelevator.model.DeckDAO;
import com.techelevator.model.User;
@Controller
@SessionAttributes({ "currentUser", "deck", "card" })
public class DeckController {

	@Autowired
	private DeckDAO deckDAO;
	@Autowired
	private CardDAO cardDAO;
	
	@RequestMapping(path="/deckCreate", method=RequestMethod.GET)
	public String getCreateDeckPage() {
		
		return "deckCreate";
		
	}
	
	@RequestMapping(path="/deckCreate", method=RequestMethod.POST)
	public String deckInputPagePost(Deck deck,  RedirectAttributes attr) {
		deckDAO.saveDeck(deck);
		
		attr.addFlashAttribute("deck", deck);


		return "redirect:/myDecks";
}
	@RequestMapping(path="/editNewDeck", method=RequestMethod.GET)
	public String getEditNewDeckPage(ModelMap map) {
		
		Deck deck = new Deck();
		deck = deckDAO.getNewestDeck();
		
		map.addAttribute("deck", deck);
		
		return "editNewDeck";
	}
	
	
	@RequestMapping(path="/editNewDeck", method=RequestMethod.POST)
	public String deckInputPagePost(Card card, ModelMap map) {
		
		Deck deck = new Deck();
		deck = deckDAO.getNewestDeck();
		
		Card cardWithId  = new Card();
		
		card.setDeckId(deck.getDeckId());
		
		cardDAO.createCard(card);
		
	

		return "redirect:/myDecks";
}
	@RequestMapping(path="/editDeck", method=RequestMethod.GET)
	public String getEditDeckPage(ModelMap map, HttpServletRequest request,RedirectAttributes attr) {
		
		String stringDeckId = request.getParameter("deckId");
		
		Integer deckId = Integer.parseInt(stringDeckId);
		
		Deck deck = new Deck();
		deck = deckDAO.getDeckById(deckId);
		
		map.addAttribute("deck", deck);
		
		List<Card> cards = cardDAO.getCardsByDeckId(deckId);
		
		map.addAttribute("cards",cards);
	
		attr.addFlashAttribute("deckId", deck);
		
		return "editDeck";
	}
	
	
	@RequestMapping(path="/editDeck", method=RequestMethod.POST)
	public String cardInputPagePost(@ModelAttribute("deckid") Deck deck, Card card, ModelMap map,RedirectAttributes attr) {
				
		Integer deckId = deck.getDeckId();
		
		deck = deckDAO.getDeckById(deckId);

		card.setDeckId((deckId));
		cardDAO.createCard(card);
		
		return "redirect:/editDeck?deckId="+deck.getDeckId();
}
	
	@RequestMapping(path="/myDecks", method=RequestMethod.GET)
	public String getMyDeckPage(ModelMap map) {

		List<Card> cardList = cardDAO.getCardsByDeckId(deckDAO.getLastDeckId()); //8 for results
		map.addAttribute("cards", cardList);
		List<Deck> deckList = deckDAO.getDecksByUserId(1);
		map.addAttribute("decks", deckList);
		
		
		return "myDecks";
	}
	@RequestMapping(path="/studySession", method=RequestMethod.GET)
	public String getStudySessionPage(ModelMap map, HttpServletRequest request,RedirectAttributes attr) {
		
		String stringDeckId = request.getParameter("deckId");
		
		Integer deckId = 		Integer.parseInt(stringDeckId);
		
		Deck deck = new Deck();
		deck = deckDAO.getDeckById(deckId);
		
		map.addAttribute("deck", deck);
		
		List<Card> cards = cardDAO.getCardsByDeckId(deckId);
		
		map.addAttribute("cards",cards);
	
		attr.addFlashAttribute("deckId", deck);
		return "studySession";

		
	}
	@RequestMapping(path="completedSession", method=RequestMethod.GET)
		public String completedSession(ModelMap map) {
			
			return "completedSession";
		
	}

}