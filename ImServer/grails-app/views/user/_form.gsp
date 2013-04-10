<%@ page import="imserver.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		<g:message code="user.avatar.label" default="Avatar" />
		
	</label>
	<g:textField name="avatar" value="${userInstance?.avatar}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullName', 'error')} ">
	<label for="fullName">
		<g:message code="user.fullName.label" default="Full Name" />
		
	</label>
	<g:textField name="fullName" value="${userInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'shortBio', 'error')} ">
	<label for="shortBio">
		<g:message code="user.shortBio.label" default="Short Bio" />
		
	</label>
	<g:textField name="shortBio" value="${userInstance?.shortBio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'tweets', 'error')} ">
	<label for="tweets">
		<g:message code="user.tweets.label" default="Tweets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.tweets?}" var="t">
    <li><g:link controller="tweet" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tweet" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tweet.label', default: 'Tweet')])}</g:link>
</li>
</ul>

</div>

