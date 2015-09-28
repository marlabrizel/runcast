# [Runcast](http://runcast.herokuapp.com)

### Product

For many runners and cyclists, a personal record (PR) is one of the ultimate delineators of success. Many fitness trackers will record activities, but few will flag PRs. Even fewer still (none?) will analyze the success factors that contribute to an athlete's best efforts.

Runcast aims to bridge that gap. Users authenticate with [Strava](https://www.strava.com), and the application syncs the user's segments to a dashboard. Users can select a segment of their choosing and the application will determine which effort was a personal best and display the raw data related to that effort. From there, we'll help athletes determine under which conditions they performed their best. Because weather often plays a major factor in performance, the application integrates data from [Dark Sky](https://developer.forecast.io/) to retrieve historical data about a particular segment.

### Technical
[Original Project Assignment](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/self_directed_project.md)

Runcast incorporates the following
Rails with PostgreSQL
Ajax for segment selection
Sidekiq and Redis for background jobs processing
Capybara, VCR, and Webmock for testing
