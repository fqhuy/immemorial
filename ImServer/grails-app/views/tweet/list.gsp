
<%@ page import="imserver.Tweet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tweet.label', default: 'Tweet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tweet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tweet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="text" title="${message(code: 'tweet.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="expandedUrls" title="${message(code: 'tweet.expandedUrls.label', default: 'Expanded Urls')}" />
					
						<g:sortableColumn property="inReplyToStatusId" title="${message(code: 'tweet.inReplyToStatusId.label', default: 'In Reply To Status Id')}" />
					
						<g:sortableColumn property="inReplyToUserId" title="${message(code: 'tweet.inReplyToUserId.label', default: 'In Reply To User Id')}" />
					
						<th><g:message code="tweet.owner.label" default="Owner" /></th>
					
						<g:sortableColumn property="retweetedStatusId" title="${message(code: 'tweet.retweetedStatusId.label', default: 'Retweeted Status Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tweetInstanceList}" status="i" var="tweetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tweetInstance.id}">${fieldValue(bean: tweetInstance, field: "text")}</g:link></td>
					
						<td>${fieldValue(bean: tweetInstance, field: "expandedUrls")}</td>
					
						<td>${fieldValue(bean: tweetInstance, field: "inReplyToStatusId")}</td>
					
						<td>${fieldValue(bean: tweetInstance, field: "inReplyToUserId")}</td>
					
						<td>${fieldValue(bean: tweetInstance, field: "owner")}</td>
					
						<td>${fieldValue(bean: tweetInstance, field: "retweetedStatusId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tweetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
