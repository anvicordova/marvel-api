# About the Solution

I used Sinatra and the MVC architecture for the app, I took this decision because
the app was an MVP, and I didn't want to over complicate the code.

One of the main classes is `MarvelService`, this class is used to fetch the information
from the MarvelAPI, it uses the ruby standard library to fetch the response body and parses it
into JSON. It also has some helpful methods that allow authentication.

The classes `MarvelCharacterService` and `MarvelStoryService` inherit from `MarvelService` and
have the purpose of retrieving more friendly data by into `MarvelCharacter` or `MarvelStory` models.

For testing, I used `rspec` and `webmock` to stub the requests to the API and avoid
making calls to it in the test environment. For this reason, the class `FakeMarvel` was created,
it receives the stubbed requests from testing and returns seed data under `rspec/support/fixtures`

# Challenges and Opportunities to improve

1. I think there's room for improvement regarding the sync calls that are performed. I think now it
works well because the app is relatively small, but if we would like to fetch more information like
comics and their thumbnails there could be some performance issues.

My thought is that maybe a queue can be implemented to perform the requests and once the job is done
we can display the information as soon as it is available.(observer pattern maybe)

Another performance issue, is that currently the same character is fetched twice, so I think some
caching would be helpful(this of course might require a db or redis at least).

2. Testing was also a bit challenging here, although the solution works well, it has the
downside that we have some fixed json that is not synced up with the real API, so if that one changes
and there's no update from our side, there could be false positives.

Also, I think for better coverage, more negative cases should be written. It might be necessary to
evaluate if `FakeMarvel` help us with this purpose or if it's better to stub the request in each
test and select and appropriate response there.

3. Something missing is the handle of API errors, this is something I think that should be handled
by the `MarvelService` before parsing the result to JSON.
So if we get a 4XX, 3XX or 5XX statuses, an exception could be triggered and the app could respond with an appropriate view.

---

That's all. I enjoyed this challenge a lot :)
