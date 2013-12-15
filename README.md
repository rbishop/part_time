# Part-time

Part-time is a multi-threaded, in-memory background job processing library for
Ruby applications that just don't work that hard. 

## Why

Part-time came about when building a Rails application that wanted to keep the
Web processes returning responses fast but didn't need something as robust as
Sidekiq or Resque just to send emails or hit third party APIs in the
background. Part-time is the perfect background processing library for rapid
prototyping and hackathons.

Most background job processing libraries require they be run in a separate
process and in most cases rrequire a whole other database such as Redis. This
adds a lot of overhead and complexity to applications that might not need
something so robust. Extra processes also means more memory, and contrary to
popular belief, memory isn't cheap when you're renting it. Part-time runs right
in the same process as your Ruby application.

Part-time's API also mimics Mike Perham's excellent
[Sidekiq](https://github.com/mperham/sidekiq) libary, so should your background
processing needs grow, you can upgrade to Siedkiq with minimal effort.

## Installation

Add this line to your application's Gemfile:

    gem 'part_time'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install part_time

## Usage

Setting up Part-time is a breeze. First, create an initializer in the
`config/initializers` directory of your Rails application:

```ruby
# config/initializers/part_time.rb
PartTime.work
```

By default Part-time will start with three workers. You can increase or
decrease that by passing a hash with a `size` key to `PartTime.work`

```ruby
PartTime.work(size: 5)
```

Bam! Part-time is now running and waiting for you to give it some work.
Part-time tries hard to mirror the Sidekiq API. Classes that include the
`PartTime::Job` module, define an instance method named `perform` will be added
to the worker queue. Lets say we have a `FlipBurgers` job that we want to push
tothe background:

```ruby
# app/jobs/flip_burgers.rb

class FlipBurgers
  include PartTime::Job

  def perform(number_of)
    flipper = BurgerFlipper.new
    number_of.times { flipper.flip! }
  end
end
```

You can then add this job to the queue by calling the `perform_async` method on
the `FlipBurgers` class:

```ruby
  FlipBurgers.perform_async(5)
```

That's it! You're done. Now put that manual about process forking and Redis
configuration down and get back to building your awesome application!

For serious multi-threading mayhem pair Part-time with the
[Puma](https://github.com/puma/puma) web server to make your application so
efficient that you'll have companies like Heroku and Engine Yard pulling their
hair out.

## A note about Ruby threads

Do keep in mind that Part-time uses one thread per worker. Despite all the
nasty things you've probably heard about threads in Ruby, threads are
incredibly useful no matter what Ruby implementation you're running, even MRI.
Most background jobs are just doing some sort of IO. Sending emails, updating
entries in the database, communicating with third party APIs, etc. This plays
right into the strengths of Ruby threads. The GVL/GIL releases the lock on a
thread that is doing IO and allows another thread to take control. With this in
mind, if you plan on doing heavy processing that is CPU bound then Part-time
isn't a good fit for your needs. 

Every application's needs will be different so experiment with different worker
sizes to find out what fits your needs. If you find yourself needing more than
5 workers it might be time to upgrade to Sidekiq. 

## Todo

* Timeouts
* Retries
* Graceful shutdowns

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
