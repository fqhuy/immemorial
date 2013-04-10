<%@ page import="imserver.Tweet" %>



<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="tweet.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="text" required="" value="${tweetInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'expandedUrls', 'error')} ">
	<label for="expandedUrls">
		<g:message code="tweet.expandedUrls.label" default="Expanded Urls" />
		
	</label>
	<g:textField name="expandedUrls" value="${tweetInstance?.expandedUrls}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'inReplyToStatusId', 'error')} required">
	<label for="inReplyToStatusId">
		<g:message code="tweet.inReplyToStatusId.label" default="In Reply To Status Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inReplyToStatusId" type="number" value="${tweetInstance.inReplyToStatusId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'inReplyToUserId', 'error')} required">
	<label for="inReplyToUserId">
		<g:message code="tweet.inReplyToUserId.label" default="In Reply To User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inReplyToUserId" type="number" value="${tweetInstance.inReplyToUserId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="tweet.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${imserver.User.list()}" optionKey="id" required="" value="${tweetInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'retweetedStatusId', 'error')} required">
	<label for="retweetedStatusId">
		<g:message code="tweet.retweetedStatusId.label" default="Retweeted Status Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="retweetedStatusId" type="number" value="${tweetInstance.retweetedStatusId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'retweetedStatusUserId', 'error')} required">
	<label for="retweetedStatusUserId">
		<g:message code="tweet.retweetedStatusUserId.label" default="Retweeted Status User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="retweetedStatusUserId" type="number" value="${tweetInstance.retweetedStatusUserId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="tweet.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${tweetInstance?.source}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'timeStamp', 'error')} required">
	<label for="timeStamp">
		<g:message code="tweet.timeStamp.label" default="Time Stamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="timeStamp" precision="day"  value="${tweetInstance?.timeStamp}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tweetInstance, field: 'timestamp', 'error')} required">
	<label for="timestamp">
		<g:message code="tweet.timestamp.label" default="Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="timestamp" precision="day"  value="${tweetInstance?.timestamp}"  />
</div>

