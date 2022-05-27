import { Table, message, Popconfirm } from "antd";
import React from "react";
import AddCustomerModal from "./AddCustomerModal";
import moment from 'moment';
import { Input } from "antd";

class Customers extends React.Component {

    columns = [
        {
            title: 'Name',
            dataIndex: "name",
            key: "name",
            filters: [],
            onFilter: (value, record) => record.name.indexOf(value) === 0,
            sorter: (a, b) => a.name.localeCompare(b.name),
        },
        {
            title: "Date",
            dataIndex: "date",
            key: "date",
            sorter: (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime(),
        },
        {
            title: "Number",
            dataIndex: "number",
            key: "number",
            sorter: (a, b) => a.number - b.number,
        },
        {
            title: "Description",
            dataIndex: "description",
            key: "description",
        },
        {
            title: "Action",
            key: "action",
            render: (_text, record) => (
                <Popconfirm
                    title="Are you sure delete this customer?"
                    onConfirm={() => this.deleteCustomer(record.id)}
                    okText="Yes"
                    cancelText="No"
                >
                    <a href="#" type="danger">
                        Delete{" "}
                    </a>
                </Popconfirm>
            ),
        },
    ];

    state = {
        customers: [],
    };

    componentDidMount() {
        this.loadCustomers();
    }

    loadCustomers = () => {
        const url = "api/v1/customers/index";
        fetch(url)
            .then((data) => {
                if (data.ok) {
                    return data.json();
                }
                throw new Error("Network error.");
            })
            .then((data) => {
                data.forEach((customer) => {
                    const newEl = {
                        key: customer.id,
                        id: customer.id,
                        name: customer.name,
                        date: moment(customer.date).format('L'),
                        number: customer.number,
                        description: customer.description,
                    };

                    this.setState((prevState) => ({
                        customers: [...prevState.customers, newEl],
                    }));
                });
            })
            .catch((err) => message.error("Error: " + err));
    };

    reloadCustomers = () => {
        this.setState({ customers: [] });
        this.loadCustomers();
    };

    deleteCustomer = (id) => {
        const url = `api/v1/customers/${id}`;

        fetch(url, {
            method: "delete",
        })
            .then((data) => {
                if (data.ok) {
                    this.reloadCustomers();
                    return data.json();
                }
                throw new Error("Network error.");
            })
            .catch((err) => message.error("Error: " + err));
    };

    render() {
        return (
            <>
                <AddCustomerModal reloadCustomers={this.reloadCustomers} />
                <Table
                    className="table-striped-rows"
                    dataSource={this.state.customers}
                    columns={this.columns}
                    pagination={{ pageSize: 5 }}
                />
            </>
        );
    }
}

export default Customers;
