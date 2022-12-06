﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCampaignDetails.aspx.cs" Inherits="mServerProject.ViewCampaignDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .martop {
            margin-top: 30px;
        }
    </style>

    <div class="container">
        <div class="row martop">

            <div class="col-md-12">
                <div class="pull-right">
                    <a href="/CreateBrand" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>&nbsp;Add Brand</a>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <label id="lblmsg" class="label label-danger" style="display: none;">alert message</label>
                <br />
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Brand Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-6 col-lg-6" id="divbrddt">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>Brand :</b></td>
                                            <td>
                                                <label id="lblcmpname"></label>
                                        </tr>
                                        <tr>
                                            <td><b>Use Case :</b></td>
                                            <td>
                                                <label id="lbllegname"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Requires ThorughPut Less Then 30 Message Per Minute Upto 2000 Message A day :</b></td>
                                            <td>
                                                <label id="lblbrandemail"></label>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Name :</b></td>
                                            <td>
                                                <label id="lblwebsiteurl"></label>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Description :</b></td>
                                            <td>
                                                <label id="lblbrandpone">Kathmandu,Nepal</label>
                                        </tr>
                                        <tr>
                                            <td><b>Campaign Registry :</b></td>
                                            <td>
                                                <label id="lblcntofreg"></label>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            // To Read
            $(function () {
                var camid = sessionStorage.getItem("camid");
                if (camid != null && camid != undefined && camid != "") {
                    DisplayCampaignetails(camid);
                }
            });
            //DisplayCampaignetails();
        });

        function DisplayCampaignetails(brandId) {

            $.ajax({
                type: "POST",
                url: '/ViewBrandDetails.aspx/BindBrandDetails',
                data: JSON.stringify({ "brandId": brandId }),
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined && data != "") {
                        var jsondata = JSON.parse(JSON.parse(data.d));
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
                        $("#lblmsg").text("No data found.");
                        $("#divbrddt").hide();
                    }
                    //console.log(jsondata);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }

    </script>

</asp:Content>