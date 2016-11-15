import React from 'react';
import Widget from '../../assets/javascripts/widget';
import {updatedAt,truncate} from '../../assets/javascripts/helpers';

import './jira.scss';

class Issue extends React.Component {
  render() {
    return (
      <li>
        <img className="priority-icon" src={this.props.priorityImage} alt={this.props.priority} />
        <span className="label">
          {truncate(this.props.summary, this.props.summaryLength || 80)}
        </span>
        <span className="value">{this.props.id}</span>
      </li>
    );
  }
}

export class Jira extends Widget {
  renderItems(items) {
    return items.map((item, i) => {
      return <Issue key={i}
                    id={item.id}
                    summary={item.summary}
                    summaryLength={+this.props.summaryLength}
                    priority={item.priority.name}
                    priorityImage={item.priority.iconUrl}/>;
    });
  }
  renderList(items) {
    return <ul>{items}</ul>;
  }
  render() {
    let items = (this.state.items || []).slice(0, this.props.limit || Infinity)
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h3>{this.props.text}</h3>
        <ul>
          {this.renderList(this.renderItems(items))}
        </ul>
        <p className="more-info">{this.props.moreinfo}</p>
        <p className="updated-at">{updatedAt(this.state.updated_at)}</p>
      </div>
    );
  }
};

Widget.mount(Jira);
