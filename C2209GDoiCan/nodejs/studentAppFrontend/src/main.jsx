import React from 'react'
import ReactDOM from 'react-dom/client'
//import App from './App.js'
import ProductList from './screens/ProductList'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <ProductList x={1} y={2}/>
  </React.StrictMode>,
)
