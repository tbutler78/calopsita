package br.com.caelum.calopsita.integration.stories.common;

import org.hibernate.Session;

import br.com.caelum.calopsita.model.Card;
import br.com.caelum.calopsita.model.Iteration;
import br.com.caelum.calopsita.model.PrioritizableCard;
import br.com.caelum.seleniumdsl.Browser;

public class CardContexts<T extends ProjectContexts<T>> {

	private final Card card;
	private final Session session;
	private final T parent;
	private final Browser browser;

	public CardContexts(Card card, Session session, Browser browser, T parent) {
		this.card = card;
		this.session = session;
		this.browser = browser;
		this.parent = parent;
	}

	public CardContexts<T> withASubcardNamed(String cardName) {
		Card card = new Card();
		card.setName(cardName);
		card.setProject(this.card.getProject());
		card.setParent(this.card);
		session.save(card);
		session.flush();
		return new CardContexts<T>(card, session, browser, parent);
	}

	public CardContexts<T> whichDescriptionIs(String cardDescription) {
		card.setDescription(cardDescription);
		session.flush();
		return this;
	}

	public CardContexts<T> withPriority(int priority) {
		PrioritizableCard pcard = new PrioritizableCard();
		pcard.setCard(card);
		pcard.setPriority(priority);
		session.save(pcard);
		session.flush();
		return this;
	}

	public void setIteration(Iteration iteration) {
		card.setIteration(iteration);
	}

	/**
	 * Go Up a level
	 * @return
	 */
	public T and() {
		return parent;
	}

	/**
	 * Go Up two levels
	 * @return
	 */
	public ProjectContexts<?> also() {
		return new ProjectContexts<T>(card.getProject(), session, browser);
	}

	public GivenContexts prioritizable() {
		// TODO Auto-generated method stub
		return null;
	}

}
