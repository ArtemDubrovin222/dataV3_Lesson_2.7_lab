use sakila;

SELECT * FROM category;
SELECT * FROM film_category;
-- 1
SELECT c.name AS category, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY film_count ASC;
-- 2
SELECT s.staff_id, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p 
ON p.staff_id = s.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id
ORDER BY total_amount DESC;
-- 3
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(f.film_id) AS film_count
FROM actor a
JOIN film_actor f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;
-- 4
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC
LIMIT 1;
-- 5
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a 
ON s.address_id = a.address_id;
-- 6
SELECT f.title, COUNT(a.actor_id) as count_actor
FROM film f
JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY f.title;
-- 7
SELECT c.last_name, c.first_name, c.customer_id as amount
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.last_name, c.customer_id
ORDER BY c.last_name;
-- 8
SELECT title, name
FROM film
JOIN film_category
USING (film_id)
JOIN category
USING (category_id)
GROUP BY title, category_id;