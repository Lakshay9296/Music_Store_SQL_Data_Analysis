# SQL Data Analysis Project: Music Store Database

This project involves analyzing a music store database using SQL. The database contains information about albums, artists, customers, employees, genres, invoices, and tracks. The analysis focuses on various aspects of the music store's operations, such as sales trends, customer behavior, and inventory management.

## Table of Contents
- [Project Overview](#project-overview)
- [Database Structure](#database-structure)
- [Problem Statement](#problem-statement)
- [Analysis](#analysis)
- [Results](#results)

## Project Overview
The purpose of this project is to analyze the music store's database to gain insights into sales performance, customer preferences, and inventory management. The analysis is performed using SQL queries on a set of tables representing different entities in the music store.

## Database Structure
The database consists of the following tables:
- `album2.csv`: Contains information about the albums available in the store.
- `artist.csv`: Contains details about the artists.
- `customer.csv`: Stores customer information.
- `employee.csv`: Includes data about the store employees.
- `genre.csv`: Lists the different music genres available.
- `invoice.csv`: Contains invoice details for each sale.
- `invoice_line.csv`: Stores individual line items for each invoice.
- `media_type.csv`: Describes the different media formats available.
- `playlist.csv`: Contains information about the playlists created in the store.
- `playlist_track.csv`: Lists the tracks included in each playlist.
- `track.csv`: Contains detailed information about each track, including album and genre.

## Problem Statement
The analysis aims to answer the following questions divided into three sets based on difficulty:

### Question Set 1 - Easy
1. **Who is the senior most employee based on job title?**
2. **Which countries have the most Invoices?**
3. **What are the top 3 values of total invoice?**
4. **Which city has the best customers?**  
   We would like to throw a promotional Music Festival in the city where we made the most money. Write a query that returns the city with the highest sum of invoice totals, including the city name & the total sum.
5. **Who is the best customer?**  
   The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.

### Question Set 2 - Moderate
1. **Identify Rock Music listeners.**  
   Write a query to return the email, first name, last name, & genre of all Rock Music listeners. Order the list alphabetically by email starting with A.
2. **Top Rock Music Artists.**  
   Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the artist name and total track count of the top 10 rock bands.
3. **Find long songs.**  
   Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track, ordered by song length with the longest songs listed first.

### Question Set 3 - Advanced
1. **Spending by Customers on Artists.**  
   Find how much each customer spent on artists. Write a query to return the customer name, artist name, and total amount spent.
2. **Most Popular Music Genre by Country.**  
   Determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top genre. For countries where the maximum number of purchases is shared, return all relevant genres.
3. **Top Spending Customer by Country.**  
   Determine the customer who has spent the most on music for each country. Write a query that returns the country along with the top customer and their total spending.

## Analysis
The project covers the following analyses:
1. **Sales Trends Analysis**: Analyzes the overall sales trends, identifying peak periods and popular products.
2. **Customer Behavior Analysis**: Examines customer purchasing patterns to identify top customers and customer retention.
3. **Genre Popularity Analysis**: Investigates the popularity of different music genres and tracks.
4. **Employee Performance Analysis**: Evaluates the performance of employees based on sales metrics.
5. **Inventory Management**: Assesses the inventory to ensure optimal stock levels and product availability.

## Results
The analysis provides insights into the music store's operations, helping to identify key trends, optimize inventory, and improve customer engagement. The SQL queries used in this project extract valuable information that can be used for strategic decision-making.
