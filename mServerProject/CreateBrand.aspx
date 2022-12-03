<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBrand.aspx.cs" Inherits="mServerProject.CreateBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /*custom css for input*/

        input, select, textarea {
            max-width: none;
        }

        /* Latest compiled and minified CSS included as External Resource*/

        /* Optional theme */

        /*@import url('//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css');*/
        body {
            margin-top: 30px;
        }

        .stepwizard-step p {
            margin-top: 0px;
            color: #666;
        }

        .stepwizard-row {
            display: table-row;
        }

        .stepwizard {
            display: table;
            width: 60%;
            position: relative;
            margin: auto;
        }

        .stepwizard-step button[disabled] {
            /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
        }

        .stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
            opacity: 1 !important;
            color: #bbb;
        }

        .stepwizard-row:before {
            top: 14px;
            bottom: 0;
            position: absolute;
            content: " ";
            width: 54%;
            height: 1px;
            background-color: #ccc;
            z-index: 0;
            left: 72px;
        }

        .stepwizard-step {
            display: table-cell;
            text-align: center;
            position: relative;
        }

        .btn-circle {
            width: 30px;
            height: 30px;
            text-align: center;
            padding: 6px 0;
            font-size: 12px;
            line-height: 1.428571429;
            border-radius: 15px;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <h2 style="padding: 10px 12px;">Create Brand</h2>
            <div class="container">
                <div class="panel panel-default setup-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Brand Details</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Name *</label>
                                    <asp:TextBox required runat="server" ID="txtName" class="form-control" MaxLength="100"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Website *</label>
                                    <asp:TextBox required runat="server" ID="txtWebsite" class="form-control" MaxLength="255"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Type *</label>
                                    <asp:DropDownList runat="server" ID="ddlType" class="form-control" required>
                                        <asp:ListItem Text="TENDLC_NON_PROFIT" Value="TENDLC_NON_PROFIT"></asp:ListItem>
                                        <asp:ListItem Text="TENDLC_GOVERNMENT" Value="TENDLC_GOVERNMENT"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Legal Company Name</label>
                                    <asp:TextBox runat="server" ID="txtLegalName" class="form-control" MaxLength="255"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>City *</label>
                                    <asp:TextBox required runat="server" ID="txtCity" class="form-control" MaxLength="255"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>State</label>
                                    <asp:TextBox runat="server" ID="txtState" class="form-control" MaxLength="255"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Address/Street *</label>
                                    <asp:TextBox required runat="server" ID="txtStreet" class="form-control" MaxLength="100"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Zip Code *</label>
                                    <asp:TextBox required runat="server" ID="txtZipCode" class="form-control" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Country of Registration *</label>
                                    <asp:DropDownList runat="server" ID="ddlCountry" class="form-control" required>
                                        <asp:ListItem Text="United State" Value="US"></asp:ListItem>
                                        <asp:ListItem Text="Austria" Value="AU"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Vertical Type *</label>
                                    <asp:DropDownList runat="server" ID="ddlVertical" class="form-control" required>
                                        <asp:ListItem Text="AGRICULTURE" Value="AGRICULTURE"></asp:ListItem>
                                        <asp:ListItem Text="CONSTRUCTION AND MATERIALS" Value="CONSTRUCTION_AND_MATERIALS"></asp:ListItem>
                                        <asp:ListItem Text="EDUCATION" Value="EDUCATION"></asp:ListItem>
                                        <asp:ListItem Text="ENERGY AND UTILITIES" Value="ENERGY_AND_UTILITIES"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tax Id *</label>
                                    <asp:TextBox runat="server" ID="txtTax" class="form-control" MaxLength="21" required></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel panel-default setup-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Contact Details</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email *</label>
                                    <asp:TextBox runat="server" ID="txtEmail" class="form-control" MaxLength="100" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone *</label>
                                    <asp:TextBox runat="server" ID="txtPhone" class="form-control" MaxLength="16" required></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-right">
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

