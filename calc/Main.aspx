<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="calc.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="Example" runat="server"></asp:TextBox>
        <asp:Label ID="Output" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="OK" runat="server" OnClick="Button1_Click" Text="Расчитать" />
    
    </div>
    </form>
</body>
</html>
