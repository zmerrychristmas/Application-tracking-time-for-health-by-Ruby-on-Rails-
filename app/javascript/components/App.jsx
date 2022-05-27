import React from "react";
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import Home from "./Home";
import UploadCSV from "./UploadCSV";
import Contact from "./Contact";

import "antd/dist/antd.css";

const App = () => {
  return (
    <Router>
        <Routes>
          <Route path='/' element={<UploadCSV/>} />
          <Route path='/contact' element={<Contact/>} />
        </Routes>
    </Router>
  );
}

export default App;