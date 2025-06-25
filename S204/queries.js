// 01. Write a query to display all the documents in the Restaurants collection.
db.restaurants.find({});

// 02. Write a query to display the restaurant_id, name, borough and cuisine for all the documents in the Restaurants collection.
db.restaurants.find(
  {},
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 03. Write a query to display the restaurant_id, name, borough and cuisine, but exclude the field _id for all the documents in the Restaurants collection.
db.restaurants.find(
  {},
  {
    "_id": 0,
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 04. Write a query to display the restaurant_id, name, borough and zip code, but exclude the field _id for all the documents in the Restaurants collection.
db.restaurants.find(
  {},
  {
    "_id": 0,
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "address.zipcode": 1
  }
);

// 05. Write a query to display all the restaurants that are in the Bronx.
db.restaurants.find({
  "borough": "Bronx"
});

// 06. Write a query to display the first 5 restaurants that are in the Bronx.
db.restaurants.find(
  { "borough": "Bronx" }
).limit(5);

// 07. Write a query to display the next 5 restaurants after skipping the first 5 which are in the Bronx.
db.restaurants.find(
  { "borough": "Bronx" }
).skip(5).limit(5);

// 08. Write a query to find the restaurants that have a score greater than 90.
db.restaurants.find({
  "grades.score": { $gt: 90 }
});

// 09. Write a query to find the restaurants that have a score greater than 80 but less than 100.
db.restaurants.find({
  "grades.score": { $gt: 80, $lt: 100 }
});

// 10. Write a query to find the restaurants that are located at a longitude less than -95.754168.
db.restaurants.find({
  "address.coord.0": { $lt: -95.754168 }
});

// 11. Write a MongoDB query to find the restaurants that do not prepare 'American ' cuisine and have a score more than 70 and located at latitude less than -65.754168.
db.restaurants.find({
  "cuisine": { $ne: "American " },
  "grades.score": { $gt: 70 },
  "address.coord.1": { $lt: -65.754168 }
});

// 12. Write a query to find the restaurants that do not prepare 'American ' cuisine and have a score more than 70 and located at latitude less than -65.754168 without using the $and operator.
db.restaurants.find({
  "cuisine": { $ne: "American " },
  "grades.score": { $gt: 70 },
  "address.coord.1": { $lt: -65.754168 }
});

// 13. Write a query to find the restaurants that do not prepare 'American ' cuisine, have a grade of 'A', and do not belong to Brooklyn. The document should be displayed according to the cuisine in descending order.
db.restaurants.find({
  $and: [
    { "cuisine": { $ne: "American " } },
    { "grades.grade": "A" },
    { "borough": { $ne: "Brooklyn" } }
  ]
}).sort({ "cuisine": -1 });

// 14. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which contain 'Wil' as the first three letters in their name.
db.restaurants.find(
  { "name": { $regex: /^Wil/ } },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 15. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which contain 'ces' as the last three letters in their name.
db.restaurants.find(
  { "name": { $regex: /ces$/ } },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 16. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which contain 'Reg' as three letters somewhere in their name.
db.restaurants.find(
  { "name": { $regex: /Reg/ } },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 17. Write a query to find the restaurants that belong to the Bronx and prepare American or Chinese dishes.
db.restaurants.find({
  "borough": "Bronx",
  "cuisine": { $in: ["American ", "Chinese"] }
});

// 18. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which belong to Staten Island, Queens, Bronx or Brooklyn.
db.restaurants.find(
  {
    "borough": { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 19. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which do NOT belong to Staten Island, Queens, Bronx or Brooklyn.
db.restaurants.find(
  {
    "borough": { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 20. Write a query to find the restaurants that have a score less than 10.
db.restaurants.find({
  "grades.score": { $lt: 10 }
});

// 21. Write a query to find the restaurant_id, name, borough and cuisine for those restaurants which prepare seafood except if they are 'American ', 'Chinese' or the name of the restaurant starts with 'Wil'.
db.restaurants.find(
  {
    "cuisine": "Seafood",
    "name": { $not: /^Wil/ },
    "cuisine": { $nin: ["American ", "Chinese"] }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "borough": 1,
    "cuisine": 1
  }
);

// 22. Write a query to find the restaurant_id, name and grades for those restaurants that achieved a grade of "A" and a score of 11 on date "2014-08-11T00:00:00Z".
db.restaurants.find(
  {
    "grades": {
      $elemMatch: {
        "grade": "A",
        "score": 11,
        "date": ISODate("2014-08-11T00:00:00Z")
      }
    }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "grades": 1
  }
);

// 23. Write a query to find the restaurant_id, name and grades for those restaurants where the 2nd element of the grades array contains a grade of "A", a score of 9 and a date of "2014-08-11T00:00:00Z".
db.restaurants.find(
  {
    "grades.1.grade": "A",
    "grades.1.score": 9,
    "grades.1.date": ISODate("2014-08-11T00:00:00Z")
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "grades": 1
  }
);

// 24. Write a query to find the restaurant_id, name, address and geographical location for those restaurants where the 2nd element of the coord array contains a value between 42 and 52.
db.restaurants.find(
  {
    "address.coord.1": { $gt: 42, $lt: 52 }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "address": 1
  }
);

// 25. Write a query to organize the restaurants by name in ascending order.
db.restaurants.find().sort({ "name": 1 });

// 26. Write a query to organize the restaurants by name in descending order.
db.restaurants.find().sort({ "name": -1 });

// 27. Write a query to organize the restaurants by cuisine in ascending order and by borough in descending order.
db.restaurants.find().sort({ "cuisine": 1, "borough": -1 });

// 28. Write a query to know if the addresses contain the street field.
db.restaurants.find(
  { "address.street": { $exists: true } }
);

// 29. Write a query to select all documents in the restaurant collection where the coord field is of type Double.
db.restaurants.find(
  { "address.coord": { $type: "double" } }
);

// 30. Write a query to select the restaurant_id, name, grade and score for those restaurants that return a modulus of 0 after dividing their score by 7.
db.restaurants.find(
  {
    "grades.score": { $mod: [7, 0] }
  },
  {
    "restaurant_id": 1,
    "name": 1,
    "grades": 1
  }
);

// 31. Write a query to find the name, borough, longitude, latitude and cuisine for those restaurants which contain 'mon' as part of their name.
db.restaurants.find(
  { "name": { $regex: /mon/i } },
  {
    "name": 1,
    "borough": 1,
    "address.coord": 1,
    "cuisine": 1
  }
);

// 32. Write a query to find the name, borough, longitude, latitude and cuisine for those restaurants which contain 'Mad' as the first three letters of their name.
db.restaurants.find(
  { "name": { $regex: /^Mad/ } },
  {
    "name": 1,
    "borough": 1,
    "address.coord": 1,
    "cuisine": 1
  }
);