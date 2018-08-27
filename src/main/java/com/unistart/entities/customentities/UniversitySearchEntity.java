package com.unistart.entities.customentities;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

public class UniversitySearchEntity implements Serializable {

    private String name = "";
    private List<Integer> majorIds = new LinkedList<Integer>();
    private List<Integer> locationIds = new LinkedList<Integer>();
    private int page = 0;
    private int limit = 0;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Integer> getMajorIds() {
        return majorIds;
    }

    public void setMajorIds(List<Integer> majorIds) {
        this.majorIds = majorIds;
    }

    public List<Integer> getLocationIds() {
        return locationIds;
    }

    public void setLocationIds(List<Integer> locationIds) {
        this.locationIds = locationIds;
    }

}
