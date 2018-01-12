<template>
  <div id="app">
    <h1>{{ msg }}</h1>
    <h2>The following was loaded over Graphql:</h2>
    <ul>
      <li v-for="link in allLinks">
        {{ link.url }}
      </li>
    </ul>

    <input v-model="newLinkURL" placeholder="URL">
    <input v-model="newLinkDesc" placeholder="Description">
    <button v-on:click="createLink">Add new</button>
  </div>
</template>

<script>
import gql from 'graphql-tag'
export default {
  name: 'app',
  data () {
    return {
      msg: 'Welcome to Your Vue.js & Phoenix & GraphQL App',
      newLinkURL: '',
      newLinkDesc: '',
      allLinks: [] // Apollo will assign the result of its "allLinks" query here!
    }
  },
 apollo: {
    // Apollo specific options
    // Here, we use gql to describe the data we want.
    allLinks: gql`{
      allLinks {
        id
        url
        description
      }
    }`
  },
  methods: {
    createLink: function () {
          // We save the user input in case of an error
          const newLink = this.newLink
          // We clear it early to give the UI a snappy feel
          this.newLink = ''
          // Call to the graphql mutation
          this.$apollo.mutate({
            // Query
            mutation: gql`mutation ($url: String!, $description: String!) {
              addTag(url: $url, description: $description) {
                id
                url
                description
              }
            }`,
            // Parameters
            variables: {
              url: newLink,
            },
            // Update the cache with the result
            // The query will be updated with the optimistic response
            // and then with the real result of the mutation
            update: (store, { data: { newLink } }) => {
              // Read the data from our cache for this query.
              //const data = store.readQuery({ query: LINKS_QUERY })
              // Add our tag from the mutation to the end
              data.links.push(newLink)
              // Write our data back to the cache.
              //store.writeQuery({ query: LINKS_QUERY, data })
            },
            // Optimistic UI
            // Will be treated as a 'fake' result as soon as the request is made
            // so that the UI can react quickly and the user be happy
            optimisticResponse: {
              __typename: 'Mutation',
              createLink: {
                __typename: 'Link',
                id: -1,
                label: newLink,
              },
            },
          }).then((data) => {
            // Result
            console.log(data)
          }).catch((error) => {
            // Error
            console.error(error)
            // We restore the initial user input
            this.newLink = newLink
          })
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
