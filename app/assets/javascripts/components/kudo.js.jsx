class Kudo extends React.Component {
  render() {
    var giver = '',
        receiver = ''

    if( this.props.giver ) {
      giver = <li>
                from
                <a href={"/profile/"+ this.props.giver.id} >
                  { this.props.giver.username }
                </a>
              </li>
    }

    if( this.props.receiver ) {
      receiver = <li>
                to
                <a href={"/profile/"+ this.props.receiver.id} >
                  { this.props.receiver.username }
                </a>
              </li>
    }
    return <div>
      <blockquote><p>{ this.props.text }</p></blockquote>
      <ul className="divided">
        { giver }
        { receiver }
        <li>{ moment(this.props.created_at).calendar() }</li>
      </ul>
    </div>
  }
}
