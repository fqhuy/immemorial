
<%@ page import="imserver.Tweet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tweet.label', default: 'Tweet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tweet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tweet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tweet">
			
				<g:if test="${tweetInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="tweet.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${tweetInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.expandedUrls}">
				<li class="fieldcontain">
					<span id="expandedUrls-label" class="property-label"><g:message code="tweet.expandedUrls.label" default="Expanded Urls" /></span>
					
						<span class="property-value" aria-labelledby="expandedUrls-label"><g:fieldValue bean="${tweetInstance}" field="expandedUrls"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.inReplyToStatusId}">
				<li class="fieldcontain">
					<span id="inReplyToStatusId-label" class="property-label"><g:message code="tweet.inReplyToStatusId.label" default="In Reply To Status Id" /></span>
					
						<span class="property-value" aria-labelledby="inReplyToStatusId-label"><g:fieldValue bean="${tweetInstance}" field="inReplyToStatusId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.inReplyToUserId}">
				<li class="fieldcontain">
					<span id="inReplyToUserId-label" class="property-label"><g:message code="tweet.inReplyToUserId.label" default="In Reply To User Id" /></span>
					
						<span class="property-value" aria-labelledby="inReplyToUserId-label"><g:fieldValue bean="${tweetInstance}" field="inReplyToUserId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="tweet.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${tweetInstance?.owner?.id}">${tweetInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.retweetedStatusId}">
				<li class="fieldcontain">
					<span id="retweetedStatusId-label" class="property-label"><g:message code="tweet.retweetedStatusId.label" default="Retweeted Status Id" /></span>
					
						<span class="property-value" aria-labelledby="retweetedStatusId-label"><g:fieldValue bean="${tweetInstance}" field="retweetedStatusId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.retweetedStatusUserId}">
				<li class="fieldcontain">
					<span id="retweetedStatusUserId-label" class="property-label"><g:message code="tweet.retweetedStatusUserId.label" default="Retweeted Status User Id" /></span>
					
						<span class="property-value" aria-labelledby="retweetedStatusUserId-label"><g:fieldValue bean="${tweetInstance}" field="retweetedStatusUserId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="tweet.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${tweetInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.timeStamp}">
				<li class="fieldcontain">
					<span id="timeStamp-label" class="property-label"><g:message code="tweet.timeStamp.label" default="Time Stamp" /></span>
					
						<span class="property-value" aria-labelledby="timeStamp-label"><g:formatDate date="${tweetInstance?.timeStamp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tweetInstance?.timestamp}">
				<li class="fieldcontain">
					<span id="timestamp-label" class="property-label"><g:message code="tweet.timestamp.label" default="Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="timestamp-label"><g:formatDate date="${tweetInstance?.timestamp}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tweetInstance?.id}" />
					<g:link class="edit" action="edit" id="${tweetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
