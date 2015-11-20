<%@ Page Title="Admin" Page Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="WebApplication1.admin" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
<div id="right">
      <h2>Welcome to Our Site!</h2>
      <div id="welcome">
        
          <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IDCliente" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" AllowPaging="True">
              <EditItemTemplate>
                  IDCliente:
                  <asp:Label ID="IDClienteLabel1" runat="server" Text='<%# Eval("IDCliente") %>' />
                  <br />
                  Nome:
                  <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                  <br />
                  Contacto:
                  <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
                  <br />
                  Morada:
                  <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' />
                  <br />
                  column1:
                  <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
                  <br />
                  Email:
                  <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                  <br />
                  <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                  &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
              </EditItemTemplate>
              <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
              <InsertItemTemplate>
                  IDCliente:
                  <asp:TextBox ID="IDClienteTextBox" runat="server" Text='<%# Bind("IDCliente") %>' />
                  <br />
                  <br />
                  Nome:
                  <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Height="22px" />
                  <br />
                  <br />
                  Contacto:
                  <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
                  <br />
                  <br />
                  Morada:
                  <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' />
                  <br />
                  <br />
                  CC:
                  <asp:TextBox ID="column1TextBox" runat="server" Text='<%# Bind("column1") %>' />
                  <br />
                  <br />
                  Email:
                  <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                  <br />
                  <br />
                  <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                  &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
              </InsertItemTemplate>
              <ItemTemplate>
                  IDCliente:
                  <asp:Label ID="IDClienteLabel" runat="server" Text='<%# Eval("IDCliente") %>' />
                  <br />
                  Nome:
                  <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
                  <br />
                  Contacto:
                  <asp:Label ID="ContactoLabel" runat="server" Text='<%# Bind("Contacto") %>' />
                  <br />
                  Morada:
                  <asp:Label ID="MoradaLabel" runat="server" Text='<%# Bind("Morada") %>' />
                  <br />
                  column1:
                  <asp:Label ID="column1Label" runat="server" Text='<%# Bind("column1") %>' />
                  <br />
                  Email:
                  <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                  <br />
              </ItemTemplate>
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          </asp:FormView>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IDCliente], [Nome], [Contacto], [Morada], [BI/CC] AS column1, [Email] FROM [Cliente]"></asp:SqlDataSource>
        
      </div>
      
</form>
</asp:Content>
