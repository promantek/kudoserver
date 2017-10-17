class List extends React.Component {
  constructor(props) {
    super(props);
    this.state = { items: [] };
  }
  componentDidMount() {
    var that = this
    GET(this.props.path).end((_, data) => { that.setState({ items: data.body }) })
  }
  render() {
    var cudosList = this.state.items.map((kudos) => { return <Kudos {...kudos} /> })
    return <div>{ cudosList }</div>
  }
}
