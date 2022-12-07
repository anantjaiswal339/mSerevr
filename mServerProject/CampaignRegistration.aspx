<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CampaignRegistration.aspx.cs" Inherits="mServerProject.CampaignRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .martop {
            margin-top: 30px;
        }
        /*custom css for input*/

        input, select, textarea {
            max-width: none;
        }
    </style>

    <style type="text/css">
        @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
        @import url('https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700');
        @import url('https://fonts.googleapis.com/css?family=Slabo+27px');
        @import url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700');

        a, a:hover, a:focus {
            outline: none;
            text-decoration: none;
        }

        body {
            font-family: 'Open Sans', sans-serif;
        }

        h2 {
            float: left;
            width: 100%;
            color: #fff;
            margin-bottom: 30px;
            font-size: 14px;
        }

            h2 span {
                font-family: 'Libre Baskerville', serif;
                display: block;
                font-size: 45px;
                text-transform: none;
                margin-bottom: 20px;
                margin-top: 30px;
                font-weight: 700
            }

            h2 a {
                color: #fff;
                font-weight: bold;
            }


        section {
            float: left;
            width: 100%;
            background: #43cea2; /* fallback for old browsers */
            background: -webkit-linear-gradient(to left, #185a9d, #43cea2); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to left, #185a9d, #43cea2); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            padding: 30px 0;
        }

        .card {
            -moz-box-direction: normal;
            -moz-box-orient: vertical;
            background-color: #fff;
            border-radius: 0.25rem;
            display: flex;
            flex-direction: column;
            position: relative;
            margin-bottom: 3px;
            border: none;
        }

        .card-header:first-child {
            border-radius: 0;
        }

        .card-header {
            background-color: #f7f7f9;
            margin-bottom: 0;
            padding: 20px 1.25rem;
            border: none;
        }

            .card-header a i {
                float: left;
                font-size: 25px;
                padding: 5px 0;
                margin: 0 25px 0 0px;
                color: #195C9D;
            }

            .card-header i {
                float: right;
                font-size: 30px;
                width: 1%;
                margin-top: 8px;
                margin-right: 10px;
            }

            .card-header a {
                width: 97%;
                float: left;
                color: #565656;
            }

            .card-header p {
                margin: 0;
            }

            .card-header h3 {
                margin: 0 0 0px;
                font-size: 20px;
                font-family: 'Slabo 27px', serif;
                font-weight: bold;
                color: #3fc199;
            }

        .card-block {
            -moz-box-flex: 1;
            flex: 1 1 auto;
            padding: 20px;
            color: #232323;
            box-shadow: inset 0px 4px 5px rgba(0,0,0,0.1);
            border-top: 1px soild #000;
            border-radius: 0;
        }

        .radio-css input {
            margin-right: 8px;
        }

        .radio-css label {
            margin-right: 14px;
        }
    </style>


    <div class="container">
        <div class="row martop">
            <div class="col-md-12 offset-md-2">
                <div class="bd-example" data-example-id="">
                    <div id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <div class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                                        <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                        <h3>Campaign Information</h3>
                                        <p>Fill in all settings to register your campagin.</p>
                                    </a>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </div>
                            </div>

                            <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="">
                                <div class="card-block">
                                    <div class="row">
                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Select a Brand *</label>
                                            <asp:DropDownList runat="server" ID="ddlBrand" CssClass="form-control input-sm" required>
                                                <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Select a Use Case That Best Matches Your Messaging Campaing *</label>
                                            <asp:DropDownList runat="server" ID="ddlUseCase" CssClass="form-control input-sm" required>
                                                <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                                                <asp:ListItem Text="ALERTS" Value="ALERTS"></asp:ListItem>
                                                <asp:ListItem Text="CHAT" Value="CHAT"></asp:ListItem>
                                                <asp:ListItem Text="DONATION" Value="DONATION"></asp:ListItem>
                                                <asp:ListItem Text="EDUCATION" Value="EDUCATION"></asp:ListItem>
                                                <asp:ListItem Text="FRAUD_ALERTS" Value="FRAUD_ALERTS"></asp:ListItem>
                                                <asp:ListItem Text="PROMOTIONAL_MARKETING" Value="PROMOTIONAL_MARKETING"></asp:ListItem>
                                                <asp:ListItem Text="PUBLIC_SERVICE_ANNOUNCEMENT" Value="PUBLIC_SERVICE_ANNOUNCEMENT"></asp:ListItem>
                                                <asp:ListItem Text="SWEEPSTAKES_CONTEST" Value="SWEEPSTAKES_CONTEST"></asp:ListItem>
                                                <asp:ListItem Text="TWO_FACTOR_AUTH" Value="TWO_FACTOR_AUTH"></asp:ListItem>
                                                <asp:ListItem Text="VOTING_POLLING" Value="VOTING_POLLING"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Campaing Name *</label>
                                            <asp:TextBox required runat="server" ID="txtName" class="form-control" MaxLength="30" placeholder="Campaing Name"></asp:TextBox>
                                        </div>

                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">URL To Your Terms & Conditions *</label>
                                            <asp:TextBox required runat="server" ID="txtTAndC" class="form-control" MaxLength="255" placeholder="URL To Your Terms & Conditions"></asp:TextBox>
                                        </div>


                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Campaing Description *</label>
                                            <asp:TextBox Height="115" required runat="server" ID="txtCampaingDescription" class="form-control" MaxLength="255" placeholder="Campaing Description" TextMode="MultiLine"></asp:TextBox>
                                            <span class="help-block">Text Should be longer then 40 characters!</span>
                                        </div>
                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Sample Message *</label>
                                            <asp:TextBox Height="115" required runat="server" ID="txtSampleMessage" class="form-control" placeholder="Sample Message" TextMode="MultiLine"></asp:TextBox>
                                            <span class="help-block">Text Should be longer then 20 characters!</span>
                                        </div>

                                        <div class="form-group col-md-6 col-sm-6">
                                            <label for="years">Message Type *</label>
                                            <asp:DropDownList></asp:DropDownList>
                                            <asp:ListBox runat="server" ID="lblMessageType" SelectionMode="multiple" CssClass="form-control">
                                                <asp:ListItem Text="SMS" Value="SMS" />
                                                <asp:ListItem Text="MMS" Value="MMS" />
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree">
                                <div class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                                        <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                        <h3>Opt-in Opt-out Methods</h3>
                                        <p>Select how end users will opt in.</p>
                                    </a>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" aria-expanded="false">
                                <div class="card-block">
                                    <div class="row">
                                        <div class="form-group col-md-12 col-sm-12">
                                            <label for="years">Will Your Campaing Send Fewer Then 30 Messages Per Minute And Fewer *</label>

                                            <div class="form-group col-md-12 col-sm-12">
                                                <asp:RadioButtonList required ID="rblOptIn" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="radio-css">
                                                    <asp:ListItem Value="Keyword">Keyword</asp:ListItem>
                                                    <asp:ListItem Value="InteractiveVoiceResponse">Intractive Voice Response</asp:ListItem>
                                                    <asp:ListItem Value="Verbal">Verbal</asp:ListItem>
                                                    <asp:ListItem Value="Website">Website</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="row" id="divKeyword">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="years">Keyword *</label>
                                                        <asp:TextBox required runat="server" ID="txtKeyword" class="form-control" MaxLength="30" placeholder="Comma Saprated Keywords"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" id="divUrl">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="years">Url *</label>
                                                        <asp:TextBox required runat="server" ID="txtUrl" class="form-control" MaxLength="30" placeholder="Url"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="years">Auto Responder Message *</label>
                                                        <asp:TextBox Height="60" required runat="server" ID="txtAutoMessage" class="form-control" placeholder="Auto Responder Message" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="years">Opt-out / Stop Message *</label>
                                                        <asp:TextBox Height="60" required runat="server" ID="txtStopMessage" class="form-control" placeholder="Opt-out / Stop Message" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="years">Confirmation Message *</label>
                                                        <asp:TextBox Height="60" required runat="server" ID="txtConfirmationMessage" class="form-control" placeholder="Confirmation Message" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne">
                                <div class="mb-0">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                                        <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                        <h3>Help / Support contact information.</h3>
                                    </a>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="">
                                <div class="card-block">
                                    <div class="form-group col-md-6 col-sm-6">
                                        <label for="years">Help / Support Email Address *</label>
                                        <asp:TextBox required runat="server" ID="txtSupportEmail" class="form-control" MaxLength="30" placeholder="Support Email Address"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6 col-sm-6">
                                        <label for="years">Help / Support Number *</label>
                                        <asp:TextBox required runat="server" ID="txtSupportNumber" class="form-control" MaxLength="30" placeholder="Support Number"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label for="years">Help / Support Message *</label>
                                            <asp:TextBox Height="60" required runat="server" ID="txtSupportMessage" class="form-control" placeholder="Support Message" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-group col-md-12 col-sm-12">
                        <div class="text-right">
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            <%--<button class="btn btn-large btn-danger" type="button">Cancel </button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="radio"]').click(function () {
                $('#divKeyword').hide();
                $('#divUrl').hide();
                $('#MainContent_txtKeyword').prop('required', false);
                $('#MainContent_txtUrl').prop('required', false);

                if ($(this).attr('value') == 'Keyword') {
                    $('#divKeyword').show();
                    $('#MainContent_txtKeyword').prop('required', true);
                }
                if ($(this).attr('value') == 'Website') {
                    $('#divUrl').show();
                    $('#MainContent_txtUrl').prop('required', true);
                }
            });
        });
    </script>

</asp:Content>
