import { Layout } from "antd";
import React from "react";
import Customers from "./Customers";
import Header from "./Header";

const { Content, Footer } = Layout;

export default () => (
  <Layout className="layout">
    <Header />
    <Content style={{ padding: "0 50px" }}>
      <div className="site-layout-content" style={{ margin: "100px auto" }}>
        <h1>Customers Catalog</h1>
        <Customers />
      </div>
    </Content>
    <Footer style={{ textAlign: "center" }}>Leo Nguyen ©2020.</Footer>
  </Layout>
);