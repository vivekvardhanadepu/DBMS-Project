package com.cms;

public class Cart_order {
		private String order_id;
		private String item_id;
		private String restauarnt_id;
		private boolean half_or_full;
		private int quantity;
		
		public void setOrder_id() {
			int k = (int) Math.random();
			order_id = Double.toString(k);
		}
		
		public void setItem_id(String lid) {
			item_id = lid;
		}
		
		public void setRestaurant_id(String uname) {
			restauarnt_id = uname;
		}
		
		public void setHalf_or_full() {
			half_or_full = true;
		}
		
		public void setQuantity(int t) {
			quantity = t;
		}
		
		public String getOrder_id() {
			return order_id;
		}
		
		public String getItem_id() {
			return item_id;
		}
		
		public String getRestaurant_id() {
			return restauarnt_id;
		}
		
		public boolean getHalf_or_full() {
			return half_or_full;
		}
		
		public int getQuantity() {
			return quantity;
		}
		
		
		
}

