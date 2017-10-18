class List extends React.Component {
  constructor(props) {
    super(props);
    this.state = { items: [] };
  }
  componentDidMount() {
    var that = this
    GET(this.props.path).end((err, data) => {
      if( ! err ) that.setState({ items: data.body })
    })
  }
  render() {
    var kudosList = this.state.items.map((kudo) => {
      return <Kudo {...kudo} key={kudo.id} />
    })
    return <div>{ kudosList }</div>
  }
}
