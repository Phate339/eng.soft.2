<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gerir.aspx.cs" Inherits="WebApplication1.Gerir" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div id="right">
        <asp:Panel ID="pnver" runat="server">
        <asp:Panel ID="PanelSearch" runat="server" GroupingText="Search" BackColor="LightGoldenrodYellow">
            <div style="margin: 0.5em;">
                <table style="margin-bottom: 1ex;">
                    <tr>
                        <td>Cliente</td>
                        <td>
                            <asp:TextBox ID="TextBoxDescriptionSearch" runat="server" Width="30em"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="ButtonSearch" runat="server" Text="Pesquisar" Width="5em" />
                &nbsp;<asp:Button ID="ButtonClearSearch" runat="server" OnClick="ButtonClearSearch_Click" Text="Apagar" Width="5em" />
            </div>
        </asp:Panel>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="IDCliente" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="827px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="&gt;" ShowSelectButton="True"  />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Contacto" HeaderText="Contacto" SortExpression="Contacto" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
            <EmptyDataTemplate>
                Não Existem dados
            </EmptyDataTemplate>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;C:\Users\luis_\Desktop\New folder\WebApplication1\App_Data\yoguflame.mdf&quot;;Integrated Security=True;Connect Timeout=30" SelectCommand="SELECT * FROM [Cliente] WHERE Estado = 0" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Cliente] WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email" InsertCommand="INSERT INTO [Cliente] ([IDCliente], [Nome], [Contacto], [Morada], [CC], [Email]) VALUES (@IDCliente, @Nome, @Contacto, @Morada, @CC, @Email)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Cliente] SET [Nome] = @Nome, [Contacto] = @Contacto, [Morada] = @Morada, [CC] = @CC, [Email] = @Email WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email">
            <DeleteParameters>
                <asp:Parameter Name="original_IDCliente" Type="Int32" />
                <asp:Parameter Name="original_Nome" Type="String" />
                <asp:Parameter Name="original_Contacto" Type="Decimal" />
                <asp:Parameter Name="original_Morada" Type="String" />
                <asp:Parameter Name="original_CC" Type="Decimal" />
                <asp:Parameter Name="original_Email" Type="String" />
                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IDCliente" Type="Int32" />
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Contacto" Type="Decimal" />
                <asp:Parameter Name="Morada" Type="String" />
                <asp:Parameter Name="CC" Type="Decimal" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="IDCliente" Type="Int32" />
                <asp:Parameter Name="Nome" Type="String" />
                <asp:Parameter Name="Contacto" Type="Decimal" />
                <asp:Parameter Name="Morada" Type="String" />
                <asp:Parameter Name="CC" Type="Decimal" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_IDCliente" Type="Int32" />
                <asp:Parameter Name="original_Nome" Type="String" />
                <asp:Parameter Name="original_Contacto" Type="Decimal" />
                <asp:Parameter Name="original_Morada" Type="String" />
                <asp:Parameter Name="original_CC" Type="Decimal" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnnovo" runat="server" OnClick="btnnovo_Click" Text="Novo" />
        <asp:Button ID="btneditar" runat="server" OnClick="Button1_Click" OnCommand="InsertCancelButton_Command" Text="Editar" Visible="False" />
        <asp:Button ID="btneliminar" runat="server" OnClick="btneliminar_Click" Text="Eliminar" Visible="False" />
        <br />
        </asp:Panel>
        <asp:Panel ID="painelEliminar" runat="server" Visible="False">
        <span class="auto-style5">Tem a certeza que pretende <span class="auto-style4">eliminar</span> este Utilizador?<br /> </span>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="IDCliente" DataSourceID="SqlDataSource2" Height="70px" Width="391px" CellPadding="4" ForeColor="#333333" style="margin-right: 81px">
            <EditItemTemplate>
                IDCliente:
                <asp:Label ID="IDClienteLabel1" runat="server" Text='<%# Eval("IDCliente") %>' />
                <br />
                Nome:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                <br />
                Contacto:
                <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
                <br />
                Morada:&nbsp;&nbsp;
                <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' />
                <br />
                CC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' />
                <br />
                Email:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                IDCliente:
                <asp:TextBox ID="IDClienteTextBox" runat="server" Text='<%# Bind("IDCliente") %>' />
                <br />
                <br />
                Nome:<asp:TextBox ID="NomeTextBox" runat="server" Height="23px" style="margin-left: 30px" Text='<%# Bind("Nome") %>' Width="294px" />
