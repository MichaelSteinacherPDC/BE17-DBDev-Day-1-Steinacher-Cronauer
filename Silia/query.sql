/* 
health-center 
--------------------------- */

/* All docters with intervention even if no intervention made by doctor: */
select doctors.first_name, doctors.last_name, intervention.intervention_date, treatment.medicine from treatment
right Join intervention on intervention.fk_treatment_id = treatment.treatment_id
right join doctors on intervention.fk_doctor_id = doctors.doctor_id


--  Same as above but only inverventions in Year 2022:
select doctors.first_name, doctors.last_name, intervention.intervention_date, treatment.medicine from treatment
right Join intervention on intervention.fk_treatment_id = treatment.treatment_id
right join doctors on intervention.fk_doctor_id = doctors.doctor_id
WHERE intervention.intervention_date Like "2022%";

-- all patients with doctors and intervention 
select patients.first_name, patients.last_name, doctors.first_name, doctors.last_name, treatment.medicine, intervention.intervention_date from patients
left Join unit on patients.fk_unit_id = unit.unit_id
left join doctors on unit.unit_id = doctors.fk_unit_id
left join intervention on doctors.doctor_id = intervention.fk_doctor_id  
left join treatment on intervention.fk_treatment_id = treatment.treatment_id;

/* 
Book-Library
------------------------ */

-- All Books with author and if were bought client name 
select buy.buy_date, books.title, author.first_name as author_first_name, author.last_name as author_last_name, client.first_name, client.last_name from client
right join buy on buy.fk_client_id = client.client_id
right join books on buy.fk_book_id = books.book_id
right join author on author.author_id = books.fk_author_id;

-- all books with author wether they were bought or not
select author.first_name, author.last_name, books.title, books.price, buy.buy_date from author
left join books on books.fk_author_id = author.author_id
left join buy on buy.fk_book_id = books.book_id

-- all books with authors that where bought and the price is > than avg book price
select author.first_name, author.last_name, books.title, books.price, buy.buy_date from author
join books on books.fk_author_id = author.author_id
join buy on buy.fk_book_id = books.book_id
Where books.price > ( select AVG(books.price) from books);

/* 
Other things 
_____________________________*/

-- Count how many records in a table 
select COUNT(patient_id) from patients;

-- patients info for patients that first name starts with letter M
select * from patients
Where first_name LIKE "M%";

