import React from 'react';
import Widget from '../../assets/javascripts/widget';
import {updatedAt} from '../../assets/javascripts/helpers';

import './victor_ops.scss';

class Incident extends React.Component {
  render() {
    return (
      <li>
        <span className="label">{this.props.label}</span>
        <span className="phase">{this.props.phase}</span>
      </li>
    );
  }
}

Widget.mount(class VictorOps extends Widget {
  renderItems(items) {
    if(items.length) {
      return <ul>{items.map((item, i) => {
        return <Incident key={i} label={item.label} phase={item.phase}/>;
      })}</ul>;
    } else {
     return <h3>Hooray! No open incidents!</h3>
    }
  }
  render() {
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h3>{this.props.text}</h3>
        {this.renderItems(this.state.items || [])}
        <p className="more-info">Powered by VictorOps</p>
        <p className="updated-at">{updatedAt(this.state.updated_at)}</p>
      </div>
    );
  }
});
