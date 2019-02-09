glexport-test
=============

**glexport-test** is a backend focused interview project.

Given a database with already seeded tables and data, please create an API web application server that responds to a URL and returns JSON. More specifically, your web server will respond to the `GET index` endpoint `/api/v1/shipments` and return data according to the specification as described in `api/v1/shipments_spec.rb`

The Shipup backend is written in Ruby on Rails, and while its influence is obvious, this project is designed to be language and framework agnostic. Your web server can be written in Python with Django/Flask, Javascript with Node+Express, or something more exotic. The tests are written in rspec+Ruby, but should be very readable even if you don't know any Ruby: All they do to call an URL and inspect the JSON response.

Instructions
------------

1. Read the rest of this README and review `api/v1/shipments_spec.rb` to understand the endpoint requirements
2. Install docker and docker-compose
3. Perform the following one time setup steps to get the spec runner working and to initiate the DB.
  + Go to the project root
  + Modify `spec/config.rb` and `docker-compose.yml` if necessary (i.e if you want to use MySQL instead of PostgreSQL or if you want to develop on a different host / port). By default, the tests will make a GET request on localhost:3000.
  + Run `docker-compose up`. It will instanciate the DB, seed it and then run the tests. The spec container will then exit but your DB will be up and accessible on your local machine.
4. If you wish to run the tests again, you can run `docker-compose run spec`
5. You can now develop the server that should successfully pass the tests and send the result via email or github

What we're looking for
----------------------

We'd like you to strike a balance between maintainability and speed, with a mild preference towards maintainability. (After all, we've got to read this code to judge it)

Don't worry too much about where it falls in the spectrum though; it's more important that when we talk about your code that you recognize the tradeoffs you made and what you can cut/add if asked to move in either direction.

In particular, if there's a (well respected) library or framework that you would like to use as part of your implementation, please use it. We're here to make working software that accommodates (some frankly insane) business logic, not to reimplement bcrypt.

The rspec test
--------------

After resetting the database, the rspec test pings `GET /api/v1/shipments` with various parameters and examines the json response. The spec can be split out five sections:
- Examining the contents of the json for a single record
- Sorting
- Filtering
- Pagination
- Error Handling

The desired output as defined in the "contents of a single record" section deliberately contains some questionable implementation choices. Please accommodate the desired output and we can discuss the pros and cons of the given json structure.

The Database and Schema
-----------------------

The sample database provided consists of four tables:
- companies
- shipments
- products
- shipment_products

A company has no association columns.

Both shipments and products have a `company_id` (belong to a company).

The shipment_products table is a join table that connects shipments and products, and thus has both a `product_id` and `company_id`.

```
shipup_test=# \d+ companies
Table "public.companies"
   Column   |            Type
------------+-----------------------------
 id         | integer
 name       | character varying
 created_at | timestamp without time zone
 updated_at | timestamp without time zone

shipup_test=# \d+ shipments
Table "public.shipments"
              Column               |            Type
-----------------------------------+-----------------------------
 id                                | integer
 name                              | character varying
 company_id                        | integer
 international_transportation_mode | character varying
 international_departure_date      | date
 created_at                        | timestamp without time zone
 updated_at                        | timestamp without time zone

shipup_test=# \d+ products
Table "public.products"
   Column    |            Type
-------------+-----------------------------
 id          | integer
 sku         | character varying
 description | character varying
 company_id  | integer
 created_at  | timestamp without time zone
 updated_at  | timestamp without time zone

shipup_test=# \d+ shipment_products
Table "public.shipment_products"
   Column    |            Type
-------------+-----------------------------
 id          | integer
 product_id  | integer
 shipment_id | integer
 quantity    | integer
 created_at  | timestamp without time zone
 updated_at  | timestamp without time zone
```
