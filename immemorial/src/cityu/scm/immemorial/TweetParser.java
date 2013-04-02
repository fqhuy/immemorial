package cityu.scm.immemorial;

import com.googlecode.jcsv.reader.CSVEntryParser;

public class TweetParser implements CSVEntryParser<Tweet> {

	@Override
	public Tweet parseEntry(String... data) {
		//System.out.print(data[0]);
		String text = data[7];
		// String expanded_urls = data[8];

		return new Tweet(text);
	}

}
