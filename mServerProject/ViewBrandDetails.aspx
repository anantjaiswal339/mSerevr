<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBrandDetails.aspx.cs" Inherits="mServerProject.ViewBrandDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .martop {
            margin-top: 30px;
        }

        table.table-user-information td {
            border: none !important;
        }
    </style>

    <div class="container">
        <div class="row martop">

            <div class="col-md-12">
                <div class="pull-left">
                    <h3>Brand Details</h3>
                </div>
                <div class="pull-right">
                    <a href="/Brands.aspx" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-backward"></i>&nbsp;Back To Brands</a>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <label id="lblmsg" class="label label-danger" style="display: none;">alert message</label>
        
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Brand Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-10 col-lg-9" id="divbrddt">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>Name :</b></td>
                                            <td>
                                                <label id="lblcmpname"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Legal Name :</b></td>
                                            <td>
                                                <label id="lbllegname"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Email :</b></td>
                                            <td>
                                                <label id="lblbrandemail"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Website :</b></td>
                                            <td>
                                                <label id="lblwebsiteurl"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Phone :</b></td>
                                            <td>
                                                <label id="lblbrandpone">Kathmandu,Nepal</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Country :</b></td>
                                            <td>
                                                <label id="lblcntofreg"></label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><b>Address Line 1 :</b></td>
                                            <td>
                                                <label id="lbladdresssline"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Zip Code :</b></td>
                                            <td>
                                                <label id="lblzipcode"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>State :</b></td>
                                            <td>
                                                <label id="lblstate"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>City :</b></td>
                                            <td>
                                                <label id="lblcity"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Vertical :</b></td>
                                            <td>
                                                <label id="lblorganization"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>EIN - Employer Identification Number :</b></td>
                                            <td>
                                                <label id="lblidentificationno"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Identity :</b></td>
                                            <td>
                                                <label id="lblIdentity"></label>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Brand Vetting</h3>
                    </div>
                    <div class="panel-body">

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Vetting Type
                                    </th>
                                    <th>Vetting Partner
                                    </th>
                                    <th>Vetting On
                                    </th>
                                    <th>Vetting Outcome
                                    </th>
                                    <th>Vetting Id
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Associated Campaign</h3>
                    </div>
                    <div class="panel-body">

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Campaign ID
                                    </th>
                                    <th>Campaign Description
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            // To Read
            $(function () {
                var brdid = sessionStorage.getItem("brdid");
                if (brdid != null && brdid != undefined && brdid != "") {
                    Displaybranddetails(brdid);
                }
            });
        });

        function Displaybranddetails(brandId) {

            $.ajax({
                type: "POST",
                url: '/ViewBrandDetails.aspx/BindBrandDetails',
                data: JSON.stringify({ "brandId": brandId }),
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data)
                    if (data.d.StatusCode == 200) {
                        var jsondata = data.d.Data;
                        if (jsondata != null && jsondata != undefined && jsondata != "") {
                            $("#divbrddt").show();
                            $("#lblcmpname").text(jsondata.name);
                            $("#lbllegname").text(jsondata.legalName);
                            $("#lblbrandemail").text(jsondata.supportEmail);
                            $("#lblwebsiteurl").text(jsondata.website);
                            $("#lblbrandpone").text(jsondata.supportPhone);
                            $("#lblcntofreg").text(jsondata.countryCode);
                            $("#lbladdresssline").text(jsondata.address.street);
                            $("#lblzipcode").text(jsondata.address.zipcode);
                            $("#lblstate").text(jsondata.address.state);
                            $("#lblcity").text(jsondata.address.city);
                            $("#lblorganization").text(jsondata.vertical);
                            $("#lblidentificationno").text(jsondata.taxId);
                        }
                        else {
                            $("#lblmsg").show();
                            $("#divbrddt").hide();
                        }
                    }
                    else {
                        strdata += "<tr><td colspan='2'>No data found.</td></tr>";
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error(textStatus, errorThrown);
                }
            });
        }

    </script>

</asp:Content>
