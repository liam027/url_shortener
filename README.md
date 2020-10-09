# README
## URL Shortener

A small app that takes in a URL and provides a shortened link for sharing. It also provides visitor information when the link is used.

## Notes

I've used:
  - Rails 6
  - PostgreSQL

There are a few things I would have liked to address but due to time I haven't:
  - The case where a user provides a bad link (eg. one without the http protocol included) should be handled gracefully. I'd use REGEX to check if it was provided or not and append it if necessary.
  - I haven't included any tests.