<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="mServerProject.Brands" %>

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
                <br>
                <div class="table-responsive">
                    <table class="table table-bordred table-striped table-hover">
                        <thead>
                            <tr>
                                <th nowrap="nowrap">Name</th>
                                <th nowrap="nowrap">Legal Name</th>
                                <th nowrap="nowrap">Type</th>
                                <th nowrap="nowrap">Country Code</th>
                                <th nowrap="nowrap">Support Email</th>
                                <th nowrap="nowrap">Created On</th>
                                <th nowrap="nowrap">View</th>
                            </tr>
                        </thead>
                        <tbody id="contentContainer"></tbody>
                    </table>
                    <div class="clearfix"></div>
                    <ul class="pagination pull-right" style="display: none">
                        <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                    </ul>
                </div>


            </div>

        </div>
    </div>

    <script type="text/javascript">

        var pageSize = 10;
        var currentPageIndex = 0;
        var pageCount = 0;

        var startItemIndex = 0;
        var itemsToDisplay = 0;

        function GetBrandDetails(brdid) {
            sessionStorage.setItem("brdid", brdid);
            //$.session.set("brdid", brdid);
            window.location = "/ViewBrandDetails";
        }

        function displayObjects() {

            var strdata = "";

            $.ajax({
                type: "POST",
                url: '/Brands.aspx/GetBrands',
                data: {},
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.d.StatusCode == 200) {
                        var jsondata = data.d.Data;
                        if (jsondata.results != null && jsondata.results != undefined && jsondata.results != "") {
                            $("tbody#contentContainer").find("tr").remove().end();
                            
                            for (let i = 0; i < jsondata.results.length; i++)
                            {
                                strdata += "<tr>";
                                strdata += "<td>" + jsondata.results[i].name + "</td>";
                                strdata += "<td>" + jsondata.results[i].legalName + "</td>";
                                strdata += "<td>" + jsondata.results[i].type + "</td>";
                                strdata += "<td>" + jsondata.results[i].countryCode + "</td>";
                                strdata += "<td>" + jsondata.results[i].supportEmail + "</td>";
                                strdata += "<td>" + new Date(parseInt(jsondata.results[i].createdDate.substr(6))).toDateString(); + "</td>";
                                strdata += "<td><a class='btn btn-primary btn-xs' id='lnkbtnview' href='javascript:void(0)' onClick='GetBrandDetails(`" + jsondata.results[i].id + "`)'><span class='glyphicon glyphicon-eye'></span>&nbsp;View</a></td>";
                                strdata += "</tr>";
                            }                            
                            $("#contentContainer").html(strdata);
                        }
                    }
                    else {
                        strdata += "<tr><td colspan='2'>No data found.</td></tr>";
                    }
                    console.log(jsondata);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }
   
        $(document).ready(function () {
            displayObjects();
        });

    </script>

</asp:Content>
