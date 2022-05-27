import React from "react";
import { Layout, Menu } from "antd";
import { Link } from 'react-router-dom';

const { Header } = Layout;
const menuItems = [
    {
        key: '1',
        label: <Link to="/" style={{ textDecoration: 'none', display: 'block' }}>Home</Link>,
    },
    {
        key: '2',
        label: <Link to="/contact" style={{ textDecoration: 'none', display: 'block' }}>Contact</Link>,
    },
];
export default () => (
	<Header>
		<div className="logo" />
		<Menu theme="dark" mode="horizontal" items={menuItems} />
	</Header>
);
