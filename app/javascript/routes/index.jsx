import React from "react";
import { Router ,Route } from 'react-router-dom';
import Home from "../components/Home";

export default (
	<Router>
		<Route path='/' element={<Home/>} />
	</Router>
);
