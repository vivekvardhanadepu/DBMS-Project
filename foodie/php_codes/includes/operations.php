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
	* The create operation
	* When this method is called a new record is created in the database
	*/
	function createHero($name, $realname, $rating, $teamaffiliation){
		$stmt = $this->con->prepare("INSERT INTO heroes (name, realname, rating, teamaffiliation) VALUES (?, ?, ?, ?)");
		$stmt->bind_param("ssis", $name, $realname, $rating, $teamaffiliation);
		if($stmt->execute())
			return true;
		return false;
	}

	/*
	* The read operation
	* When this method is called it is returning all the existing record of the database
	*/
	function getHeroes(){
		$stmt = $this->con->prepare("SELECT id, name, realname, rating, teamaffiliation FROM heroes");
		$stmt->execute();
		$stmt->bind_result($id, $name, $realname, $rating, $teamaffiliation);

		$heroes = array();

		while($stmt->fetch()){
			$hero  = array();
			$hero['id'] = $id;
			$hero['name'] = $name;
			$hero['realname'] = $realname;
			$hero['rating'] = $rating;
			$hero['teamaffiliation'] = $teamaffiliation;

			array_push($heroes, $hero);
		}

		return $heroes;
	}

	/*
	* The update operation
	* When this method is called the record with the given id is updated with the new given values
	*/
	function updateHero($id, $name, $realname, $rating, $teamaffiliation){
		$stmt = $this->con->prepare("UPDATE heroes SET name = ?, realname = ?, rating = ?, teamaffiliation = ? WHERE id = ?");
		$stmt->bind_param("ssisi", $name, $realname, $rating, $teamaffiliation, $id);
		if($stmt->execute())
			return true;
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
		$stmt = $this->con->prepare("SELECT restaurant_id,restaurant_name,rating,avg_price,delivery_time,cuisine FROM restaurant")
        $stmt->execute();
        $stmt->bind_result($restaurant_id,$restaurant_name,$rating,$avg_price,$delivery_time,$cuisine);
        $restaurants = array();

        while($stmt->fetch()){
            $restaurant = array();
            $restaurant['restaurant_name'] = $restaurant_name;
            $restaurant['restaurant_id'] = $restaurant_id;
            $restaurant['rating'] = $rating;
            $restaurant['avg_price'] = $avg_price;
            $restaurant['delivery_time'] = $delivery_time;
            $restaurant['cuisine'] = $cuisine;

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
        $restaurants = array();

        while($stmt->fetch()){
            $restaurant = array();
            $restaurant['item_name'] = $item_name;
            $restaurant['item_id'] = $item_id;
            $restaurant['rating'] = $rating;
            $restaurant['price'] = $price;
            $restaurant['availability'] = $availability;

            array_push($restaurants,$restaurant);
        }

        return $restaurants;
	}
}