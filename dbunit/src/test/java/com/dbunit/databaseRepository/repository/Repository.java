package com.dbunit.databaseRepository.repository;

import vo.Seller;


public interface Repository {
    public Seller findById(String id);

    public void add(Seller seller);

    public void update(Seller seller);

    public void remove(Seller seller);
}
