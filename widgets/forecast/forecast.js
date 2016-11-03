import React from 'react';
import Widget from '../../assets/javascripts/widget';
import {updatedAt} from '../../assets/javascripts/helpers';

import './forecast.scss';

Widget.mount(class Forecast extends Widget {
  render() {
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h2 className="temp">{this.state.temperature}</h2>
        <p className="summary">{this.state.summary}</p>
        <p className="more-info">Powered by Forecast.io</p>
        <p className="updated-at">{updatedAt(this.state.updated_at)}</p>
      </div>
    );
  }
});
