== README

Ruby version: 
ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin13.0]

For this app I used Tribune Media Services API:
http://developer.tmsapi.com/

Thanks TMS for the free API key upgrade!

API search: genres.each do : The genres output was basically a nested hash. So loop was edited as an array of genres, instructions are available here
available_genres.each: http://stackoverflow.com/questions/12983815/how-do-i-use-an-array-of-an-array-of-strings-to-match-another-string

Favorites button: User should be able to search for shows and pick favorites without necessarily saving every search option in the database. Used ActiveSupport to encode the object as a JSON string (text), then that text was submitted to the shows controller, and the shows controller converted the text from a string back into a show, to be saved in the database. 
Documentation: http://api.rubyonrails.org/classes/ActiveSupport/JSON.html

Partials: _show.html.erb - explain this a little bit better

Favorites buttons from search page: http://stackoverflow.com/questions/12360148/rails-link-to-or-button-to-post-request-with-parameters

Cleaned up CSS using nested layouts:
http://guides.rubyonrails.org/layouts_and_rendering.html#using-nested-layouts
This tag came in handy. 
<style>
		<%= yield :stylesheet %>
	</style>
Disabled tag on the index.html.erb, and added to Application.html.erb

The link underlines are handled by the text-decoration property. Look in style.css, there a line that says text-decoration: none. 

Style scoped, for html5, makes this piece of code html compliant. Sometimes you would not be able to render the style tag if it were outside the body.





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

