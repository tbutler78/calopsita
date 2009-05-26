<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title><fmt:message key="project"/></title>
	<script type="text/javascript" src="<c:url value="/javascript/project-show.js"/>"></script>
	<link rel="stylesheet" type="text/css" media="all" href="<c:url value="/css/project.css"/>" />
</head>

<body>

<div id="story">
    <p><fmt:message key="project.name"/>: ${story.name}</p>
    <p><fmt:message key="project.description"/>: ${story.description}</p>
</div>

<form name="editStory" action="<c:url value='/story/update/' />" method="post">
	<input type="hidden" name="story.id" value="${story.id }"/>
	<input type="hidden" name="project.id" value="${story.project.id }"/>
	<p>
		<label><fmt:message key="story.name"/></label>
		<em>*</em><input type="text" name="story.name" value="${story.name }"/>
	</p>
	<p>
		<label><fmt:message key="story.description"/></label>
		<em>*</em><textarea name="story.description" >${story.description }</textarea>
	</p>
	<p>
		<input class="buttons" type="submit" value="<fmt:message key="update"/>"/>
		<input class="buttons" type="reset" value="<fmt:message key="cancel"/>" onclick="window.location = $('#back').attr('href')"/>
	</p>
</form>

<div id="stories">
	<c:if test="${not empty stories}">
		<%@include file="../story/update.ok.jsp" %>
	</c:if>
</div>

<a href="javascript:toggle('storyForm'); document.addStory.reset();">Add Substory</a><br/>

<form id="storyForm" class="hidden" name="addStory" action="<c:url value="/substory/save/"/>" method="post">
	<input type="hidden" name="story.project.id" value="${story.project.id }" />
	<input type="hidden" name="story.parent.id" value="${story.id }" />
	<p>
		<label><fmt:message key="story.name"/></label>
		<em>*</em><input type="text" name="story.name"/>
	</p>
	<p>
		<label><fmt:message key="story.description"/></label>
		<em>*</em><textarea name="story.description"></textarea>
	</p>
    <p>
    	<input class="buttons" type="submit" value="<fmt:message key="add"/>"/>
  		<input class="buttons" type="reset" value="<fmt:message key="cancel"/>" onclick="toggle('storyForm');"/>
  	</p>
</form>

<a id="back" href="<c:url value="/project/${story.project.id }/cards/"/>"><fmt:message key="back"/></a>

</body>
</html>