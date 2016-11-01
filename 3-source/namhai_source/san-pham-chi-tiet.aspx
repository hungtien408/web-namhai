<%@ Page Title="" Language="C#" MasterPageFile="~/site-partner.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnAdCategoryID" runat="server" />
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
                <asp:ControlParameter ControlID="hdnAdCategoryID" Name="AdsCategoryID" PropertyName="Value"
                    Type="String" />
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
                <strong>
                    <asp:Label ID="lblBanner1" runat="server" Text=""></asp:Label></strong></p>
            <p>
                <asp:Label ID="lblBanner2" runat="server" Text=""></asp:Label></p>
        </div>
    </div>
    <div class="container-bg">
        <div id="site" class="corner">
            <div class="container">
                <a id="A1" href="~/" runat="server"><span>Trang chủ</span></a>/<a href="seal-niem-phong.aspx">Seal
                    niêm phong</a>/<span><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></span>
                <%--<asp:ListView ID="lstBreadcrum" runat="server" EnableModelValidation="True">
                    <ItemTemplate>
                        <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "</a> / "%>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <a id="A1" href="~/" runat="server">Trang chủ</a> / <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>--%>
            </div>
        </div>
        <div class="container">
            <div class="colContent">
                <div id="sliderDetails" class="detail-images">
                    <div class="wrap-images">
                        <asp:ListView ID="lstProductImageBig" runat="server" DataSourceID="odsProductImage"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide">
                                    <img id="Img2" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-2.jpg" %>'
                                        runat="server" />
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="detailimg-desktop">
                                    <div class="zoom-box">
                                        <a id="zoom1" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'
                                            class="cloud-zoom" rel="showTitle: false, adjustY:0, adjustX:5">
                                            <img class="img-responsive" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-2.jpg" %>'
                                                runat="server" />
                                        </a>
                                    </div>
                                </div>
                                <div class="detailimg-mobile">
                                    <div class="slider-for">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <div class="wrapper-in">
                        <div class="wrapper-7">
                            <div class="slider-nav">
                                <asp:ListView ID="lstProductImageSmall" runat="server" DataSourceID="odsProductImage"
                                    EnableModelValidation="True">
                                    <ItemTemplate>
                                        <div class="slide">
                                            <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-big-1.jpg" %>'
                                                data-img='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'
                                                class='cloud-zoom-gallery small-img' title='Thumbnail 1' rel="useZoom: 'zoom1', smallImage: '<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'">
                                                <span>
                                                    <img id="Img3" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-small-1.jpg" %>'
                                                        runat="server" /></span> </a>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <asp:ObjectDataSource ID="odsProductImage" runat="server" SelectMethod="ProductImageSelectAll"
                        TypeName="TLLib.ProductImage">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <%--<div class="content-main">
                   <h3>danh thiếp - name cards</h3>
                   <p>Danh thiếp là một công cụ kinh doanh quan trọng, nó gây ấn tượng đầu tiên tạo sự tin tưởng nhất định trong việc giao thiệp với khách hàng. Nó lưu trữ thông tin liên hệ của bạn trong danh bạ của khách hàng. Vì vậy bạn cần có một danh thiếp được in với chất lượng cao, điều đó sẽ giúp khách hàng của bạn lựa chọn việc lưu trữ danh thiếp và đồng thời cũng thể hiện sự tôn trọng của bạn với khách hàng.</p>
                   <p class="text-center"><img src="assets/images/hinh1.jpg" /></p>
               </div>
               <div class="table-box">
                   <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <colgroup>
                                    <col class="col-xs-3"> 
                                    <col class="col-xs-3">
                                    <col class="col-xs-3">
                                    <col class="col-xs-3">
                                </colgroup> 
                                <tbody>
                                    <tr">
                                        <th class="th-table" scope="row">Số lượng</th>
                                        <td><strong>5 hộp</strong> (1 nội dung)</td>
                                        <td><strong>10 hộp</strong> (1 nội dung)</td>
                                        <td><strong>20 hộp</strong> (1 nội dung)</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Loại giấy</th>
                                        <td>Bristol 280 gsm</td>
                                        <td>Bristol 280 gsm</td>
                                        <td>Bristol 280 gsm</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">In offset 4 màu</th>
                                        <td><img src="assets/images/icon1.png" /></td>
                                        <td><img src="assets/images/icon1.png" /></td>
                                        <td><img src="assets/images/icon1.png" /></td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Cán màng mờ</th>
                                        <td><img src="assets/images/icon1.png" /></td>
                                        <td><img src="assets/images/icon1.png" /></td>
                                        <td><img src="assets/images/icon1.png" /></td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Bo góc</th>
                                        <td><img src="assets/images/icon2.png" /></td>
                                        <td><img src="assets/images/icon2.png" /></td>
                                        <td><img src="assets/images/icon2.png" /></td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Số mặt</th>
                                        <td>2 mặt</td>
                                        <td>2 mặt</td>
                                        <td>2 mặt</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Kích thướt thành phần</th>
                                        <td>5,3 x 8,8 cm</td>
                                        <td>5,3 x 8,8 cm</td>
                                        <td>5,3 x 8,8 cm</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Thời gian</th>
                                        <td>3 - 4 ngày</td>
                                        <td>3 - 4 ngày</td>
                                        <td>3 - 4 ngày</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Giao hàng</th>
                                        <td>Tận nơi</td>
                                        <td>Tận nơi</td>
                                        <td>Tân nơi</td>
                                    </tr>
                                    <tr>
                                        <th class="th-table" scope="row">Giá</th>
                                        <td><img src="assets/images/icon3.png" /></td>
                                        <td><img src="assets/images/icon3.png" /></td>
                                        <td><img src="assets/images/icon3.png" /></td>
                                    </tr>
                                </tbody>
                            </table> 
                    </div>
               </div>--%>
                <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="content-main">
                            <h3>
                                <%# Eval("ProductName") %></h3>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="clr">
                </div>
                <div class="tab-content" id="tabContent" runat="server">
                    <div id="tabs" class="tab-product">
                        <ul>
                            <li><a href="#tabs-1">Mô tả</a></li>
                            <li><a href="#tabs-2">Chứng nhận</a></li>
                            <li><a href="#tabs-3">Liên hệ</a></li>
                        </ul>
                        <div id="tabs-1">
                            <asp:ListView ID="lstMoTa" runat="server" DataSourceID="odsProductDetails" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="tab-box">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <div id="tabs-2">
                            <asp:ListView ID="lstChungNhan" runat="server" DataSourceID="odsProductDetails" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="tab-box">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("DescriptionEn") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <div id="tabs-3">
                            <div class="tab-box">
                                <div class="address-contact">
                                    <h4 class="text-uppercase">
                                        công ty cổ phần nam hải</h4>
                                    <p>
                                        <span class="fa fa-map-marker"></span>12 Bis - Tôn Đản, Phường 13, Quận 4, TP. Hồ
                                        Chí Minh</p>
                                    <p>
                                        <span class="fa fa-phone"></span>(08) 3826 1441 - 3826 1442
                                    </p>
                                    <p>
                                        <span class="fa fa-fax"></span>Fax:(0.8) 3940 4625 - 3941 4609</p>
                                    <p>
                                        <span class="fa fa-envelope"></span><a href="mailto:namhaico@hcm.vnn.vn">namhaico@hcm.vnn.vn</a></p>
                                    <p>
                                        <span class="fa fa-globe"></span>Websie:<a href="http://www.namhaico.com.vn"> www.namhaico.com.vn</a></p>
                                    <p>
                                        <span class="fa fa-facebook-square"></span>Facebook:<a href="http://www.facebook.com/namhaicompany">
                                            www.facebook.com/namhaicompany</a></p>
                                </div>
                                <div class="wrap-send">
                                    <div class="contact-w">
                                        <div class="contact-input">
                                            <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="txtFullName_WatermarkExtender" runat="server" Enabled="True"
                                                WatermarkText="Họ &amp; Tên" TargetControlID="txtFullName">
                                            </asp:TextBoxWatermarkExtender>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                                Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                                                ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="contact-w">
                                        <div class="contact-input">
                                            <asp:TextBox ID="txtAddress" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                                WatermarkText="Địa chỉ" TargetControlID="txtAddress">
                                            </asp:TextBoxWatermarkExtender>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                                Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtAddress"
                                                ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="contact-w">
                                        <div class="contact-input">
                                            <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="txtEmail_WatermarkExtender" runat="server" Enabled="True"
                                                WatermarkText="Email" TargetControlID="txtEmail">
                                            </asp:TextBoxWatermarkExtender>
                                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                                runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                                ForeColor="Red"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                                ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="contact-w">
                                        <div class="contact-input">
                                            <asp:TextBox ID="txtPhone" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="True"
                                                WatermarkText="Điện thoại" TargetControlID="txtPhone">
                                            </asp:TextBoxWatermarkExtender>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                                Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtPhone" ErrorMessage="Information required!"
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="contact-w">
                                        <div class="contact-input">
                                            <asp:TextBox ID="txtNoiDung" CssClass="contact-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="txtNoiDung_WatermarkExtender" runat="server" Enabled="True"
                                                WatermarkText="Nội dung" TargetControlID="txtNoiDung">
                                            </asp:TextBoxWatermarkExtender>
                                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                                ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtNoiDung"
                                                ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="contact-w">
                                        <div class="contact-btn">
                                            <asp:Button ID="btGui" CssClass="button-btn" runat="server" Text="Gửi tin nhắn" ValidationGroup="SendEmail"
                                                OnClick="btGui_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="colAside">
                <div class="aside-box">
                    <h3>
                        sản phẩm &amp dịch vụ</h3>
                </div>
                <div class="panel-group" id="accordion">
                    <asp:ListView ID="lstProductSameTK" runat="server" DataSourceID="odsProductSame"
                        EnableModelValidation="True" Visible="False">
                        <ItemTemplate>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id='<%# "heading" + Eval("ProductID") %>'>
                                    <h4 class="panel-title">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-dci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                            <%# Eval("ProductName") %><span class="icon-plus"></span> </a>
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ListView ID="lstProductSameSX" runat="server" DataSourceID="odsProductSame"
                        EnableModelValidation="True" Visible="False">
                        <ItemTemplate>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id='<%# "heading" + Eval("ProductID") %>'>
                                    <h4 class="panel-title">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-cci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                            <%# Eval("ProductName") %><span class="icon-plus"></span> </a>
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ListView ID="lstProductSameSeal" runat="server" DataSourceID="odsSeal" EnableModelValidation="True"
                        Visible="False">
                        <ItemTemplate>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id='<%# "heading" + Eval("ProductID") %>'>
                                    <h4 class="panel-title">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-sci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                            <%# Eval("ProductName") %><span class="icon-plus"></span> </a>
                                    </h4>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                            <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsSeal" runat="server" SelectMethod="ProductSelectAll"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProductName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="PriceFrom" Type="String" />
                            <asp:Parameter Name="PriceTo" Type="String" />
                            <asp:Parameter DefaultValue="3" Name="CategoryID" Type="String" />
                            <asp:Parameter Name="ManufacturerID" Type="String" />
                            <asp:Parameter Name="OriginID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="InStock" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsBestSeller" Type="String" />
                            <asp:Parameter Name="IsSaleOff" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ListView ID="lstProductCategorySeal" runat="server" DataSourceID="odsProductCategorySeal"
                        EnableModelValidation="True" Visible="False">
                        <ItemTemplate>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id='<%# "heading" + Eval("ProductCategoryID") %>'>
                                    <h4 class="panel-title">
                                        <a href='<%# progressTitle(Eval("ProductCategoryName")) + "-sci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                                            <%# Eval("ProductCategoryName")%><span class="icon-plus"></span> </a>
                                    </h4>
                                </div>
                                <%--<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="rec-content">
                                    <asp:ListView ID="lstDesignCategory" runat="server" DataSourceID="odsDesignCategory"
                                        EnableModelValidation="True">
                                        <ItemTemplate>
                                            <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-dci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                                                <%# Eval("ProductCategoryName")%></a></li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul>
                                                <li runat="server" id="itemPlaceholder"></li>
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="odsDesignCategory" runat="server" SelectMethod="ProductCategorySelectAll"
                                        TypeName="TLLib.ProductCategory">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="parentID" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>--%>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductCategorySeal" runat="server" SelectMethod="ProductCategorySelectAll"
                        TypeName="TLLib.ProductCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="aside-box">
                    <h3>
                        Hotline: (08) 3826 1441 - 3826 1442</h3>
                </div>
                <%--<div class="list-gallery gallery-icon">
                    <asp:ListView ID="lstGalleryTK" runat="server" DataSourceID="odsGalleryTK" EnableModelValidation="True"
                        Visible="False">
                        <ItemTemplate>
                            <div class="gallery-img">
                                <a href="javascript:void(0);">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/thumbs/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                        runat="server" /></a> <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                            class="fancybox zoom-details" data-fancybox-group="gallery" runat="server"><span>zoom</span></a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsGalleryTK" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                        TypeName="TLLib.PhotoAlbumCategory">
                        <SelectParameters>
                            <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="ProductCategoryID" Type="String" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ListView ID="lstGallerySX" runat="server" DataSourceID="odsGallerySX" EnableModelValidation="True"
                        Visible="False">
                        <ItemTemplate>
                            <div class="gallery-img">
                                <a href="javascript:void(0);">
                                    <img id="Img4" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/thumbs/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                        runat="server" /></a> <a id="A2" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                            class="fancybox zoom-details" data-fancybox-group="gallery" runat="server"><span>zoom</span></a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsGallerySX" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                        TypeName="TLLib.PhotoAlbumCategory">
                        <SelectParameters>
                            <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="ProductCategoryID" Type="String" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ListView ID="lstGallerySeal" runat="server" DataSourceID="odsGallerySeal" EnableModelValidation="True"
                        Visible="False">
                        <ItemTemplate>
                            <div class="gallery-img">
                                <a href="javascript:void(0);">
                                    <img id="Img4" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/thumbs/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                        runat="server" /></a> <a id="A2" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/photoalbumcategory/" + Eval("ImageName") : "~/assets/images/gallery1.jpg" %>'
                                            class="fancybox zoom-details" data-fancybox-group="gallery" runat="server"><span>zoom</span></a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsGallerySeal" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                        TypeName="TLLib.PhotoAlbumCategory">
                        <SelectParameters>
                            <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                            <asp:Parameter DefaultValue="3" Name="ProductCategoryID" Type="String" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstGalleryTK"
                        Visible="False">
                    </asp:DataPager>
                    <asp:DataPager ID="DataPager2" runat="server" PageSize="8" PagedControlID="lstGallerySX"
                        Visible="False">
                    </asp:DataPager>
                    <asp:DataPager ID="DataPager3" runat="server" PageSize="8" PagedControlID="lstGallerySeal"
                        Visible="False">
                    </asp:DataPager>
                </div>
                <div class="view-all">
                    <a href="thu-vien.aspx">Xem tất cả</a></div>--%>
            </div>
        </div>
    </div>
</asp:Content>
