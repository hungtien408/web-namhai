<%@ Page Title="" Language="C#" MasterPageFile="~/site-partner.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

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
                <asp:Parameter DefaultValue="7" Name="AdsCategoryID" Type="String" />
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
                <strong>THIẾT KẾ IN ẤN</strong></p>
            <p>
                NHỮNG SẢN PHẨM IN ẤN CỦA NAM HẢI</p>
        </div>
    </div>
    <div class="container-bg">
        <div id="site" class="corner">
            <div class="container">
                <%--<a id="A1" href="~/" runat="server"><span>Trang chủ</span></a>/<a href="thiet-ke-in-an.aspx">Thiết
                    kế in ấn</a>/<span><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></span>--%>
                <asp:ListView ID="lstBreadcrum" runat="server" EnableModelValidation="True">
                    <ItemTemplate>
                        <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "</a> / "%>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <a id="A1" href="~/" runat="server">Trang chủ</a> / <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
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
            </div>
            <div class="colAside">
                <div class="aside-box">
                    <h3>
                        sản phẩm &amp dịch vụ</h3>
                </div>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                    href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">Thiết kế in
                                    ấn<span class="icon-plus"></span> </a>--%>
                                <a href="thiet-ke-in-an.aspx">Thiết kế in ấn<span class="icon-plus"></span> </a>
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
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                    href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Sản xuất thẻ
                                    cào<span class="icon-plus"></span> </a>--%>
                                <a href="san-xuat-the-cao.aspx">Sản xuất thẻ cào<span class="icon-plus"></span>
                                </a>
                            </h4>
                        </div>
                        <%--<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="rec-content">
                                    <asp:ListView ID="lstCardCategory" runat="server" DataSourceID="odsCardCategory"
                                        EnableModelValidation="True">
                                        <ItemTemplate>
                                            <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-cci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                                                <%# Eval("ProductCategoryName")%></a></li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul>
                                                <li runat="server" id="itemPlaceholder"></li>
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="odsCardCategory" runat="server" SelectMethod="ProductCategorySelectAll"
                                        TypeName="TLLib.ProductCategory">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                    href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Seal niêm
                                    phong<span class="icon-plus"></span> </a>--%>
                                <a href="seal-niem-phong.aspx">Seal niêm phong<span class="icon-plus"></span> </a>
                            </h4>
                        </div>
                        <%--<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <div class="rec-content">
                                    <asp:ListView ID="lstSealCateogry" runat="server" DataSourceID="odsSealCateogry"
                                        EnableModelValidation="True">
                                        <ItemTemplate>
                                            <li><a href='<%# progressTitle(Eval("ProductCategoryName")) + "-sci-" + Eval("ProductCategoryID") + ".aspx" %>'>
                                                <%# Eval("ProductCategoryName")%></a></li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul>
                                                <li runat="server" id="itemPlaceholder"></li>
                                            </ul>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="odsSealCateogry" runat="server" SelectMethod="ProductCategorySelectAll"
                                        TypeName="TLLib.ProductCategory">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="3" Name="parentID" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <div class="aside-box">
                    <h3>
                        Thư viện ảnh</h3>
                </div>
                <div class="list-gallery gallery-icon">
                    <asp:ListView ID="lstGallery" runat="server" DataSourceID="odsGallery" EnableModelValidation="True">
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
                    <asp:ObjectDataSource ID="odsGallery" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                        TypeName="TLLib.PhotoAlbumCategory">
                        <SelectParameters>
                            <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstGallery"
                        Visible="False">
                    </asp:DataPager>
                </div>
                <div class="view-all">
                    <a href="thu-vien.aspx">Xem tất cả</a></div>
            </div>
        </div>
    </div>
</asp:Content>
