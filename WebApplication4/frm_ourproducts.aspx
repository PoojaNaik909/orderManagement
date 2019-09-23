<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_ourproducts.aspx.cs" Inherits="WebApplication4.frm_ourproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
        <div class="row">
            <!--  page header -->
            <div class="col-lg-12">
                <h1 class="page-header">
                    Our Products</h1>
            </div>
        </div>
        <div class="row">
            <!-- page header -->
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <%#Eval("prodname")%>
                            </div>
                            <div class="panel-body">
                                <asp:ImageButton  ID="ImageButton3"
                                    runat="server" Style="display: inline-block; height: 300px; max-width: 100%;"
                                    ImageUrl='<%# Eval("prodimg","~/products/{0}") %>' />
                                <%--<asp:Image ID="Image1" style="display: inline-block;height:auto;max-width:100%;"  runat="server" />--%>
                                <h4>
                                    <%#Eval("prodprice")%>
                                    Rs.</h4>
                                <asp:Button CssClass="btn btn-info" CommandArgument='<%#Eval("prodname") + "^" +Eval("prodprice")%>' CommandName="Select" ID="Button2" runat="server" Text="Buy Now" />
                                <p>
                                    <h4>
                                        Description :</h4>
                                </p>
                                <p>
                                    <%#Eval("proddescr")%></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
