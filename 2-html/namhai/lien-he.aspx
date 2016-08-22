<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="banner-main">
      <img src="assets/images/banner1.jpg" alt=""/>
        <div class="text-banner">
            <p><strong>liên hệ với chúng tôi</strong></p>
            <p>Chúng tôi luôn chào đón mọi thắc mắc & ý kiến đóng góp từ bạn</p>
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
                    <h4 class="text-uppercase">công ty cổ phần nam hải</h4>
                    <p><span class="fa fa-map-marker"></span>12 Bis - Tôn Đản, Phường 13, Quận 4, TP. Hồ Chí Minh</p>                    <p><span class="fa fa-phone"></span>(08) 3826 1441 - 3826 1442 </p>                    <p><span class="fa fa-fax"></span>Fax:(0.8) 3940 4625 - 3941 4609</p>                    <p><span class="fa fa-envelope"></span><a href="mailto:info@tdx.com.vn">info@tdx.com.vn</a></p>
                    <p><span class="fa fa-globe"></span><a href="http://www.namhaico.com.vn">Websie: www.namhaico.com.vn</a></p>
                    <p><span class="fa fa-facebook-square"></span><a href="http://www.facebook.com/namhaicompany">Facebook: www.facebook.com/namhaicompany</a></p>
                    
                     <h3 class="text-uppercase">thời gian làm việc</h3>
                    <p>Thứ 2 - 7: 8:00 AM - 5:00 PM (CN nghỉ)</p><br />
                    <div class="wrap-node">Hãy liên hệ chúng tôi theo địa chỉ có trên bản đồ hoặc gửi tin nhắn cho chúng tôi theo mẫu form sau đây, chúng tôi sẽ trả lời sớm nhất ngay khi nhận được email của quý khách.</div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="wrap-send">
                    <h4 class="text-uppercase">gửi lời nhắn</h4>
                     <div class="contact-w">
                        <div class="contact-input">
                            <asp:TextBox ID="TextBox3" CssClass="contact-textbox" runat="server" placeholder="Tiêu đề"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="contact-w">
                                <div class="contact-input">
                                    <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server" placeholder="Họ tên"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="contact-w">
                                <div class="contact-input">
                                    <asp:TextBox ID="TextBox1" CssClass="contact-textbox" runat="server" placeholder="Điện thoại"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="contact-w">
                        <div class="contact-input">
                            <asp:TextBox ID="TextBox4" CssClass="contact-textbox" runat="server" placeholder="Email address"></asp:TextBox>
                        </div>
                    </div>
                    <div class="contact-w">
                        <div class="contact-input">
                            <asp:TextBox ID="TextBox2" CssClass="contact-area" runat="server" TextMode="MultiLine" placeholder="Nội dung tin nhắn"></asp:TextBox>
                        </div>
                    </div>
                    <div class="contact-w">
                        <div class="contact-btn">
                            <asp:button ID="Button1" CssClass="button-btn" runat="server" text="Gởi tin" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="mapshow"></div>
        </div>
    </div>
</asp:Content>

