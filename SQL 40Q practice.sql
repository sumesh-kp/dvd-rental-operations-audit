select title, replacement_cost from film 
where replacement_cost between 20 and 25
order by title asc;

select title, description, length from film
where length < 50
order by title asc;

select title from film
where rating = 'G' or rating = 'PG' and
special_features = '{Trailers}'
order by title asc;

select rental_id, customer_id 
from rental
where return_date is null;

select first_name, last_name, email
from customer
where active = 1
order by first_name, last_name;

select first_name, last_name
from actor
where first_name like ('A%') 
and last_name like ('N%');

select distinct rental_rate
from film
order by rental_rate desc;

select amount, payment_date
from payment
order by amount desc
limit 10;

select address, district
from address
where postal_code = '40110' and postal_code = '25208';

select title, description
from film
where description like ('%Database%');

select sum(amount), first_name, last_name
from payment
inner join staff
on payment.staff_id = staff.staff_id
group by first_name, last_name
order by sum(amount) desc;

select name, amount from payment
inner join rental
on payment.customer_id = rental.customer_id
inner join category
on rental.last_update = category.last_update
where amount > 2;







