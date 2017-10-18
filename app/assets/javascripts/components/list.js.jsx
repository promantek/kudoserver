class List extends React.Component {
  constructor(props) {
    super(props);
    this.state = { items: [], count: 0, page: 0, limit: 5 };
  }

  fetchData(page, limit) {
    var that = this,
        page = page,
        limit = limit || this.state.limit
        url = this.props.path + '?' + ['page='+page, 'limit='+limit].join('&')

    GET(url).end((err, data) => {
      if( ! err ) {
        that.setState({
          items: data.body.kudos,
          count: data.body.count,
          page: page,
          limit: limit
        })
      }
    })
  }

  componentDidMount() { this.fetchData(0) }

  setLimit(event) {
    this.fetchData(0, event.target.value)
  }

  maxPage() {
    return Math.ceil(this.state.count / this.state.limit)
  }

  prevPage(event) {
    event.preventDefault()
    this.setPage(-1)
  }

  nextPage(event) {
    event.preventDefault()
    this.setPage(1)
  }

  setPage(direction) {
    var page = this.state.page + direction
    if( page < 0 ) page = 0
    if( page >= this.maxPage() ) page = this.maxPage()

    this.fetchData(page)
  }

  pagination() {
    var next = '',
        prev = '',
        pages = <span>{ this.state.page + 1 }/{ this.maxPage() }</span>,
        select = ''

    if( this.state.page > 0 ) {
      prev = <a href="#"
                className="prev"
                onClick={ this.prevPage.bind(this) }>« Prev</a>
    }

    if( this.state.page + 1 < this.maxPage() ) {
      next = <a href="#"
                className="next"
                onClick={ this.nextPage.bind(this) }>Next »</a>
    }

    if( this.maxPage() < 2 ) pages = ''

    if( this.state.count > 5 ) {
      var fifteen = ''
      if( this.state.count > 10 ) {
        fifteen = <option value="15">15 per page</option>
      }

      select = <select onChange={ this.setLimit.bind(this) } >
        <option value="5">5 per page</option>
        <option value="10">10 per page</option>
        { fifteen }
      </select>
    }

    return <div className="pagination">
      { prev }
      { next }
      <div className="center">
        { pages }<br />
        { select }
      </div>
    </div>
  }

  render() {

    return <div>
      { this.state.items.map((kudo) => {
        return <Kudo {...kudo} key={kudo.id} />
      }) }
      { this.pagination() }
    </div>
  }
}
