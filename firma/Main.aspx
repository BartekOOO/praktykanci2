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
    </div><br><br><br>
    <form runat="server">
            <dx:ASPxGridView DataSourceID="SqlDataSource1" ID="gridView1" ClientInstanceName="Grid" runat="server" KeyFieldName="id" AutoGenerateColumns="false" Width="100%">
                <Columns>
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="firstName" Caption="Imie" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="lastName" Caption="Nazwisko" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="desiredPosition" Caption="Stanowisko" />
                    <dx:GridViewDataDateColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="dateSubmitted" Caption="Data zgłoszenia" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="phoneNumber" Caption="Numer telefonu" />
                    <dx:GridViewDataTextColumn HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" Settings-AllowSort="False" FieldName="email" Caption="E-MAIL" />
                    <dx:GridViewCommandColumn Name="buttons" ShowNewButtonInHeader="true" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" ShowEditButton="true" ShowDeleteButton="true" Caption="Dodaj" />
                </Columns>
                <SettingsDataSecurity  AllowInsert="true" />
               
                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
                </EditFormLayoutProperties>
                <SettingsPopup EditForm-AllowResize="True">
                    <EditForm Width="400">
                        <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="468" />
                    </EditForm>
                </SettingsPopup>
                <SettingsText CommandCancel="Anuluj" CommandUpdate="Aktualizuj" CommandDelete="Usuń" CommandEdit="Edytuj"/>
                <SettingsCommandButton>
                    <NewButton ButtonType="Button" Text="Dodaj" RenderMode="Link"/>
                </SettingsCommandButton>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=[Nazwa serwera]; Database=[Nazwa bazy]; Integrated Security=TRUE;"
                DeleteCommand="DELETE FROM [Praktykanci] WHERE [id] = @id"
                InsertCommand="INSERT INTO [Praktykanci] ([firstName], [lastName], [desiredPosition], [dateSubmitted], [phoneNumber], [email]) VALUES (@firstName,@lastName,@desiredPosition,@dateSubmitted,@phoneNumber,@email)"
                SelectCommand="SELECT [id], [firstName], [lastName], [desiredPosition], [dateSubmitted], [phoneNumber], [email] FROM [Praktykanci]"
                UpdateCommand="UPDATE [Praktykanci] SET [firstName] = @firstName, [lastName] = @lastName, [desiredPosition] = @desiredPosition, [dateSubmitted] = @dateSubmitted, [phoneNumber] = @phoneNumber, [email] = @email WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </form>
</body>
</html>
