/*package com.techelevator.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class SearchController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CardDAO cardDAO;
	
	@Autowired
	public SearchController(UserDAO userDAO, CardDAO cardDAO) {
		this.userDAO = userDAO;
		this.cardDAO = cardDAO;
	}
	@RequestMapping(path = "/search", method = RequestMethod.POST)
	public String conductSearch(HttpSession session, RedirectAttributes ra,
			@RequestParam(required = false) Card [] cards) {
		// Set<Flashcard> cardSet = new HashSet<>();
		if (cards != null) {
			List<Card> cardList = new ArrayList<>();
			for (int i = 0; i < cards.length; i++) {
				List<Card> getCardsByCardId(cardId);
				for (Card card : cards) {
					if (!cardList.isEmpty()) {
						boolean isDuplicate = false;
						for (int j = 0; j < cardList.size(); j++) {
							if (cardList.get(j).getCardId() == card.getCardId()) {
								isDuplicate = true;
							}
						}
						if (!isDuplicate) {
							cardList.add(card);
						}
					} else {
						cardList.add(card);
					}
				}
			}
			ra.addFlashAttribute("searchReturns", cardList);
		}
		return "redirect:/search";
	}
}
*/
