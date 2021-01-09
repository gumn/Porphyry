import React, { Component } from 'react';
import conf from '../../config/config.json';
import ConnexionContext from './../ConnexionContext/ConnexionContext';
import Auth from './../ConnexionContext/Auth';

const SESSION_URI = conf.services[0] + '/_session';
let setAuthSuccess, authSuccess;

class Authenticated extends Component {

  constructor() {
    super();
    this.state = {
      user: '',
      ask: false
    }
    this.handleAsk = this.handleAsk.bind(this);
    this.handleLogin = this.handleLogin.bind(this);
    this.handleLogout = this.handleLogout.bind(this);
  }

  static contextType = ConnexionContext

  render() {
    setAuthSuccess = this.context.setAuthSuccess;
    authSuccess = this.context.authSuccess;
    if (this.state.user) {
      return (
        <div className="Authenticated"> {this.state.user}
          <a href="#logout" onClick={this.handleLogout}>Se déconnecter</a>
        </div>
      );
    }
    if (this.state.ask) {
      return(
        <form className="Authenticated" onSubmit={this.handleLogin}>
          <input placeholder="nom d'utilisateur" ref={(x) => this.login = x} />
          <input placeholder="mot de passe" ref={(x) => this.password = x} type="password" />
          <input type="submit" value="Se connecter" />
        </form>
      );
    }
    return (
      <div className="Authenticated">
        <a href="#login" onClick={this.handleAsk}>Se connecter...</a>
      </div>
    );
  }

  handleAsk(e) {
    e.preventDefault();
    this.setState({ask: true});
  }

  handleLogin(e) {
    e.preventDefault();
    this._openSession();
    this.setState({ask: false});
  }

  handleLogout(e) {
    e.preventDefault();
    this._closeSession();
  }

  _fetchSession() {
    fetch(SESSION_URI, {credentials: 'include'})
      .then(x => x.json())
      .then(x => this.setState({user: x.name || x.userCtx.name}))
      .catch(() => this.setState({user: ''}));
  }

  _openSession() {
    let user = this.login.value;
    fetch(SESSION_URI, {
      method:'POST',
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body:`name=${user}&password=${this.password.value}`,
      credentials:'include'
    })
      .then(x => {
        if (!x.ok) throw new Error('Bad credentials!');
        if(x.ok) {
          setAuthSuccess(true);
          authSuccess = true;
          Auth.isLoggedIn = true;
        }
        this.setState({user})
      })
      .catch(() => this.setState({user: ''}));
  }

  _closeSession() {
    setAuthSuccess(false);
    Auth.isLoggedIn = false;
    authSuccess = false;
    fetch(SESSION_URI, {method:'DELETE', credentials:'include'})
      .then(() => this.setState({user: ''}));
  }

  componentDidMount() {
    this._fetchSession();
    this._timer = setInterval(
      () => this._fetchSession(),
      60000
    );
  }

  componentWillUnmount() {
    clearInterval(this._timer);
  }
}

export default Authenticated;
