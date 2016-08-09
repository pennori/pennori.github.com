package study.algorithm.bst;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import junit.framework.Assert;

public class BinarySearchTreeTest {
	
	BinarySearchTree tree;
	
	@Before
	public void setUp(){
		tree = new BinarySearchTree();
		tree.insert(50);
		tree.insert(27);
		tree.insert(68);
		tree.insert(12);
		tree.insert(36);
		tree.insert(55);
		tree.insert(82);
		tree.insert(7);
		tree.insert(19);
		tree.insert(49);
		tree.insert(76);
		
		tree.display();
		
		tree.traverse(1);
		tree.traverse(2);
		tree.traverse(3);
	}

	@Test
	public void findTest() {
		int key = 7;
		Assert.assertEquals(7, tree.find(key).getData());
	}
	
	@Test
	public void insertTest() throws Exception {
		int key = 99;
		tree.insert(key);
		tree.display();
		Assert.assertEquals(99, tree.find(key).getData());
		
	}

}
