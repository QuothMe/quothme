## QuothMe
__QuothMe__ is a web application dedicated to creating, sharing, and finding
your favorite quotes. Quotes are assigned to authors, and contain topical tags
regarding their subject material.

Additionally, it is possible for people to create original quotes and
list themselves as the author. This is an aspect of most quote applications that
remains largely unused.

### Current Development
QuothMe allows for the creation of quotes, favoriting them, commenting on them,
and following authors. The app demonstrates notifications for comment and favorite
actions, and allows

Quotes are represented as cards on user profiles, and can be shared to various
social networks. The design and layout is in the process of being polished up,
allowing for a simple design that focuses on the content itself.

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
* OAuth / OpenID Connect (it might be fun to leverage Diaspora's new API)
* a stream of popular quotes
