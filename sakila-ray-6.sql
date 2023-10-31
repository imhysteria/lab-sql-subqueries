USE sakila;



#1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT COUNT(*) AS num_copies
FROM sakila.inventory
WHERE film_id IN (
SELECT film_id
FROM film
WHERE title = "Hunchback Impossible");


#2 List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT * FROM sakila.film;

SELECT film_id, title, length FROM sakila.film
WHERE length > (SELECT AVG(length) FROM sakila.film)
ORDER BY length DESC;


#3 Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT CONCAT(first_name,' ' , last_name) AS actor_name FROM sakila.actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film_actor
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'Alone Trip'
);


#4 Identify all movies categorized as family films.

SELECT * FROM sakila.category;

SELECT title FROM sakila.film
WHERE film.film_id IN (
    SELECT film_category.film_id
    FROM film_category
    JOIN category ON category.category_id = film_category.category_id
    WHERE category.name = 'Family');

#5 Retrieve the name and email of customers from Canada using both subqueries and joins. 

SELECT * FROM sakila.customer;

SELECT first_name, last_name, email FROM sakila.customer
WHERE customer.store_id IN(
	SELECT store.store_id
    FROM store
    JOIN address ON address.address_id = customer.address_id
    WHERE customer.store_id = '2');


#6 Determine which films were starred by the most prolific actor in the Sakila database (INCOMPLETE)

SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;

SELECT actor_id, COUNT(film_id) FROM sakila.film_actor
GROUP BY film_actor.actor_id 
ORDER BY film_actor.actor_id ASC
LIMIT 1;

SELECT title from sakila.actor
WHERE


#7 Find the films rented by the most profitable customer in the Sakila database. (INCOMPLETE)
#8 Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. (INCOMPLETE)