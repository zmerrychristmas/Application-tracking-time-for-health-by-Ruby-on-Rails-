import { Layout } from "antd";
import React from "react";
import Header from "./Header";

const { Content, Footer } = Layout;

export default () => (
  <Layout className="layout">
    <Header />
    <Content style={{ padding: "0 50px" }}>
      <div className="site-layout-content" style={{ margin: "100px auto" }}>
<h3>PERSONAL DETAILS</h3>
<p><b>Name</b>: Leo Nguyen</p>
<p><b>Sex</b>: Male</p>
<p><b>Marital status</b>: Single</p>
<p><b>Skype</b>: zmerrychristmas</p>
<p><b>Website</b>: https://zmerrychristmas.github.io/</p>
<p><b>Github</b>: https://github.com/zmerrychristmas</p>
<p><b>Portfolio</b>:  https://zmerrychristmas.github.io/portfolio</p>
<p><b>Email</b>: leonguyen.starvisit@gmail.com</p>


<h3>SUMMARY</h3>
<p>
Software developer with passion and integrity hard work with more than 7 years of experience and a variety of different domains in software projects.<br />
Highly experienced and skilled in PHP, Ruby on Rails and Laravel, RESTful API as well as  Python, Golang, VueJS, DevOps, and other frameworks.<br />
Have hands-on experience with the back-end side and database handling, web base integration with infrastructures such as CI/CD, Log, and AWS services. I can work independently and under pressure with high discipline and stability.<br />
Have experience in building web-based systems such as booking, dashboard management, tourism, visual view, and evaluating projects. Developing the app with Japanese customers, integrating payment, building app extensions Shopify, and developing server-side with good technology and high user experience.<br />
Good solution-oriented skills, problem-solving skills, teamwork spirit, humility, and friendly.
</p>
      </div>
    </Content>
    <Footer style={{ textAlign: "center" }}>Leo Nguyen ©2020.</Footer>
  </Layout>
);