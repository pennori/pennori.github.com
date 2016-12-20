package dataset;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class DatasetTest {

	private static final String DATASET_PATH = "src/test/resources/dataset/data_csv";
	private static final int SELECT_ITEM_COUNT = 3;
	private static final int SELECT_ID = 2;
	private UserBasedRecommender recommender;

	@Before
	public void setUp() throws Exception {
		DataModel model = new FileDataModel(new File(DATASET_PATH));
		UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);
		this.recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() throws IOException, TasteException {
		List<RecommendedItem> recommendations = this.recommender.recommend(SELECT_ID, SELECT_ITEM_COUNT);

		Assert.assertNotEquals(0, recommendations.size());

		for (RecommendedItem recommendation : recommendations) {
			System.out.println(recommendation);
		}
	}

}
