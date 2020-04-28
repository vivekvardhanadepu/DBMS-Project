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
        $stmt->bind_result($restaurant_name);
        $restaurants = array();

        while($stmt->fetch()){
            $restaurant = array();
            $restaurant['restaurant_name'] = $restaurant_name;

            array_push($restaurants,$restaurant);
        }

        return $restaurants;
	}
}