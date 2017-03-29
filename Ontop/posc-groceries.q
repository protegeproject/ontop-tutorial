[QueryItem="Example-01"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# Show all product catalog sold by each store

SELECT ?productName ?price ?storeName
WHERE {
   ?x a :GroceryItem;
      :productName ?productName;
      :price ?price;
      :isSoldByStore ?store .
   ?store :storeName ?storeName
}

[QueryItem="Example-02"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# Show all product catalog for Safeway only

SELECT ?productName ?price
WHERE {
   ?x a :GroceryItem;
      :productName ?productName;
      :price ?price;
      :isSoldByStore ?store .
   ?store a :Safeway .
}

[QueryItem="Example-03"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# Show the product catalog for Walkers Shortbread only

SELECT ?productName ?price ?storeName
WHERE {
   ?x a :WalkersShortbreadItem;
      :productName ?productName;
      :price ?price;
      :isSoldByStore ?store .
   ?store :storeName ?storeName
}

[QueryItem="Example-04"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# Show the product catalog where the item's price is less than $4

SELECT ?productName ?price ?storeName
WHERE {
   ?x a :GroceryItem;
      :productName ?productName;
      :price ?price;
      :isSoldByStore ?store .
   ?store :storeName ?storeName .
   FILTER ( ?price < 4.00 )
}

[QueryItem="Example-05"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# Show the product catalog where the item's price is less than $4
# and sold by Safeway only.

SELECT ?productName ?price
WHERE {
   ?x a :GroceryItem;
      :productName ?productName;
      :price ?price;
      :isSoldByStore ?store .
   ?store a :Safeway .
   FILTER ( ?price < 4.00 )
}

[QueryItem="Example-06"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>

# This is an alternative way to query a same result as in Example-05.
# Notice the difference that the query doesn't include the
# variable ?store but instead it uses a shortcut "[ ... ]" to
# immediately filter the store using the class name 'Safeway'

# The shortcut is called a "blank node". It will tell the query
# to immediately reference to the target relation without
# having an intermediate variable when performing the query
# execution.

SELECT ?name ?price
WHERE {
   ?x a :GroceryItem;
      :productName ?name;
      :price ?price;
      :isSoldByStore [ a :Safeway ] .
   FILTER ( ?price < 4.00 )
}

[QueryItem="Example-07"]
PREFIX : <http://protege.stanford.edu/ontologies/groceries/>
PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>

# Another example of using the shortcut "blank node" to retrieve
# more information from multiple relations.

# Notice another shortcut in the SELECT statement where it uses
# an asterisk * to denote all variables in the query.

SELECT *
WHERE {
   ?x a :GroceryItem;
      :price ?price;
      :isSoldByStore [
   	:storeName ?storeName;
         geo:lat ?lat;
         geo:long ?long
      ] .
}
