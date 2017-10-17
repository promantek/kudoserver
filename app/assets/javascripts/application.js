//= require react
//= require react_ujs
//= require vanilla-ujs
//= require superagent
//= require_tree ./components

function POST(url, data) {
  return superagent.post(url)
                   .send(data)
                   .set('X-CSRF-Token', CSRF.token())
                   .set('Accept', 'application/json')
}

function GET(url) {
  return superagent.get(url)
}
