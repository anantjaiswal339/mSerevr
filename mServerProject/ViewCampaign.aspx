<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCampaign.aspx.cs" Inherits="mServerProject.ViewCampaign" %>

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
                    <%--<table id="recordNav" class="table table-bordred table-striped table-hover">
                        <tr>
                            <td nowrap="nowrap"><a href="javascript:void(0);" onclick="moveFirstPage()" id="firstPage">
                                <img src="/Content/first.png" alt="" /></a></td>
                            <td nowrap="nowrap"><a href="javascript:void(0);" onclick="movePreviousPage()" id="previousPage">
                                <img src="/Content/previous.png" alt="" /></a></td>
                            <td id="pageTitle"></td>
                            <td nowrap="nowrap"><a href="javascript:void(0);" onclick="moveNextPage()" id="nextPage">
                                <img src="/Content/next.png" alt="" /></a></td>
                            <td nowrap="nowrap"><a href="javascript:void(0);" onclick="moveLastPage()" id="lastPage">
                                <img src="/Content/last.png" alt="" /></a></td>
                        </tr>
                    </table>--%>
                    <table class="table table-bordred table-striped table-hover">
                        <thead>
                            <tr>
                                <th nowrap="nowrap">Name</th>
                                <th nowrap="nowrap">Type</th>
                                <th nowrap="nowrap">Confirmation  Message</th>
                                <th nowrap="nowrap">Help Message</th>
                                <th nowrap="nowrap">Program Summary</th>
                                <th nowrap="nowrap">Stop Message</th>
                                <th nowrap="nowrap">View</th>
                                <%--<th nowrap="nowrap">Campaigns</th>
                                <th nowrap="nowrap">Status</th>--%>
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
            //GetCampaignDetails();
        });

        function GetCampaignDetails(camid) {
            sessionStorage.setItem("camid", camid);
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
                url: '/ViewCampaign.aspx/GetCampaign',
                data: {},
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined) {
                        var jsondata = JSON.parse(JSON.parse(data.d));
                        if (jsondata.results != null && jsondata.results != undefined && jsondata.results != "") {
                            $("tbody#contentContainer").find("tr").remove().end();
                            strdata += "<tr>";
                            for (let i = 0; i < jsondata.results.length; i++) {
                                strdata += "<td>" + jsondata.results[i].name + "</td>";
                                strdata += "<td>" + jsondata.results[i].type + "</td>";
                                strdata += "<td>" + jsondata.results[i].confirmationMessage + "</td>";
                                strdata += "<td>" + jsondata.results[i].helpMessage + "</td>";
                                strdata += "<td>" + jsondata.results[i].programSummary + "</td>";
                                strdata += "<td>" + jsondata.results[i].stopMessage + "</td>";
                                strdata += "<td><a class='btn btn-primary btn-xs' id='lnkbtnview' href='javascript:void(0)' onClick='GetCampaignDetails(`" + jsondata.results[i].id + "`)'><span class='glyphicon glyphicon-eye'></span>&nbsp;View</a></td>";
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
