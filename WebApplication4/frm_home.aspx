<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_home.aspx.cs" Inherits="WebApplication4.frm_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <!--jumbotron-->
                <div style="width: 100%; height: 30px;">
                </div>
                 <div class="jumbotron">
                  
                    <div style="width: 100%; height: 10px;">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </div>
                  <%--div for home--%> 
                 </div>

                <div class="jumbotron">
                  
                    
                    <!-----------carasoule----------->
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <%--<ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>--%>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            
                         
                            <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                             <div class='<%#Eval("cclass")%>'>
                                 <img src='<%#Eval("imgpath")%>' alt="Chania">
                             </div>
                            </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-left" aria-hidden="true"></span><span class="sr-only">
                                Previous</span> </a><a class="right carousel-control" href="#myCarousel" role="button"
                                    data-slide="next"><span class="glyphicon glyphicon-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span> </a>
                    </div>





                 </div>

                 <div class="jumbotron">
                 <div class="row" align="center">
                        <asp:Image ID="Image2" runat="server" class="img-responsive" />
                    </div>
                 </div>
                <!--End jumbotron-->
                
            </div>
            
            
        </div>
    </div>
</asp:Content>