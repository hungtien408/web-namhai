﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="khachhang.aspx.cs" Inherits="khachhang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner-main">
        <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner" EnableModelValidation="True">
            <ItemTemplate>
                <img id="Img1" alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/images/banner4.jpg" %>'
                    runat="server" />
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
            TypeName="TLLib.AdsBanner">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                <asp:Parameter DefaultValue="10" Name="AdsCategoryID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="text-banner">
            <p>
                <strong>KHÁCH HÀNG</strong></p>
        </div>
    </div>
    <div class="container-bg">
        <div id="site" class="corner">
            <div class="container">
                <a id="A1" href="~/" runat="server"><span>Trang chủ</span></a>/<span>Khách hàng</span>
            </div>
        </div>
        <div class="container">
            <div class="row partner-tb">
                <asp:ListView ID="lstPartner" runat="server" DataSourceID="odsPartner" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-xs-4 element-item">
                            <div class="partner-box">
                                <div class="partner-img">
                                    <img id="Img2" class="hideo" alt='<%# Eval("PartnerImage") %>' src='<%# !string.IsNullOrEmpty(Eval("PartnerImage").ToString()) ? "~/res/partner/" + Eval("PartnerImage") : "~/assets/images/anova.png" %>'
                                        runat="server" />
                                </div>
                                <h4 class="partner-name">
                                    <%# Eval("PartnerName") %></h4>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsPartner" runat="server" SelectMethod="PartnerSelectAll"
                    TypeName="TLLib.Partner">
                    <SelectParameters>
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="PartnerName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="LinkWebsite" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div class="pager">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="16" PagedControlID="lstPartner">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                            ShowPreviousPageButton="false" ButtonCssClass="first fa fa-backward" RenderDisabledButtonsAsLabels="true"
                            FirstPageText="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                            ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-caret-left" RenderDisabledButtonsAsLabels="true"
                            PreviousPageText="" />
                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-caret-right"
                            ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                            NextPageText="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ButtonCssClass="last fa fa-forward"
                            ShowNextPageButton="false" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                            LastPageText="" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>
</asp:Content>