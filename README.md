## QuothMe
__QuothMe__ is a web application dedicated to creating, sharing, and finding
your favorite quotes. The goal is to demonstrate a simple app that can easily
act as a frontend for quotes from popular cultural figures.

Additionally, it is possible for people to create original quotes and
list themselves as the author. This is an aspect of most quote applications that
remains largely unused.

### Current Development
As it stands, the basic app is being cobbled together. You can currently post
quotes here:

```
http://0.0.0.0:3000/quotes/new
```
Quotes can be viewed on this (incredibly basic) route here:
```
http://0.0.0.0:3000/quotes/
```

User accounts are referred to as *authors*. In the future, authors have their own
quotes shown on their user pages.

#### Quoth Schema
the general structure of a quote model is as follows:
```
author: @quote.user.first_name, @quote.user.last_name
citation: text
image:string,

```
*author* is a string intended for a person's name. In the future,
it may be possible to update the author value to actually be a reference to a
registered user account.

*citation* contains the text of a quote. there is not currently a set limit on quote
length.

*img* is intended to be used as a decorative backdrop. We can find a way to
perform ImgMagick operations to alter the picture so that text remains readable
on every quote.

*tags* are a string value, and are currently broken, because Sean doesn't fully
understand the usage of the acts_as_taggable_on gem. It is intended to be a
purely topical tag for quotes to be assigned, with the intent of showing similar
kinds of quotes revolving around a topic or theme.

### Future Development
At this point, this is an extremely basic Ruby on Rails application, and won't
hold that much more complexity than, say, the One Month Rails Pinteresting app.

With that being said, there are a few interesting feature ideas worth exploring:
* topical tags for quotes
* likes, reshares, and comments (maybe)
* cross-post a quote to social networks
* User accounts (probably via Devise)
* OAuth / OpenID Connect (it might be fun to leverage Diaspora's new API)
* a stream of popular quotes
* an automated scraper for popular quotes from other websites
