# GraphQL Playground

This repo contains code and notes from my January 2018 learning day under the GraphQL topic. A learning day is a day-a-month event at [Evermade](https://www.evermade.fi) where each developer can pick a topic of their interest and spend a full day on learning the technology as they best see fit. The only requirement is that the developer produces enough notes and code to be able to share their learnings onwards to fellow developers and co-workers.

*Psst...* This README is about GraphQL in general. If you want to read about my Elixir application instead, head over to `app/community`.


## What is GraphQL?

[GraphQL](http://graphql.org/) is a strongly typed data query language for APIs. Facebook began work on GraphQL internally in 2012, and released it as open source software in 2015.

Most typically, GraphQL is used as an alternative (or sometimes as complimentary) to REST. The biggest singular difference between the two is that unlike REST, GraphQL allows the client to define the structure of the data required, and the exact same structure is then returned from the GraphQL server.

This specificity comes with numerous benefits:

- Smaller payloads sent to clients, many of which can be mobile devices where download size is important
- Less parsing on the client (so better performance), as the client only receives exactly what it needs and uses just that
- Allows replacing multiple REST requests with a single GraphQL request, which allows servers to work more efficiently

GraphQL has incrementally gained wider adoptation, with the likes of GitHub using GraphQL instead of REST on [their v4 API](https://developer.github.com/v4/).

Other differences of GraphQL (compared to REST) include:
- The description of a resource is not coupled to the way you retrieve it
- Instead of using URLs to identify what is available in the API, you use a GraphQL schema
- Related resources can be fetched with a single request
- Instead of changing between GET/POST to specify a read/write, you change a keyword in the query
- Requested types are strictly checked before executing code  

## Clients

As many GraphQL backends often expose their API over HTTP where queries can be sent in the body of a POST request, it is often fully possible to interact with the GraphQL API directly by using just things like the fetch API of JavaScript.

The downside of this approach is that you will need to think about many cases by yourself, such as data caching, framework integration (e.g. Vue, React), pagination, and management of websockets when using GraphQL subscriptions. *This is why you will most likely want to use a dedicated GraphQL client*.

The two most popular and most sophisticated GraphQL clients today are called [Apollo](https://www.apollographql.com/) and [Relay](https://facebook.github.io/relay/).

### Relay
*[Relay](https://facebook.github.io/relay/)* is a very opinionated, React-focused client. It has less flexibility and dictates the structure of your application more, but comes with arguably greater developer experience and productivity if you are specifically building a React or React Native app. Relay also sets some Relay-specific requirements for the server GraphQL schema.

### Apollo
*[Apollo](https://www.apollographql.com/)* is completely framework agnostic, and allows you to customize your usage a lot to suit your needs (from very lightweight integrations to more sophisticated uses). It is easier to get started with, but requires more manual work. Apollo works with any GraphQL schema.

### Notes
*Note*: while Relay is more directly geared towards React, both follow a fairly similar approach when used in a React application (using higher-order components and making data available to the component via props).

*Note*: while the primary application of GraphQL is for clients that do not co-locate with the server code (e.g. mobile apps and SPAs), there is nothing that stops you from using GraphQL to power your server-side rendered interfaces.


## How I studied

In addition to the official GraphQL website, the primary source of information for my learning day was the [eBook](https://pragprog.com/book/wwgraphql/craft-graphql-apis-in-elixir-with-absinthe) "Craft GraphQL APIs in Elixir with Absinthe" by Bruce Williams and Ben Wilson.

Additionally, the [How To GraphQL](https://www.howtographql.com) site provided valuable (yet free!) tutorials and other materials.


## Other notes

The [GraphiQL](https://github.com/graphql/graphiql) tool for exploring GraphQL APIs is super valuable for development and testing. It ships with the Elixir Absinthe library so I got to use it with zero setup.


## License

Licensed under the MIT license. See LICENSE file for more details.
