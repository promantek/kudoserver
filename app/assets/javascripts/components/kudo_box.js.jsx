class KudoBox extends React.Component {
  constructor(props) {
    super(props)
    this.state = { kudo: '', over_limit: this.props.over_limit }
  }

  handleChange(event) {
    this.setState({ kudo: event.target.value })
  }

  handleSubmit(event) {
    if( this.valid()  ) {
      var data = { text: this.state.kudo,
                   receiver_id: this.props.receiver_id },
          that = this
      POST(this.props.path, data).end((err, data) => {
        if( !err ) {
          ReactRailsUJS.unmountComponents('.kudo_list div')
          ReactRailsUJS.mountComponents('.kudo_list div')
          that.setState({ kudo: '', over_limit: data.body.over_limit })
        } else {
          if( data.body.message.match(/too many kudos/) ) {
            that.setState({ over_limit: true })
          }
        }
      })
    }
    event.preventDefault()
  }

  length() {
    return (this.state.kudo || '').length
  }

  remaining() {
    return 140 - this.length()
  }

  valid() {
    return !this.state.over_limit && this.remaining() > 0 && this.length() > 1
  }

  warningClass() {
    if( this.remaining() < 20 ) return 'warn';
  }

  buttonMessage() {
    if( this.state.over_limit ) return 'At Daily Kudo Limit'
    if( this.remaining() < 0 ) return 'Too long!'
    if( this.length() < 1 ) return 'Add a Kudo...'
    return 'Send Your Kudo'
  }

  render() {
    return <form className={"kudo-form " + this.warningClass() }
                 onSubmit={this.handleSubmit.bind(this)} >
      <textarea value={this.state.kudo}
                onChange={this.handleChange.bind(this)}
                className="u-full-width"
                placeholder="Your Kudo"></textarea>
      <span className="kudo-count">{ this.remaining() }</span>
      <button disabled={ this.valid() ? null : true }
              type="submit"
              className="button-primary">{ this.buttonMessage() } </button>
    </form>
  }
}
