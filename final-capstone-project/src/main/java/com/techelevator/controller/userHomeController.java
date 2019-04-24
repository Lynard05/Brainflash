package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.techelevator.model.UserDAO;



@Controller
@SessionAttributes({ "currentUser", "deck", "card" })
public class userHomeController {
	
		@Autowired
		private CardDAO cardDAO;
		@Autowired
		private DeckDAO deckDAO;
		@Autowired
		private UserDAO userDAO;
		
		@Autowired
		private userHomeController(CardDAO cardDAO, DeckDAO deckDAO, UserDAO userDAO) {
			this.cardDAO = cardDAO;
			this.deckDAO = deckDAO;
			this.userDAO = userDAO;
		}
		//mapping to the default home page. in this case, it happens to be the index page.
			@RequestMapping(value="/userHome",method=RequestMethod.GET)
			public String displayIndex(HttpServletRequest request) {
				request.getAttribute("userHome");
				return "userHome";
			}
			@RequestMapping(path = "/home/", method = RequestMethod.GET)
			public String displayProfile(HttpSession session, ModelMap map) {

				if (session.getAttribute("currentUser") == null) {
					return "redirect:/userHome";
				} else {
					User user = (User) session.getAttribute("currentUser");

					String userName = user.getUserName();
					int userId = user.getUserId();
					List<Deck> decks = deckDAO.getDecksByUserName(userName);
					List<Card> cards = deckDAO.getCardsByUserId(userId);

					session.setAttribute("decks", decks);
					session.setAttribute("cards", cards);

					if (cards.size() == 0) {
						map.addAttribute("welcomeHeader", "Welcome!");
						map.addAttribute("message1",
								"Welcome to BrainFlash, create flashcards and retrain your brain.");
						map.addAttribute("message2",
								"Lets Get started! Create a deck and create cards under each deck.");
					} else {
						map.addAttribute("welcomeHeader", "Welcome once again!");
						map.addAttribute("welcomeHeader", "Welcome!");
						map.addAttribute("message2",
								"Select from the deck and let's begin study.");
					}

					if (decks.size() < 1) {
						decks.add(deckDAO.saveDeck(user.getUserId(), "First Deck",
								"create cards from the first deck!"));

					}

					session.setAttribute("quizIsActive", false);
					session.setAttribute("decks", deckDAO.getAllDecks());
					return "userHome";
				}
			}

			@RequestMapping(path = "/home/newCard", method = RequestMethod.GET)
			public String createCard(HttpSession session) {
				session.setAttribute("requestType", "new");
				return "modifyCard";
			}
			
			@RequestMapping(path = "/home/deleteCard/{cardId}", method = RequestMethod.POST)
			public String deleteFlashcard(HttpSession session, @PathVariable("cardId") int cardId) {
				deckDAO.deleteCard(cardId);
				return "redirect:/userHome";
			}

			@RequestMapping(path = "/home/{cardId}/editCard", method = RequestMethod.GET)
			public String editDeck(@PathVariable("cardId") int cardId, HttpSession session, ModelMap map) {
				Card card = cardDAO.getCardByCardId(cardId);
				map.addAttribute("card", card);
				session.setAttribute("requestType", "edit");
				map.addAttribute("allDecks", deckDAO.getAllDecks());
				return "modifyCard";
			}

			@RequestMapping(path = "/home/{deckName}/editDeck", method = RequestMethod.GET)
			public String editDeck(@PathVariable("deckName") String deckName, HttpSession session, ModelMap map) {
				session.setAttribute("requestType", "edit");
				session.setAttribute("name", deckName);
				Deck deck = null;
				@SuppressWarnings("unchecked")
				List<Deck> decks = (List<Deck>) session.getAttribute("decks");
				for (Deck item : decks) {
					if (item.getName().equals(deckName)) {
						deck = item;
					}
				}
				// map.addAttribute("deck", deck);
				session.setAttribute("deck", deckDAO.getAllDecks());
				return "modifyDeck";
			}

			@RequestMapping(path = "/home/cardDetails/{cardId}", method = RequestMethod.GET)
			public String cardDetails(@PathVariable("cardId") int cardId, HttpSession session, ModelMap map) {

				Card card = cardDAO.getCardByCardId(cardId);
				map.addAttribute("card", card);

				return "cardDetails";
			}
		
		
		
		
	}
