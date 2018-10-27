select * from customer;

select * from customer
where state = 'CA'
order by name DESC;

select Name, City, State, Sales, Active as 'Is Active?' from customer
where state = 'CA'
order by name DESC;

select * from customer
where state = 'CA'
 and city = 'Fresno'
order by name DESC;