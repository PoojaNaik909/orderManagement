<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_addproducts.aspx.cs" Inherits="WebApplication4.frm_addproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
            font-family: Arial;
        }
        .modaling
        {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Transparent;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }
        .cen
        {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: #f66969;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
        .cen img
        {
            height: 110px;
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
       //nitis javascript for change data
       function openmodeld() {
           $('#delmod').modal('show');
       }
    </script>
    <div id="page-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="row">
            <!--  page header -->
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add Products</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Add Product Details
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>
                                        Product Name</label>
                                    <asp:TextBox ID="txt_productname" CssClass="form-control" runat="server" ValidationGroup="upload"></asp:TextBox>
                                    <p class="help-block">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txt_productname"
                                            runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Product Name"
                                            ValidationGroup="upload"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Product Price</label>
                                    <asp:TextBox ID="txt_productprice" CssClass="form-control" runat="server" ValidationGroup="upload"></asp:TextBox>
                                    <p class="help-block">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_productprice"
                                            runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Product Price"
                                            ValidationGroup="upload"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Product Description</label>
                                    <asp:TextBox ID="txt_productdescr" Height="106" CssClass="form-control" TextMode="MultiLine"
                                        runat="server"></asp:TextBox>
                                    <p class="help-block">
                                        <div class="form-group">
                                            <label>
                                                Upload File</label>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF|ICO|ico)$"
                                                ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid jpg Image File."
                                                Display="Dynamic" ValidationGroup="upload" />
                                        </div>
                                        <asp:Button ID="btn_add" runat="server" CssClass="btn btn-primary" 
                                        Text="Add" ValidationGroup="upload" onclick="btn_add_Click"
                                            />
                                       
                                        <asp:Label ID="lbl_success" runat="server" Text="" ForeColor="Green"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!------------------------below is table panel----->
                <div class="modal fade" id="delmod" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;</button>
                                <h4 class="modal-title">
                                    Delete Product</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    Are you sure ?
                                </p>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btn_yes" OnClick="btn_yes_del_Click"  runat="server" UseSubmitBehavior="false"
                                    Text="Yes" class="btn btn-default" data-dismiss="modal" />
                                <asp:Button ID="btn_no" runat="server" Text="No" UseSubmitBehavior="false" class="btn btn-default"
                                    data-dismiss="modal" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--   Kitchen Sink -->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                All Offers
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Product Name
                                                </th>
                                                <th>
                                                    Product Price
                                                </th>
                                                <th>
                                                    Product Descr.
                                                </th>
                                                <th>
                                                    File
                                                </th>
                                                <th>
                                                    Action
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="col-md-2">
                                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("prodname") %>'></asp:Label>
                                                        </td>
                                                        <td class="col-md-6">
                                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("prodprice") %>'></asp:Label>
                                                        </td>
                                                        <td class="col-md-6">
                                                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("proddescr") %>'></asp:Label>
                                                        </td>
                                                        
                                                        
                                            
                                                        <td class="col-md-1">
                                                            <asp:Button ID="btn_view" CssClass="btn btn-default btn-xs" runat="server" Text="View"
                                                                formnovalidate="formnovalidate" CommandName="View" CommandArgument='<%#Eval("prodimg") %>' />
                                                        </td>
                                                        <td class="col-md-1">
                                                            <asp:Button ID="btn_delete" CssClass="btn btn-outline btn-danger btn-xs" runat="server"
                                                                Text="Delete" formnovalidate="formnovalidate" CommandName="Delete" CommandArgument='<%#Eval("prodid") %>' />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- End  Kitchen Sink -->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
