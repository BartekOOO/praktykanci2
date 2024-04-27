<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Content/Style.css">
    <title>Praktykanci</title>
</head>
<body>
    <div class="headerMenu">
        <span class="dxsplPane_iOS">Strona do dodawania praktykantów</span>
    </div>
    <asp:Panel runat="server">
        <form id="form1" runat="server">
            <div class="panel">
                <asp:Label Text="Imie" runat="server" />
                <asp:TextBox CssClass="contentPane" runat="server" ID="firstName" />
                <asp:Label Text="Nazwisko" runat="server" />
                <asp:TextBox runat="server" ID="lastName" />
                <br>
                <asp:Label runat="server" Text="Stanowisko" />
                <asp:DropDownList runat="server" ID="desiredPosition">
                    <asp:ListItem Text="Programista" />
                    <asp:ListItem Text="Inżynier" />
                    <asp:ListItem Text="Informatyk" />
                    <asp:ListItem Text="Serwisant" />
                </asp:DropDownList>
                <asp:Label Text="Data zgłoszenia" runat="server" />
                <asp:TextBox runat="server" TextMode="Date" class="shortInput" ID="dateSubmitted" />
                <br>
                <asp:Label Text="Numer telefonu" runat="server" />
                <asp:TextBox TextMode="Number" ID="phoneNumber" runat="server" />
                <asp:Label Text="Adres e-mail" runat="server" />
                <asp:TextBox TextMode="Email" ID="email" runat="server" />
                <br>
                <br>
                <asp:Button UseSubmitBehavior="false" runat="server" Class="button" OnClick="Unnamed_Click" Text="Dodaj praktykanta" /><br>
                <br>
                <span runat="server" id="alertSpan" class="alertSpan"></span>
            </div>
            <dx:ASPxGridView DataSourceID="SqlDataSource1" ID="gridView1" ClientInstanceName="Grid" runat="server" KeyFieldName="id" AutoGenerateColumns="false" Width="100%">
                <Columns>
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="firstName" Caption="Imie" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="lastName" Caption="Nazwisko" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="desiredPosition" Caption="Stanowisko" />
                    <dx:GridViewDataDateColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="dateSubmitted" Caption="Data zgłoszenia" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="phoneNumber" Caption="Numer telefonu" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="email" Caption="E-MAIL" />
                    <dx:GridViewCommandColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" ShowEditButton="true" ShowDeleteButton="true" Caption="Działanie" />
                </Columns>
                <SettingsDataSecurity AllowInsert="false" />
                <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                </EditFormLayoutProperties>
                <SettingsPopup>
                    <EditForm Width="400">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="468" />
                    </EditForm>
                </SettingsPopup>
                
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=DESKTOP-PKS95F4; Database=Praktykanci; Integrated Security=TRUE;"
                DeleteCommand="DELETE FROM [Praktykanci] WHERE [id] = @id"
                InsertCommand="INSERT INTO [Praktykanci] ([firstName], [lastName], [desiredPosition], [dateSubmitted], [phoneNumber], [email]) VALUES (@firstName,@lastName,@desiredPosition,@dateSubmitted,@phoneNumber,@email,)"
                SelectCommand="SELECT [id], [firstName], [lastName], [desiredPosition], [dateSubmitted], [phoneNumber], [email] FROM [Praktykanci]"
                UpdateCommand="UPDATE [Praktykanci] SET [firstName] = @firstName, [lastName] = @lastName, [desiredPosition] = @desiredPosition, [dateSubmitted] = @dateSubmitted, [phoneNumber] = @phoneNumber, [email] = @email WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </form>
    </asp:Panel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</body>
</html>
