package com.teamproject.phosk.branch.menu.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NowPage {
	private int nowCate;

	public NowPage() {
		this(0);
	}

	public NowPage(int nowCate) {
		this.nowCate = nowCate;
	}
	
}
