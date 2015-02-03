# Blorg the Heartless

![Blorg the Heartless](http://i.imgur.com/rMYmXch.jpg)

Blorg the Heartless (a/k/a Honorifics) pulls tweets containing the phrase "the
{word}", classifies the word as a noun or an adjective, then prints out "Prince
Leopold the {word}" if it's an adjective (like Prince Leopold the Speedy) or
"Prince Leopold of the {word}" if it's a noun (like Prince Leopold of the Corn).

It uses the twitter and engtagger gems to pull from twitter and classify the
parts of speech.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
