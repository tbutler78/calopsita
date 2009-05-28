<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title><fmt:message key="project.priorization"/></title>
	<script type="text/javascript" src="<c:url value="/javascript/jquery/selectableDraggable.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/javascript/card-prioritization.js"/>"></script>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value="/css/iteration.css"/>" />
	<script type="text/javascript">
		initialize('<fmt:message key="infinityPriority"/>');
	</script>
</head>

<body>

	<div id="project">
    	<p><fmt:message key="project.name"/>: ${project.name}</p>
    	<p><fmt:message key="project.description"/>: ${project.description}</p>
	</div>
	
	<form id="prioritizationForm" action="<c:url value="/prioritization/prioritize/"/>" method="post">
		<input type="submit" value="Save Priorization" />
		<input type="hidden" name="project.id" value="${project.id }" />

		<div id="board">
			<c:forEach items="${cards}" varStatus="s" var="currentPriority" >
				<h2 id="title_${s.index }" class="title"><fmt:message key="priority"/> ${s.index }</h2>
				<ul id="level_${s.index }" class="board" title="Priority ${s.index }" priority="${s.index }">
					<c:forEach items="${currentPriority}" var="card">
						<li class="card" name="${card.name }" title="Double click for description" 
							ondblclick="showDialog('${card.name}', 'description_${card.id }')">
							<p>${card.name }</p>
							<pre id="description_${card.id }" class="hidden">${fn:escapeXml(card.description)}</pre>
							<input type="hidden" name="cards[#].id" value="${card.id}" />
							<input class="priority" type="hidden" name="cards[#].priority" value="${currentPriority}" />
						</li>
					</c:forEach>
				</ul>
			</c:forEach>
		</div>

		<h2 class="title"><fmt:message key="newPriorityLevel"/></h2>
		<ul id="lowerPriority" class="board" title="New Priority Level"></ul>
	</form>

	<a href="<c:url value="/project/${project.id }/show/"/>"><fmt:message key="back"/></a>

</body>
</html>