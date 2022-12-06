<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBrand.aspx.cs" Inherits="mServerProject.ViewBrand" %>

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

        $(document).ready(function () {
            //GetBrands();
        });

        function GetBrands1() {
            $.ajax({
                type: "POST",
                url: '/ViewBrand.aspx/GetBrands',
                data: {},
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined) {
                        var jsondata = JSON.parse(data.d);
                        if (jsondata.results != null && jsondata.results != undefined && jsondata.results != "") {
                            for (let i = 0; i < jsondata.results.length; i++) {
                                $("#lbltesting").text(jsondata.results[i].id);
                            }
                        }
                    }
                    else {
                        console.log(jsondata);
                    }
                    console.log(jsondata);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function GetBrandDetails(brdid) {
            sessionStorage.setItem("brdid", brdid);
            //$.session.set("brdid", brdid);
            window.location = "/ViewBrandDetails";
        }

    </script>


    <script type="text/javascript">

        var pageSize = 10;
        var currentPageIndex = 0;
        var pageCount = 0;

        var startItemIndex = 0;
        var itemsToDisplay = 0;

        function PaginateSetPageObjects() {
            $('#pageTitle').text('Page ' + (currentPageIndex + 1) + ' of ' + pageCount);

            if (pageCount <= 1) {
                $('#nextPage').hide();
                $('#previousPage').hide();
                $('#lastPage').hide();
                $('#firstPage').hide();
            } else {
                $('#nextPage').show();
                $('#previousPage').show();
                $('#lastPage').show();
                $('#firstPage').show();

                if (currentPageIndex == 0) {
                    $('#previousPage').hide();
                    $('#firstPage').hide();
                } else if (currentPageIndex == (pageCount - 1)) {
                    $('#nextPage').hide();
                    $('#lastPage').hide();
                }
            }
        }

        function PaginateCalculatePageIndexes(length) {
            pageCount = 1;

            if (length > pageSize) {
                if (length / pageSize > parseInt(length / pageSize)) {
                    pageCount = parseInt(length / pageSize) + 1;
                } else {
                    pageCount = length / pageSize;
                }
            }
            startItemIndex = currentPageIndex * pageSize;
            var remainingItems = length - startItemIndex;
            itemsToDisplay = pageSize + startItemIndex;

            if (remainingItems < pageSize) {
                itemsToDisplay = remainingItems + startItemIndex;
            }
        }

        function displayObjects() {

            var strdata = "";

            $.ajax({
                type: "POST",
                url: '/ViewBrand.aspx/GetBrands',
                data: {},
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined) {
                        var jsondata = JSON.parse(data.d);
                        if (jsondata.results != null && jsondata.results != undefined && jsondata.results != "") {
                            $("tbody#contentContainer").find("tr").remove().end();
                            strdata += "<tr>";
                            for (let i = 0; i < jsondata.results.length; i++) {
                                strdata += "<td>" + jsondata.results[i].name + "</td>";
                                strdata += "<td>" + jsondata.results[i].legalName + "</td>";
                                strdata += "<td>" + jsondata.results[i].type + "</td>";
                                strdata += "<td>" + jsondata.results[i].countryCode + "</td>";
                                strdata += "<td>" + jsondata.results[i].supportEmail + "</td>";
                                strdata += "<td>" + jsondata.results[i].createdDate + "</td>";
                                strdata += "<td><a class='btn btn-primary btn-xs' id='lnkbtnview' href='javascript:void(0)' onClick='GetBrandDetails(`" + jsondata.results[i].id + "`)'><span class='glyphicon glyphicon-eye'></span>&nbsp;View</a></td>";
                            }
                            strdata += "</tr>";
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

        function moveFirstPage() { currentPageIndex = 0; displayObjects(); }
        function moveLastPage() { currentPageIndex = pageCount - 1; displayObjects(); }
        function movePreviousPage() { currentPageIndex--; displayObjects(); }
        function moveNextPage() { currentPageIndex++; displayObjects(); }

        $(document).ready(function () {
            displayObjects();
        });

    </script>

</asp:Content>
