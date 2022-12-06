<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBrandDetails.aspx.cs" Inherits="mServerProject.ViewBrandDetails" %>

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
                            <%--<div class="col-md-3 col-lg-3 " align="center">
                                <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive">
                            </div>--%>

                            <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                            <div class=" col-md-6 col-lg-6" id="divbrddt">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>Brand :</b></td>
                                            <td>
                                                <label id="lblcmpname"></label>
                                                <%--<asp:Label runat="server" ID="lblcmpname">Programming</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Use Case :</b></td>
                                            <td>
                                                <label id="lbllegname"></label>
                                                <%--<asp:Label runat="server" ID="lbllegname">Legal Name</asp:Label>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Requires ThorughPut Less Then 30 Message Per Minute Upto 2000 Message A day :</b></td>
                                            <td>
                                                <label id="lblbrandemail"></label>
                                                <%--<asp:Label runat="server" ID="lblbrandemail">Email Address</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Name :</b></td>
                                            <td>
                                                <label id="lblwebsiteurl"></label>
                                                <%--<asp:Label runat="server" ID="lblwebsiteurl">www.google.com</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Description :</b></td>
                                            <td>
                                                <label id="lblbrandpone">Kathmandu,Nepal</label>
                                                <%--<asp:Label runat="server" ID="Label1">Kathmandu,Nepal</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Campaign Registry :</b></td>
                                            <td>
                                                <label id="lblcntofreg"></label>
                                                <%--<asp:Label runat="server" ID="lblcntofreg">Us</asp:Label>--%></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <%--<a href="#" class="btn btn-primary">My Sales Performance</a>
                                <a href="#" class="btn btn-primary">Team Sales Performance</a>--%>
                            </div>

                            <div class=" col-md-6 col-lg-6">
                                <table class="table table-user-information">
                                    <tbody>
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
                                                <%--<asp:Label runat="server" ID="lblzipcode">394210</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>State :</b></td>
                                            <td>
                                                <label id="lblstate"></label>
                                                <%--<asp:Label runat="server" ID="lblstate">NJ</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>City :</b></td>
                                            <td>
                                                <label id="lblcity"></label>
                                                <%--<asp:Label runat="server" ID="lblcity">Parsippany</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>What Type Of Legle Entity Is The Organization? :</b></td>
                                            <td>
                                                <label id="lblorganization"></label>
                                                <%--<asp:Label runat="server" ID="lblorganization">Private-Company</asp:Label>--%></td>
                                        </tr>
                                        <tr>
                                            <td><b>Ein - Employer Identification Number :</b></td>
                                            <td>
                                                <label id="lblidentificationno"></label>
                                                <%--<asp:Label runat="server" ID="lblidentificationno">22-2074593</asp:Label>--%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <%--<div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>--%>
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
                //alert($.session.get("brdid"));
            });
            //Displaybranddetails();
        });

        function Displaybranddetails(brandId) {

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
