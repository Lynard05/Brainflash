package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.util.logging.LoggerFactory;
//import org.hibernate.validator.internal.util.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;
import com.techelevator.model.CardDAO;
import com.techelevator.model.DeckDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes({ "currentUser", "deck", "card" })
public class HomeController {
	@Autowired
	private CardDAO cardDAO;
	@Autowired
	private DeckDAO deckDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HomeController(CardDAO cardDAO, DeckDAO deckDAO, UserDAO userDAO) {
		this.cardDAO = cardDAO;
		this.deckDAO = deckDAO;
		this.userDAO = userDAO;
	}
	//mapping to the default home page. in this case, it happens to be the index page.
		@RequestMapping(path={"/", "/index"},method=RequestMethod.GET)
		public String displayIndex(HttpServletRequest request) {
			request.getAttribute("index");
			return "index";
		}
		
	

}