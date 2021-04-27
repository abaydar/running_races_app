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


<%= form_for @user.races.build do |f| %>
    <%= f.hidden_field :user_id, value: current_user.id %>
        Select a Race:
        <%= f.collection_select :id, Race.all, :id, :name, prompt: true%>

        <%= f.submit 'Add Race' %>
<% end %>
