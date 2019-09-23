<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_makepayment.aspx.cs" Inherits="WebApplication4.frm_makepayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <!--  page header -->
            <div class="col-lg-12">
                <h1 class="page-header">
                    Make Payment</h1>
            </div>
            <!-- end  page header -->
        </div>
        <input type="hidden" runat="server" id="key" name="key" />
        <input type="hidden" runat="server" id="hash" name="hash" />
        <input type="hidden" runat="server" id="txnid" name="txnid" />
        <div class="row">
            <!--   Kitchen Sink -->
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Payment Details
                    </div>
                    <div class="panel-body">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>
                                    User Name</label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_docname" autocomplete="off" runat="server" TabIndex="1" CssClass="form-control"
                                    placeholder="User Name" ValidationGroup="add" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>
                                    Mobile No.</label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_mobile" autocomplete="off" runat="server" TabIndex="2" CssClass="form-control"
                                    MaxLength="10" placeholder="Mobile" ValidationGroup="add" ReadOnly="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                    ErrorMessage="Enter Mobile" ForeColor="Red" ControlToValidate="txt_mobile" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>
                                    Email</label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_email" autocomplete="off" runat="server" TabIndex="3" CssClass="form-control"
                                    placeholder="Email" ValidationGroup="add"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                    ErrorMessage="Enter Email" ForeColor="Red" ControlToValidate="txt_email" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group" runat="server" id="div1">
                                <label>
                                    Delivery Address </label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_address" autocomplete="off" runat="server" TabIndex="4" CssClass="form-control"
                                    placeholder="Enter Address" ValidationGroup="add"></asp:TextBox>
                                
                            </div>
                            <div class="form-group" runat="server" id="div_prodname">
                                <label>
                                    Product Name</label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_productname" autocomplete="off" runat="server" TabIndex="4" CssClass="form-control"
                                    placeholder="Enter Amount" ValidationGroup="add" ReadOnly="true"></asp:TextBox>
                                
                            </div>

                            <div class="form-group">
                                <label>
                                    Amount</label><span style="color: red; font-size: medium">*</span>
                                <asp:TextBox ID="txt_amount" autocomplete="off" runat="server" TabIndex="4" CssClass="form-control"
                                    placeholder="Enter Amount" ValidationGroup="add"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ErrorMessage="Enter Amount" ForeColor="Red" ControlToValidate="txt_amount" ValidationGroup="add"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Button ID="btn_makepayment" CssClass="btn btn-primary" runat="server" Text="Make Payment"
                                ValidationGroup="add" OnClick="btn_makepayment_Click" />
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </div>
</asp:Content>
