import React from 'react'
import Widget from '../../assets/javascripts/widget'

import './tweet.scss'

Widget.mount(class Tweet extends Widget {
  render() {
    return (
      <div className={this.props.className}>
        <h3 className="title">
          <img className="profile-pic" src={this.state.user.profile_image_url || "http://placehold.it/50x50"}/>
          {this.state.user.screen_name || this.props.title}
        </h3>
        <p className="tweet">{this.state.text}</p>
        <p className="more-info">{this.props.moreinfo}</p>
      </div>
    )
  }
});
