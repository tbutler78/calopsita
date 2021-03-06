package br.com.caelum.calopsita.integration.stories;

import org.junit.Test;

import br.com.caelum.calopsita.integration.stories.common.DefaultStory;

/**
 * <b>In order to</b> know what i need to do <br>
 * <b>As a</b> project developer <br>
 * <b>I want</b> be able to order cards by priority <br>
 * @author caueguerra
 *
 */
public class CardsMustBeOrderedByPriorityStory extends DefaultStory {
	@Test
	public void cardsMustBeOrderedOutOfIterations() throws Exception {
		given.thereIsAnUserNamed("caue").and()
			.thereIsAProjectNamed("htmlunit")
				.ownedBy("caue")
				.withACardNamed("step1")
					.whichDescriptionIs("this is just step 1")
					.withPriority(3).and()
				.withACardNamed("step2")
					.whichDescriptionIs("step 2 duh")
					.withPriority(1).and()
			.iAmLoggedInAs("caue");
		when.iOpenProjectPageOf("htmlunit").and()
		    .iOpenCardsPage();
		then.theCard("step1")
				.appearsOnCardsListAtPosition(2)
			.theCard("step2")
				.appearsOnCardsListAtPosition(1);
	}

	@Test
	public void cardsMustBeOrderedInIterations() throws Exception {
		given.thereIsAnUserNamed("caue").and()
			.thereIsAProjectNamed("htmlunit")
				.ownedBy("caue")
				.withAnIterationWhichGoalIs("make it work")
					.withACardNamed("step1")
						.whichDescriptionIs("this is just step 1")
						.planningCard()
						.withPriority(3).and()
					.withACardNamed("step2")
						.whichDescriptionIs("step 2 duh")
						.planningCard()
						.withPriority(1).also()
				.withACardNamed("step3")
					.whichDescriptionIs("step 3 duh")
					.planningCard()
					.withPriority(5).and()
				.withACardNamed("step4")
					.whichDescriptionIs("step 4 duh")
					.planningCard()
					.withPriority(2).and()
			.iAmLoggedInAs("caue");
		when.iOpenProjectPageOf("htmlunit").and()
		    .iOpenIterationsPage().and()
			.iOpenThePageOfIterationWithGoal("make it work");
		then.theCard("step1").appearsOnList("iteration_cards").atPosition(2)
			.theCard("step2").appearsOnList("iteration_cards").atPosition(1)
			.theCard("step3").appearsOnList("backlog").atPosition(2)
			.theCard("step4").appearsOnList("backlog").atPosition(1);

	}
}
