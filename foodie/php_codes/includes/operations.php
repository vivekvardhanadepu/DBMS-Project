<?php

class DbOperation
{
    private $con;

    function __construct()
    {
        require_once dirname(__FILE__) . '/DbConnect.php';
        $db = new DbConnect();
        $this->con = $db->connect();
    }

	/*
	* The add_item operation
	* When this method is called the item with the given id is added to the cart
	*/
	function add_item($item_id, $order_id, $restaurant_id, $cart_id){
		$stmt = $this->con->prepare("INSERT INTO cart_order(order_id, item_id, restaurant_id, quantity,".
		                                                "half_or_full, order_status) VALUES (?, ?, ?,'1','1','-1')");
		$stmt->bind_param("sss", $order_id, $item_id, $restaurant_id);
		if($stmt->execute()){
		    $stmt1 = $this->con->prepare("INSERT INTO cart_has(cart_id, order_id) VALUES (?, ?)");
		    $stmt1->bind_param("ss", $cart_id, $order_id);
		    if($stmt1->execute())
			    return true;
		}
		return false;
	}


	/*
	* The search operation
	* When this method is called restaurants are searched for the given restaurant_name
	*/
	function restaurant_search($restaurant_name){
		$stmt = $this->con->prepare("SELECT restaurant_name FROM restaurant where restaurant_name like %?%")
		$stmt->bind_param("s", $restaurant_name);
        $stmt->execute();
        $stmt->bind_result($name);
        $restaurants = array();

        while($stmt->fetch()){
            $restaurant = array();
            $restaurant['restaurant_name'] = $name;

            array_push($restaurants,$restaurant);
        }

        return $restaurants;
	}
}

	/*
	* Listing restaurants
	* When this method is called restaurants are fetched
	*/
	function get_restaurants(){
		$stmt = $this->con->prepare("SELECT restaurant_id,restaurant_name,rating,avg_price,delivery_time,cuisine,status FROM restaurant")
        $stmt->execute();
        $stmt->bind_result($restaurant_id,$restaurant_name,$rating,$avg_price,$delivery_time,$cuisine,$status);
        $restaurants = array();

        while($stmt->fetch()){
            $restaurant = array();
            $restaurant['restaurant_name'] = $restaurant_name;
            $restaurant['restaurant_id'] = $restaurant_id;
            $restaurant['rating'] = $rating;
            $restaurant['avg_price'] = $avg_price;
            $restaurant['delivery_time'] = $delivery_time;
            $restaurant['cuisine'] = $cuisine;
            $restaurant['status'] = $status;

            array_push($restaurants,$restaurant);
        }

        return $restaurants;
	}
}

/*
	* Listing items of a restaurant
	* When this method is called items are fetched
	*/
	function get_items($restaurant_id){
		$stmt = $this->con->prepare("SELECT item_id,item_name,rating,price,availability FROM item where restaurant_id = ?");
		$stmt->bind_param("s", $restaurant_id);
        $stmt->execute();
        $stmt->bind_result($item_id,$restaurant_name,$rating,$avg_price,$delivery_time,$cuisine,$availability);
        $items = array();

        while($stmt->fetch()){
            $item = array();
            $item['item_name'] = $item_name;
            $item['item_id'] = $item_id;
            $item['rating'] = $rating;
            $item['price'] = $price;
            $item['availability'] = $availability;
            $item['restaurant_id'] = $restaurant_id;

            array_push($items,$item);
        }

        return $items;
	}
}