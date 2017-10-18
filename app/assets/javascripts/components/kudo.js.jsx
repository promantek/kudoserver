class Kudo extends React.Component {
  render() {
    var giver = '',
        reciever = ''

    if( this.props.giver ) {
      giver = <li>
                from
                <a href={"/profile/"+ this.props.giver.id} >
                  { this.props.giver.username }
                </a>
              </li>
    }

    if( this.props.reciever ) {
      reciever = <li>
                to
                <a href={"/profile/"+ this.props.reciever.id} >
                  { this.props.reciever.username }
                </a>
              </li>
    }
    return <div>
      <blockquote><p>{ this.props.text }</p></blockquote>
      <ul className="divided">
        { giver }
        { reciever }
        <li>{ moment(this.props.created_at).calendar() }</li>
      </ul>
    </div>
  }
}
