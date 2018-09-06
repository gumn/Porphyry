import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import getConfig from '../../config/config.js';

// Get the configured list display mode
let listView = getConfig('listView', {
  mode: 'picture',
  name: 'name',
  image: 'thumbnail'
});

class Corpora extends Component {

  render() {
    let items = this._getItems();
    let count = this.props.items.length;
    let total = this.props.from;
    return(
      <div className="col-md-8 p-4">
        <div className="Subject">
          <h2 className="h4 font-weight-bold text-center">
            {this.props.ids.join(' + ')}
            <span className="badge badge-pill badge-light ml-4">{count} / {total}</span>
          </h2>
          <div className="Items m-2">
            {items}
          </div>
        </div>
      </div>
    );
  }

  _getItems() {
    return this.props.items.map(item =>
        <Item key={item.name} item={item}
          id={item.corpus+'/'+item.name} />
    );
  }

}

function Item(props) {
  switch (listView.mode) {
  case 'article':
    return Article(props.item);
  case 'picture':
    return Picture(props.item);
  default:
    return Picture(props.item);
  }
}

function getString(obj) {
  if (Array.isArray(obj)) {
    return obj.map(val => getString(val)).join(', ');
  }
  return String(obj);
}

function Article(item) {
  let propList = (listView.props || []).map(key => {
    return <li>{key} : <strong>{getString(item[key])}</strong></li>;
  });

  let uri = `/item/${item.corpus}/${item.id}`;
  let name = getString(item[listView.name]);
  return (
    <div className="Article">
      <div className="ArticleTitle"><Link to={uri}>{name}</Link></div>
      <ul>{propList}</ul>
    </div>
  );
}

function Picture(item) {
  let uri = `/item/${item.corpus}/${item.id}`;
  let img = getString(item[listView.image]);
  let name = getString(item[listView.name]);
  return (
    <div className="Item">
    <img src={img} alt={name}/>
      <Link to={uri}>
        <font color="#000000">{name}</font>
      </Link>
    </div>
  );
}

export default Corpora;
