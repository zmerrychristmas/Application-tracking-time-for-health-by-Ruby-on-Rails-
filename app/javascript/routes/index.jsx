import React from "react";
import { Router ,Route } from 'react-router-dom';
import Home from "../components/Home";
import UploadCSV from "../components/UploadCSV";

export default (
	<Router>
		<Route exact path='/' element={<Home/>} />
		<Route path='/upload-csv' element={<UploadCSV/>} />
	</Router>
);
