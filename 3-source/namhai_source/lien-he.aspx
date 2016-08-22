<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2012.3.1016.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
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
                <asp:Parameter DefaultValue="12" Name="AdsCategoryID" Type="String" />
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
                <strong>liên hệ với chúng tôi</strong></p>
            <p>
                Chúng tôi luôn chào đón mọi thắc mắc & ý kiến đóng góp từ bạn</p>
        </div>
    </div>
    <div class="container-bg">
        <div id="site" class="corner">
            <div class="container">
                <a id="A1" href="~/" runat="server"><span>Trang chủ</span></a>/<span>Liên hệ</span>
            </div>
        </div>
        <div class="container">
            <div class="row wrap-contact">
                <div class="col-md-6">
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
                            <span class="fa fa-envelope"></span><a href="mailto:info@tdx.com.vn">info@tdx.com.vn</a></p>
                        <p>
                            <span class="fa fa-globe"></span>Websie:<a href="http://www.namhaico.com.vn"> www.namhaico.com.vn</a></p>
                        <p>
                            <span class="fa fa-facebook-square"></span>Facebook:<a href="http://www.facebook.com/namhaicompany">
                                 www.facebook.com/namhaicompany</a></p>
                        <h3 class="text-uppercase">
                            thời gian làm việc</h3>
                        <p>
                            Thứ 2 - 7: 8:00 AM - 5:00 PM (CN nghỉ)</p>
                        <br />
                        <div class="wrap-node">
                            Hãy liên hệ chúng tôi theo địa chỉ có trên bản đồ hoặc gửi tin nhắn cho chúng tôi
                            theo mẫu form sau đây, chúng tôi sẽ trả lời sớm nhất ngay khi nhận được email của
                            quý khách.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="wrap-send">
                        <h4 class="text-uppercase">
                            gửi lời nhắn</h4>
                        <div class="contact-w">
                            <div class="contact-input">
                                <asp:TextBox ID="txtTitle" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                    WatermarkText="Tiêu đề" TargetControlID="txtTitle">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtTitle" ErrorMessage="Information required!"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
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
                            </div>
                            <div class="col-xs-6">
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
                                <asp:TextBox ID="txtNoiDung" CssClass="contact-area" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="txtNoiDung_WatermarkExtender" runat="server" Enabled="True"
                                    WatermarkText="Nội dung tin nhắn" TargetControlID="txtNoiDung">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                    ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtNoiDung"
                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="contact-w">
                                    <div class="contact-input">
                                        <div class="wcodes">
                                            <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                                Enabled="True" WatermarkText="Code" TargetControlID="txtVerifyCode">
                                            </asp:TextBoxWatermarkExtender>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="contact-w">
                                    <div class="contact-input">
                                        <div class="wcodes">
                                            <asp:RadCaptcha ID="RadCaptcha1" ForeColor="Red" Font-Bold="true" ValidationGroup="SendEmail"
                                                runat="server" ErrorMessage="+ Mã an toàn: không chính xác." ValidatedTextBoxID="txtVerifyCode"
                                                Display="Dynamic">
                                                <CaptchaImage Height="35" Width="135" RenderImageOnly="True" />
                                            </asp:RadCaptcha>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="contact-w">
                            <div class="contact-btn">
                                <asp:Button ID="btGui" CssClass="button-btn" runat="server" Text="Gửi tin" ValidationGroup="SendEmail"
                                    OnClick="btGui_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mapshow">
            </div>
        </div>
    </div>
</asp:Content>
