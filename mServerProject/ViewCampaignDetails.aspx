<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCampaignDetails.aspx.cs" Inherits="mServerProject.ViewCampaignDetails" %>

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
                    <a href="/CampaignRegistration" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>&nbsp;Add Campaign</a>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <label id="lblmsg" class="label label-danger" style="display: none;">alert message</label>
                <br />
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Campaign Information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-6 col-lg-6" id="divbrddt">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>Brand :</b></td>
                                            <td>
                                                <label id="lblbrand"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Use Case :</b></td>
                                            <td>
                                                <label id="lblusercase"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>URL To Your Terms & Conditions :</b></td>
                                            <td>
                                                <label id="lbltandc"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Name :</b></td>
                                            <td>
                                                <label id="lblcname"></label>
                                        </tr>
                                        <tr>
                                            <td><b>Camapign Description :</b></td>
                                            <td>
                                                <label id="lblcdesc"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Sample Message :</b></td>
                                            <td>
                                                <label id="lblsmessage"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Message Type :</b></td>
                                            <td>
                                                <label id="lblmessagetype"></label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <div class=" col-md-6 col-lg-6" id="divbrddt2">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td><b>Will Your Campaing Send Fewer Then 30 Messages Per Minute And Fewer :</b></td>
                                            <td>
                                                <label id="lblopt"></label>
                                            </td>
                                        </tr>
                                        <tr id="divkeyword">
                                            <td><b>Keyword :</b></td>
                                            <td>
                                                <label id="lblkeyword"></label>
                                            </td>
                                        </tr>
                                        <tr id="divurl">
                                            <td><b>Url :</b></td>
                                            <td>
                                                <label id="lblurl"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Auto Responder Message :</b></td>
                                            <td>
                                                <label id="lblautomsg"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Help / Support Email Address :</b></td>
                                            <td>
                                                <label id="lblsemail"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Help / Support Number :</b></td>
                                            <td>
                                                <label id="lblsnumber"></label>
                                            </td>
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

        function DisplayCampaignetails(campaignId) {

            $.ajax({
                type: "POST",
                url: '/ViewCampaignDetails.aspx/BindCampaignDetails',
                data: JSON.stringify({ "campaignId": campaignId }),
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined && data != "") {
                        var jsondata = JSON.parse(JSON.parse(data.d));
                        if (jsondata != null && jsondata != undefined && jsondata != "") {
                            $("#divbrddt").show();
                            GetBrandById(jsondata.brandId);
                            $("#lblusercase").text(jsondata.useCase);
                            $("#lbltandc").text(jsondata.termsAndConditionsUrl);
                            $("#lblcname").text(jsondata.name);
                            $("#lblcdesc").text(jsondata.programSummary);
                            if (jsondata.exampleMessages.length > 0) {
                                $("#lblsmessage").text(jsondata.exampleMessages[0]);
                            }
                            var msgType = "";
                            if (jsondata.messageTypes.length > 0) {
                                msgType = jsondata.messageTypes.join(", ");
                            }
                            $("#lblmessagetype").text(msgType);

                            $("#divkeyword").hide();
                            $("#divurl").hide();

                            var opt = "";
                            var callToAction = "";
                            if (jsondata.optIns.keyword) {
                                opt = "Keyword";
                                callToAction = jsondata.optIns.keyword.callToAction;
                                if (jsondata.optIns.keyword.keywords.length > 0) {
                                    $("#divkeyword").show();
                                    $("#lblkeyword").text(jsondata.optIns.keyword.keywords.join(", "));
                                }
                            } else if (jsondata.optIns.web) {
                                opt = "Web";
                                callToAction = jsondata.optIns.web.callToAction;
                                if (jsondata.optIns.web.url) {
                                    $("#divurl").show();
                                    $("#lblurl").text(jsondata.optIns.web.url);
                                }
                            } else if (jsondata.optIns.verbal) {
                                opt = "Verbal";
                                callToAction = jsondata.optIns.verbal.callToAction;
                            } else if (jsondata.optIns.interactiveVoiceResponse) {
                                opt = "Interactive Voice Response";
                                callToAction = jsondata.optIns.interactiveVoiceResponse.callToAction;
                            }
                            $("#lblopt").text(opt);
                            $("#lblautomsg").text(callToAction);

                            $("#lblstopmsg").text(jsondata.stopMessage);
                            $("#lblcmessage").text(jsondata.confirmationMessage);
                            $("#lblsemail").text(jsondata.customerCareEmail);
                            $("#lblsnumber").text(jsondata.customerCarePhone);
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
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }

        function GetBrandById(brandId) {
            $.ajax({
                type: "POST",
                url: '/ViewBrandDetails.aspx/BindBrandDetails',
                data: JSON.stringify({ "brandId": brandId }),
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data != undefined && data != "") {
                        var jsondata = JSON.parse(JSON.parse(data.d));
                        if (jsondata != null && jsondata != undefined && jsondata != "") {
                            $("#lblbrand").text(jsondata.name);
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        }

    </script>

</asp:Content>
