package xyz.baal.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.FastByIDMap;
import org.apache.mahout.cf.taste.impl.common.FastIDSet;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.GenericBooleanPrefDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericBooleanPrefUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import xyz.baal.dao.ApplaudDao;
import xyz.baal.dao.BookDao;
import xyz.baal.orm.Applaud;
import xyz.baal.orm.Book;

/**
 * 图书推荐工具类
 * 
 * @author
 * 
 */
public class BookRecommender {

	public static List<Book> getBooks(int usid) {
		List<Book> listbook = new ArrayList<Book>();
		// 如果用户没有点赞过任何书籍 推荐点赞最高的六本书
		if (ApplaudDao.getApplaudinfoByUsid(usid).isEmpty()) {
			return ApplaudDao.getBooksByAP();
		} else {
			try {
				FastByIDMap<FastIDSet> preferences = new FastByIDMap<FastIDSet>();
				//获取所有点赞信息
				List<Applaud> applist = ApplaudDao.getAllApplaudinfo();
				//创建一个Map<usid,Set<bookid>>形式的Map用于存储点赞信息
				Map<Integer, Set<Integer>> preMap = new HashMap<Integer, Set<Integer>>();
				//将applist中的点赞信息转存到preMap中
				for (Applaud applaud : applist) {
					// user_key exist
					if (preMap.containsKey(applaud.getUsid())) {
						preMap.get(applaud.getUsid())
							.add( applaud.getBookid());
					} else {
						Set<Integer> temp = new HashSet<Integer>();
						temp.add( applaud.getBookid());
						preMap.put(applaud.getUsid(), temp);
					}
				}
				//根据preMap中的信息构建推荐数据模型
				for (int uid : preMap.keySet()) {
					FastIDSet set = new FastIDSet();
					for (int bookid : preMap.get(uid)) {
						set.add(bookid);
					}
					if (!set.isEmpty()) {
						preferences.put(uid, set);
					}
				}
				DataModel model = new GenericBooleanPrefDataModel(preferences);
				//相似度分析
				UserSimilarity similarity = new LogLikelihoodSimilarity(model);
				//
				UserNeighborhood neighborhood = new NearestNUserNeighborhood(
						10, similarity, model);
				//构建推荐引擎
				Recommender recommender = new GenericBooleanPrefUserBasedRecommender(
						model, neighborhood, similarity);
				//为用户推荐6本书籍
				List<RecommendedItem> list = recommender.recommend(usid, 6);
				for (RecommendedItem recommendedItem : list) {
					listbook.add(BookDao.getBookinfoByBookid((int)recommendedItem.getItemID()));
				}
				int lackbook = 6 - list.size();
				if(lackbook > 0){
					List<Book> teBooks = ApplaudDao.getBooksByAP();
					for(int i=0;i<lackbook;i++){
						listbook.add(teBooks.get(i));
					}
				}
			} catch (Exception e) {
			}
		}
		return listbook;
	}
}
