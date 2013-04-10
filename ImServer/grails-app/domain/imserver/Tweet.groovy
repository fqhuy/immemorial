package imserver

class Tweet {
	String text
	Date timeStamp
	int inReplyToStatusId
	int inReplyToUserId
	int retweetedStatusId	
	int retweetedStatusUserId	
	Date timestamp	
	String source	
	String ExpandedUrls
	
	static belongsTo = [owner : User]
	
    static constraints = {
		text(blank: false)
    }
}
