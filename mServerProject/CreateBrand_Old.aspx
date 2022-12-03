<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateBrand_Old.aspx.cs" Inherits="mServerProject.CreateBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        $(document).ready(function ()
        {

            var navListItems = $('div.setup-panel div a'),
                allWells = $('.setup-content'),
                allNextBtn = $('.nextBtn');

            allWells.hide();

            navListItems.click(function (e)
            {
                e.preventDefault();
                var $target = $($(this).attr('href')),
                    $item = $(this);

                if (!$item.hasClass('disabled'))
                {
                    navListItems.removeClass('btn-success').addClass('btn-default');
                    $item.addClass('btn-success');
                    allWells.hide();
                    $target.show();
                    $target.find('input:eq(0)').focus();
                }
            });

            allNextBtn.click(function ()
            {
                var curStep = $(this).closest(".setup-content"),
                    curStepBtn = curStep.attr("id"),
                    nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                    curInputs = curStep.find("input[type='text'],input[type='url']"),
                    isValid = true;

                $(".form-group").removeClass("has-error");
                for (var i = 0; i < curInputs.length; i++)
                {
                    if (!curInputs[i].validity.valid)
                    {
                        isValid = false;
                        $(curInputs[i]).closest(".form-group").addClass("has-error");
                    }
                }

                if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
            });

            $('div.setup-panel div a.btn-success').trigger('click');
        });
    </script>

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

            <div class="container">
                <div class="stepwizard">
                    <div class="stepwizard-row setup-panel">
                        <div class="stepwizard-step col-xs-3">
                            <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                            <p><small>Brand Details</small></p>
                        </div>
                        <div class="stepwizard-step col-xs-3">
                            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                            <p><small>Brand Relationship</small></p>
                        </div>
                        <div class="stepwizard-step col-xs-3">
                            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                            <p><small>Contact Details</small></p>
                        </div>
                    </div>
                </div>

                <form role="form">
                    <div class="panel panel-default setup-content" id="step-1">
                        <div class="panel-heading">
                            <h3 class="panel-title">Brand Details</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Lega Company Name *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>DBA or Brand Name, if different from legal name  *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>What type of legal form is the organization? *</label>
                                        <select class="form-control">
                                            <option>Publically Traded Company</option>
                                            <option>Private Company</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Country of Registration *</label>
                                        <select class="form-control">
                                            <option>United State</option>
                                            <option>Austria</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Tax Number/ID/EIN *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Tax Number/ID/EIN Issuing Country</label>
                                        <select class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Lega Company Name *</label>
                                        <div class="form-group">
                                            <label>Tax Number/ID/EIN Issuing Country</label>
                                            <select class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>DUNS or GIIN or LEI Number*</label>
                                        <select class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>DUNS or GIIN or LEI Number</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Address/Street *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>City *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>State *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Zip Code *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Country</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Website/Online Presence</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stock Symbol</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stock Exchange</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Vertical Type *</label>
                                        <select class="form-control">
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Reference ID</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>

                            </div>
                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                        </div>
                    </div>

                    <div class="panel panel-default setup-content" id="step-2">
                        <div class="panel-heading">
                            <h3 class="panel-title">Brand Relationship</h3>
                        </div>
                        <div class="panel-body">
                            <%--We will calculate brand relationship, no need to give option to client for selection--%>
                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                        </div>
                    </div>

                    <div class="panel panel-primary setup-content" id="step-3">
                        <div class="panel-heading">
                            <h3 class="panel-title">Contact Details</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Support Email Address *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><%--add icon based of selected country--%> Support Phone Number *</label>
                                        <input class="form-control" type="text" name="name" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                        </div>
                    </div>


                </form>
            </div>


            <%--<section class="signup-step-container">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-8">
                            <div class="wizard">
                                <div class="wizard-inner">
                                    <div class="connecting-line"></div>
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active">
                                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" aria-expanded="true"><span class="round-tab">1 </span><i>Step 1</i></a>
                                        </li>
                                        <li role="presentation" class="disabled">
                                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" aria-expanded="false"><span class="round-tab">2</span> <i>Step 2</i></a>
                                        </li>
                                        <li role="presentation" class="disabled">
                                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab"><span class="round-tab">3</span> <i>Step 3</i></a>
                                        </li>
                                        <li role="presentation" class="disabled">
                                            <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab"><span class="round-tab">4</span> <i>Step 4</i></a>
                                        </li>
                                    </ul>
                                </div>

                                <form role="form" action="index.html" class="login-box">
                                    <div class="tab-content" id="main_form">
                                        <div class="tab-pane active" role="tabpanel" id="step1">
                                            <h4 class="text-center">Step 1</h4>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>First and Last Name *</label>
                                                        <input class="form-control" type="text" name="name" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone Number  *</label>
                                                        <input class="form-control" type="text" name="name" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email Address *</label>
                                                        <input class="form-control" type="email" name="name" placeholder="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Password *</label>
                                                        <input class="form-control" type="password" name="name" placeholder="">
                                                    </div>
                                                </div>


                                            </div>
                                            <ul class="list-inline pull-right">
                                                <li>
                                                    <button type="button" class="default-btn next-step">Continue to next step</button></li>
                                            </ul>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="step2">
                                            <h4 class="text-center">Step 2</h4>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Address 1 *</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>City / Town *</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Country *</label>
                                                    <select name="country" class="form-control" id="country">
                                                        <option value="NG" selected="selected">Nigeria</option>
                                                        <option value="NU">Niue</option>
                                                        <option value="NF">Norfolk Island</option>
                                                        <option value="KP">North Korea</option>
                                                        <option value="MP">Northern Mariana Islands</option>
                                                        <option value="NO">Norway</option>
                                                    </select>
                                                </div>
                                            </div>



                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Registration No.</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>



                                            <ul class="list-inline pull-right">
                                                <li>
                                                    <button type="button" class="default-btn prev-step">Back</button></li>
                                                <li>
                                                    <button type="button" class="default-btn next-step skip-btn">Skip</button></li>
                                                <li>
                                                    <button type="button" class="default-btn next-step">Continue</button></li>
                                            </ul>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="step3">
                                            <h4 class="text-center">Step 3</h4>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Account Name *</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Demo</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Inout</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Information</label>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="customFile">
                                                        <label class="custom-file-label" for="customFile">Select file</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Number *</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Input Number</label>
                                                    <input class="form-control" type="text" name="name" placeholder="">
                                                </div>
                                            </div>
                                            <ul class="list-inline pull-right">
                                                <li>
                                                    <button type="button" class="default-btn prev-step">Back</button></li>
                                                <li>
                                                    <button type="button" class="default-btn next-step skip-btn">Skip</button></li>
                                                <li>
                                                    <button type="button" class="default-btn next-step">Continue</button></li>
                                            </ul>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="step4">
                                            <h4 class="text-center">Step 4</h4>
                                            <div class="all-info-container">
                                                <div class="list-content">
                                                    <a href="#listone" data-toggle="collapse" aria-expanded="false" aria-controls="listone">Collapse 1 <i class="fa fa-chevron-down"></i></a>
                                                    <div class="collapse" id="listone">
                                                        <div class="list-box">
                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>First and Last Name *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Phone Number *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="list-content">
                                                    <a href="#listtwo" data-toggle="collapse" aria-expanded="false" aria-controls="listtwo">Collapse 2 <i class="fa fa-chevron-down"></i></a>
                                                    <div class="collapse" id="listtwo">
                                                        <div class="list-box">
                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Address 1 *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>City / Town *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Country *</label>
                                                                        <select name="country2" class="form-control" id="country2" disabled="disabled">
                                                                            <option value="NG" selected="selected">Nigeria</option>
                                                                            <option value="NU">Niue</option>
                                                                            <option value="NF">Norfolk Island</option>
                                                                            <option value="KP">North Korea</option>
                                                                            <option value="MP">Northern Mariana Islands</option>
                                                                            <option value="NO">Norway</option>
                                                                        </select>
                                                                    </div>
                                                                </div>



                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Legal Form</label>
                                                                        <select name="legalform2" class="form-control" id="legalform2" disabled="disabled">
                                                                            <option value="" selected="selected">-Select an Answer-</option>
                                                                            <option value="AG">Limited liability company</option>
                                                                            <option value="GmbH">Public Company</option>
                                                                            <option value="GbR">No minimum capital, unlimited liability of partners, non-busines</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Business Registration No.</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Registered</label>
                                                                        <select name="vat2" class="form-control" id="vat2" disabled="disabled">
                                                                            <option value="" selected="selected">-Select an Answer-</option>
                                                                            <option value="yes">Yes</option>
                                                                            <option value="no">No</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Seller</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Company Name *</label>
                                                                        <input class="form-control" type="password" name="name" placeholder="" disabled="disabled">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="list-content">
                                                    <a href="#listthree" data-toggle="collapse" aria-expanded="false" aria-controls="listthree">Collapse 3 <i class="fa fa-chevron-down"></i></a>
                                                    <div class="collapse" id="listthree">
                                                        <div class="list-box">
                                                            <div class="row">

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Name *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="">
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label>Number *</label>
                                                                        <input class="form-control" type="text" name="name" placeholder="">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <ul class="list-inline pull-right">
                                                <li>
                                                    <button type="button" class="default-btn prev-step">Back</button></li>
                                                <li>
                                                    <button type="button" class="default-btn next-step">Finish</button></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>
        </div>
    </div>
</asp:Content>

