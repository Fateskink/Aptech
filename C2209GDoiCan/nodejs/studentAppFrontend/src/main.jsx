import React from 'react'
import ReactDOM from 'react-dom/client'
//import App from './App.js'
import StudentList from './screens/StudentList'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <StudentList/>
  </React.StrictMode>,
)