&nbsp;<br />
                <br />
                Contacto:
                <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
                <br />
                <br />
                Morada:
                <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' Height="21px" style="margin-left: 15px" Width="308px" />
                <br />
                <br />
                CC:
                <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' style="margin-left: 51px" />
                <br />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' style="margin-left: 28px" Width="238px" />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
            <ItemTemplate>
                IDCliente:
                <asp:Label ID="IDClienteLabel" runat="server" Text='<%# Eval("IDCliente") %>' />
                <br />
                Nome:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
                <br />
                Contacto:&nbsp;
                <asp:Label ID="ContactoLabel" runat="server" Text='<%# Bind("Contacto") %>' />
                <br />
                Morada:&nbsp;&nbsp;&nbsp;
                <asp:Label ID="MoradaLabel" runat="server" Text='<%# Bind("Morada") %>' />
                <br />
                CC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="CCLabel" runat="server" Text='<%# Bind("CC") %>' />
                <br />
                Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;C:\Users\luis_\Desktop\New folder\WebApplication1\App_Data\yoguflame.mdf&quot;;Integrated Security=True;Connect Timeout=30" SelectCommand="SELECT * FROM [Cliente] WHERE Estado = 0" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Cliente] WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email" InsertCommand="INSERT INTO [Cliente] ([IDCliente], [Nome], [Contacto], [Morada], [CC], [Email]) VALUES (@IDCliente, @Nome, @Contacto, @Morada, @CC, @Email)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Cliente] SET [Nome] = @Nome, [Contacto] = @Contacto, [Morada] = @Morada, [CC] = @CC, [Email] = @Email WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="IDCliente"/>
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btConfirmaEliminar" runat="server" OnClick="btConfirmaEliminar_Click" Text="Sim! eliminar" Width="9em" />
        <asp:Button ID="btCancelaEliminar" runat="server" OnClick="btCancelaEliminar_Click" Text="Não, cancelar" Width="9em" />
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;C:\Users\luis_\Desktop\New folder\WebApplication1\App_Data\yoguflame.mdf&quot;;Integrated Security=True;Connect Timeout=30" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cliente] WHERE Estado = 0" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Cliente] WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email" InsertCommand="INSERT INTO [Cliente] ([IDCliente], [Nome], [Contacto], [Morada], [CC], [Email]) VALUES (@IDCliente, @Nome, @Contacto, @Morada, @CC, @Email)" UpdateCommand="UPDATE [Cliente] SET [Nome] = @Nome, [Contacto] = @Contacto, [Morada] = @Morada, [CC] = @CC, [Email] = @Email WHERE [IDCliente] = @original_IDCliente AND [Nome] = @original_Nome AND [Contacto] = @original_Contacto AND [Morada] = @original_Morada AND [CC] = @original_CC AND [Email] = @original_Email">
        <DeleteParameters>
            <asp:Parameter Name="original_IDCliente" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Contacto" Type="Decimal" />
            <asp:Parameter Name="original_Morada" Type="String" />
            <asp:Parameter Name="original_CC" Type="Decimal" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IDCliente" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Contacto" Type="Decimal" />
            <asp:Parameter Name="Morada" Type="String" />
            <asp:Parameter Name="CC" Type="Decimal" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="IDCliente" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="IDCliente" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="Contacto" Type="Decimal" />
            <asp:Parameter Name="Morada" Type="String" />
            <asp:Parameter Name="CC" Type="Decimal" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_IDCliente" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Contacto" Type="Decimal" />
            <asp:Parameter Name="original_Morada" Type="String" />
            <asp:Parameter Name="original_CC" Type="Decimal" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="IDCliente" DataSourceID="SqlDataSource2" ForeColor="#333333" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemInserting="FormView1_ItemInserting" OnItemUpdated="FormView1_ItemUpdated" OnItemUpdating="FormView1_ItemUpdating" OnModeChanged="FormView1_ModeChanged" Visible="False" Width="100%">
        <EditItemTemplate>
            IDCliente:
            <asp:Label ID="IDClienteLabel1" runat="server" Text='<%# Eval("IDCliente") %>' />
            <br />
            <br />
            Nome:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="209px" />
            <br />
            <br />
            Contacto:
            <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
            <br />
            <br />
            Morada:&nbsp;&nbsp;
            <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' Width="355px" />
            <br />
            <br />
            CC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' />
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="165px" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            Não foram selecionado dados.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            IDCliente:
            <asp:TextBox ID="IDClienteTextBox" runat="server" Text='<%# Bind("IDCliente") %>' />
            <br />
            <br />
            Nome:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' Width="297px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NomeTextBox" Display="Dynamic" ErrorMessage="Insira um nome" SetFocusOnError="True" ToolTip="Só Usar Letras">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Contacto:&nbsp;
            <asp:TextBox ID="ContactoTextBox" runat="server" Text='<%# Bind("Contacto") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ContactoTextBox" Display="Dynamic" ErrorMessage="Insira um contacto" SetFocusOnError="True" ToolTip="Só Usar Numeros"></asp:RequiredFieldValidator>
            <br />
            <br />
            Morada:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="MoradaTextBox" runat="server" Text='<%# Bind("Morada") %>' Width="349px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="MoradaTextBox" Display="Dynamic" ErrorMessage="Insira uma Morada" SetFocusOnError="True" ToolTip="Só Usar Letras"></asp:RequiredFieldValidator>
            <br />
            <br />
            CC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CCTextBox" Display="Dynamic" ErrorMessage="Por favor so usar letra" SetFocusOnError="True" ToolTip="Só Usar Letras"></asp:RequiredFieldValidator>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' Width="199px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="NomeTextBox" Display="Dynamic" ErrorMessage="Por favor so usar letra" SetFocusOnError="True" ToolTip="Só Usar Letras"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </InsertItemTemplate>
        <ItemTemplate>
            IDCliente:
            <asp:Label ID="IDClienteLabel" runat="server" Text='<%# Eval("IDCliente") %>' />
            <br />
                    Nome:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
            <br />
                    Contacto:
            <asp:Label ID="ContactoLabel" runat="server" Text='<%# Bind("Contacto") %>' />
            <br />
            Morada:&nbsp;&nbsp;&nbsp;
            <asp:Label ID="MoradaLabel" runat="server" Text='<%# Bind("Morada") %>' />
            <br />
            CC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="CCLabel" runat="server" Text='<%# Bind("CC") %>' />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Apagar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Criar" />
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:FormView ID="FormView3" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="IDCliente" DataSourceID="SqlDataSource4" ForeColor="Black">
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
                    CC:
                    <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    Estado:
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <InsertItemTemplate>
                    IDCliente:
                    <asp:TextBox ID="IDClienteTextBox" runat="server" Text='<%# Bind("IDCliente") %>' />
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
                    CC:
                    <asp:TextBox ID="CCTextBox" runat="server" Text='<%# Bind("CC") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    Estado:
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' />
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
                    CC:
                    <asp:Label ID="CCLabel" runat="server" Text='<%# Bind("CC") %>' />
                    <br />
                    Email:
                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    <br />
                    Estado:
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' Enabled="false" />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:yoguflameConnectionString %>" SelectCommand="SELECT [IDCliente], [Nome], [Contacto], [Morada], [CC], [Email], [Estado] FROM [Cliente] WHERE ([IDCliente] = @IDCliente)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="IDCliente" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
    </form>
</asp:Content>
