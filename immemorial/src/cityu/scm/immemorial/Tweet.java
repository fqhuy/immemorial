package cityu.scm.immemorial;

import com.googlecode.*;
import com.googlecode.jcsv.annotations.MapToColumn;

public class Tweet {
	// "tweet_id","in_reply_to_status_id","in_reply_to_user_id","retweeted_status_id","retweeted_status_user_id","timestamp","source","text","expanded_urls"
	/*
	 * @MapToColumn(column = 0) private String tweet_id;
	 * 
	 * @MapToColumn(column = 1) private String in_reply_to_status_id;
	 * 
	 * @MapToColumn(column = 2) private String in_reply_to_user_id;
	 * 
	 * @MapToColumn(column = 3) private String retweeted_status_id;
	 * 
	 * @MapToColumn(column = 4) private String retweeted_status_user_id;
	 * 
	 * @MapToColumn(column = 5) private String timestamp;
	 * 
	 * @MapToColumn(column = 6) private String source;
	 */
	public Tweet(String text){
		this.text = text;
	}

	@MapToColumn(column = 7)
	private String text;

	@MapToColumn(column = 8)
	private String expanded_urls;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return String.format("%s %s", text, expanded_urls);
		// return "";
	}

}
