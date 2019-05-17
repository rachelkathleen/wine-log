# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<p>
  <%= select_tag :varietal_id, options_from_collection_for_select(Varietal.order(:varietal_name), :id, :varietal_name), class: 'js-example-basic-single' %>
</p>
