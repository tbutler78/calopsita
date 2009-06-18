<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title><fmt:message key="project"/></title>
	<script type="text/javascript" src="<c:url value="/javascript/jquery/jquery.validate.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value="/css/impromptu.css"/>" />
	<script type="text/javascript" src="<c:url value="/javascript/jquery/jquery-impromptu.2.5.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/javascript/jquery/jquery.form.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/javascript/project-cards.js"/>"></script>
</head>

<body>

<div id="card">
    <p><fmt:message key="project.name"/>: ${card.name}</p>
    <p><fmt:message key="project.description"/>: ${card.description}</p>
</div>

<form id="editCard" name="editCard" action="<c:url value="/projects/${card.project.id}/cards/${card.id}/" />" method="post">
	<p>
		<label><fmt:message key="card.name"/></label>
		<em>*</em><input type="text" name="card.name" value="${card.name }"/>
	</p>
	<p>
		<label><fmt:message key="card.description"/></label>
		<em>*</em><textarea name="card.description" >${card.description }</textarea>
	</p>
	<fieldset>
  		<legend><fmt:message key="gadgets" /></legend>
  		<c:forEach items="${gadgets}" var="gadget" varStatus="s">
	  		<input type="checkbox" name="gadgets[${s.index }]" value="${gadget }" id="${gadget }" ${fn:contains(cardGadgets, gadget)? 'checked="checked"':'' }/><fmt:message key="${gadget}" />
  		</c:forEach>
	</fieldset>
	<p>
		<input class="buttons" type="submit" value="<fmt:message key="update"/>"/>
		<input class="buttons" type="reset" value="<fmt:message key="cancel"/>" onclick="window.location = $('#back').attr('href')"/>
	</p>
</form>

<div id="cards">
	<c:if test="${not empty cards}">
		<%@include file="update.jsp" %>
	</c:if>
</div>

<a href="javascript:toggle('cardForm'); document.addCard.reset();">Add Subcard</a><br/>

<form id="cardForm" class="hidden" name="addCard" action="<c:url value="/projects/${card.project.id }/cards/${card.id }/subcards/"/>" method="post">
	<p>
		<label><fmt:message key="card.name"/></label>
		<em>*</em><input type="text" name="card.name"/>
	</p>
	<p>
		<label><fmt:message key="card.description"/></label>
		<em>*</em><textarea name="card.description"></textarea>
	</p>
	<fieldset title="<fmt:message key="gadgets" />">
  		<legend><fmt:message key="gadgets" /></legend>
  		<c:forEach items="${gadgets}" var="gadget" varStatus="s">
	  		<input type="checkbox" name="gadgets[${s.index }]" value="${gadget }" id="${gadget }" /><fmt:message key="${gadget}" />
  		</c:forEach>
  	</fieldset>
    <p>
    	<input class="buttons" type="submit" value="<fmt:message key="add"/>"/>
  		<input class="buttons" type="reset" value="<fmt:message key="cancel"/>" onclick="toggle('cardForm');"/>
  	</p>
</form>

<a id="back" href="<c:url value="/projects/${card.project.id }/cards/"/>"><fmt:message key="back"/></a>

</body>
</html>