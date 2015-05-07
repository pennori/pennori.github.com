package com.dbunit.databaseRepository;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.net.URL;

import org.dbunit.IDatabaseTester;
import org.dbunit.JdbcDatabaseTester;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.dbunit.databaseRepository.entity.Seller;
import com.dbunit.databaseRepository.repository.DatabaseRepository;
import com.dbunit.databaseRepository.repository.Repository;

public class DatabaseRepositoryTest {

    private final String driver = "org.apache.derby.jdbc.EmbeddedDriver";
    private final String protocol = "jdbc:derby:";
    private final String dbName = "shopdb";

    private IDatabaseTester databaseTester;

    @Before
    public void setUp() throws Exception {
        databaseTester = new JdbcDatabaseTester(driver, protocol + dbName);

        try {
            String datasetClasspath = "/com/dbunit/databaseRepository/dataset/seller.xml";
            URL url = this.getClass().getResource(datasetClasspath);

            IDataSet dataSet = new FlatXmlDataSetBuilder().build(new File(url.toURI()));
            DatabaseOperation.CLEAN_INSERT.execute(databaseTester.getConnection(), dataSet);
        } catch (Exception e) {
            e.printStackTrace();
            databaseTester.getConnection().close();
        }
    }

    @After
    public void tearDown() throws Exception {}

    @Test
    public void testFindById() throws Exception {
        Seller expectedSellser = Seller.newInstance("horichoi", "최승호", "megaseller@hatmail.com");
        Repository repository = new DatabaseRepository();
        Seller actualSeller = repository.findById("horichoi");

        assertEquals(expectedSellser.getId(), actualSeller.getId());
        assertEquals(expectedSellser.getName(), actualSeller.getName());
        assertEquals(expectedSellser.getEmail(), actualSeller.getEmail());
    }

}
