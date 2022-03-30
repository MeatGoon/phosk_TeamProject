package com.teamproject.phosk.branch.menu.vo;

import lombok.Data;

@Data
public class NowPage {
	private int categoryNum;

    public NowPage() {
        this(0);
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public NowPage(int categoryNum) {
        this.categoryNum = categoryNum;
    }

}
