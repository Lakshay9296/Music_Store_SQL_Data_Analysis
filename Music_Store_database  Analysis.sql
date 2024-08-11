-- set1 questions
-- 1. Who is the senior most employee based on job title?
use music_store;

select * from employee
order by levels desc
limit 1;

-- 2. Which countries have the most Invoices?
select count(*) as c,billing_country from invoice
group by billing_country
order by c desc;

-- 3. What are top 3 values of total invoice?
select total from invoice
order by total desc
limit 3;

-- 4. Which city has the best customers? We would like to throw a promotional Music
-- Festival in the city we made the most money. Write a query that returns one city that
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice
-- totals
select billing_city,sum(total) as invoice_total from invoice
group by billing_city
order by sum(total) desc
limit 1;


-- 5. Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total DESC
LIMIT 1;

-- set2 Questions
-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music
-- listeners. Return your list ordered alphabetically by email starting with A
select first_name,last_name,email 
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
		select track_id from track
        join genre on track.genre_id = genre.genre_id
        where genre.name like "Rock"
)
order by email ;

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands
select artist.artist_id,artist.name, count(artist.artist_id) as number_of_songs
from track
join album2 on track.album_id = album2.album_id
join artist on album2.artist_id = artist.artist_id
join genre on track.genre_id = genre.genre_id
where genre.name like "Rock"
group by artist.artist_id,artist.name
order by number_of_songs desc
limit 10;


-- 3. Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the
-- longest songs listed first
select name,milliseconds as track_length from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
    from track
)
order by milliseconds desc;



-- set3 Questions
-- 1. Find how much amount spent by each customer on artists? Write a query to return
-- customer name, artist name and total spent

select c.first_name,c.last_name,ar.name as artist_name, 
sum(il.unit_price*il.quantity) as total_spent 
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join album2 a on t.album_id = a.album_id
join artist ar on a.artist_id = ar.artist_id
group by 1,2,3
order by 4 desc;



select i.billing_country,g.name
from invoice i
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join genre g on t.genre_id = g.genre_id;

-- 2. We want to find out the most popular music Genre for each country. We determine the
-- most popular genre as the genre with the highest amount of purchases. Write a query
-- that returns each country along with the top Genre. For countries where the maximum
-- number of purchases is shared return all Genres

with genre_purchases as(
	select c.country,g.name,count(invoice_line_id) as purchase_count
    from customer c
    join invoice i on c.customer_id = i.customer_id
    join invoice_line il on i.invoice_id = il.invoice_id
	join track t on il.track_id = t.track_id
	join genre g on t.genre_id = g.genre_id
    group by 1,2    
),
max_purchases as(
	select country, max(purchase_count) as max_purchase_count
    from genre_purchases
    group by country
)
select gp.country,gp.name,gp.purchase_count as total_purchases
from genre_purchases gp
join max_purchases mp on gp.country = mp.country 
					and gp.purchase_count = mp.max_purchase_count
order by 1,2;


-- 3. Write a query that determines the customer that has spent the most on music for each
-- country. Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all
-- customers who spent this amount

with customer_with_country as (
	select c.customer_id , c.first_name,c.last_name,
    i.billing_country,sum(i.total) as total_spend,
    row_number() over(partition by i.billing_country order by sum(i.total) desc) as row_no
    from invoice i
    join customer c on i.customer_id = c.customer_id
    group by 1,2,3,4
    order by 5 desc
)
select first_name,last_name,billing_country,total_spend 
from customer_with_country cc
where row_no<=1



