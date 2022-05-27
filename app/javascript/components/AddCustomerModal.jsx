import { Button, Form, Input, Modal, Select } from "antd";
import React, { useState } from "react";

class AddCustomerModal extends React.Component {
    formRef = React.createRef();
    state = {
        visible: false,
        file: ''
    }

    handleOnChange = (e) => {
        console.log(e.target.files[0]);
        this.state.file = e.target.files[0]
    };

    onFinish = (values) => {
        const url = "/api/v1/customer/upload_csv";
        let formData = new FormData();
        formData.append('file', this.state.file);
        fetch(url, {
            method: "post",
            body: formData,
        })
            .then((data) => {
                if (data.ok) {
                    this.handleCancel();

                    return data.json();
                }
                throw new Error("Network error.");
            })
            .then(() => {
                console.log("successful upload.");
                this.props.reloadCustomers();
            })
            .catch((err) => console.error("Error: " + err));
    };

    showModal = () => {
        this.setState({
            visible: true,
        });
    };

    handleCancel = () => {
        this.setState({
            visible: false,
        });
    };

    render() {
        return (
            <>
                <Button type="primary" onClick={this.showModal}>
                    Upload CSV
                </Button>

                <Modal
                    title="Add New Customer ..."
                    visible={this.state.visible}
                    onCancel={this.handleCancel}
                    footer={null}
                >
                    <Form ref={this.formRef} layout="vertical" onFinish={this.onFinish} encType="multipart/form-data">
                        <input
                            type={"file"}
                            name="file"
                            id={"csvFileInput"}
                            accept={".csv"}
                            onChange={this.handleOnChange}
                            value={this.state.file}
                        />

                        <Form.Item>
                            <Button type="primary" htmlType="submit">
                                Submit
                            </Button>
                        </Form.Item>
                    </Form>
                </Modal>
            </>
        );
    }
}

export default AddCustomerModal;
