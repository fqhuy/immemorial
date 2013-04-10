package cityu.scm.immemorial;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Iterator;
import java.util.List;

import com.googlecode.jcsv.CSVStrategy;
import com.googlecode.jcsv.reader.CSVReader;
import com.googlecode.jcsv.reader.internal.CSVReaderBuilder;

import cmu.arktweetnlp.*;
import cmu.arktweetnlp.Tagger.TaggedToken;

public class Imme {
	private static List<Tweet> tweets;

	public static void readCSV(String filename) throws IOException {
		Reader csvFile = new InputStreamReader(
				Imme.class.getResourceAsStream(filename));

		//ValueProcessorProvider vpp = new ValueProcessorProvider();
		CSVReader<Tweet> personReader = new CSVReaderBuilder<Tweet>(csvFile)
				.strategy(new CSVStrategy(',', '\"', '#', true, true))
				.entryParser(new TweetParser()).build();
		tweets = personReader.readAll();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) throws IOException {
		if (args.length < 1) {
			System.out.println("Supply the model filename as first argument.");
		}
		String modelFilename = args[0];

		Tagger tagger = new Tagger();
		tagger.loadModel(modelFilename);

		readCSV("/tweets.csv");

		Iterator<Tweet> iterator = tweets.iterator();
		try {
			FileWriter outFile = new FileWriter("output.txt");
			PrintWriter out = new PrintWriter(outFile);
			while (iterator.hasNext()) {
				List<TaggedToken> taggedTokens = tagger.tokenizeAndTag(iterator.next().getText());
				for (TaggedToken token : taggedTokens) {
					out.printf("%s|\"%s\", ", token.tag, token.token);
				}
				out.println();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
