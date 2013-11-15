<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="GraphingCalculatorWebApp._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div class="row">
    <div class="span3">
        <ul class="nav nav-list">
            <li class="nav-header">Graph Our Wall.COM</li>
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">News and Blog</a></li>
            <li><a href="#">Source Code</a></li>
            <li><a href="Default.aspx">Other Projects</a></li>
            <li class="divider"></li>
            <li><a href="#">Help</a></li>
        </ul>
    </div>
    <div class="span9">
        <h2>
            Welcome to Graph Our Wall.COM
        </h2>
        Function: <asp:TextBox runat="server" ID="FunctionTextBox" placeholder="The Function to Graph (ex: y=x)"></asp:TextBox><br />
        Lower Bound (x): <asp:TextBox runat="server" ID="XValueBox" placeholder="The Lowest value of x to go to (the lower bound)"></asp:TextBox><br />
        Upper Bound (x): <asp:TextBox runat="server" ID="XHighValueBox" placeholder="The Highest value of x to go to (the upper bound)"></asp:TextBox><br />
        <asp:Button runat="server" class="btn btn-success" ID="SubmitFunctionBtn" Text="Graph that bad boy" /><br />
        <asp:Label runat="server" ID="Results" CssClass="label-warning" visible ="false"></asp:Label>
        <div id="chart_div"></div>
        
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                                                                <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
          ['X', 'Y'],
          <asp:Literal id="DataLiteral1" runat="server"></asp:Literal>
        ]);

            var options = {
                title: 'y = x'
            };

            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
        
    </div>
    
</div>
<div class="row>
    <div id="page-footer" class="pull-left">
        <hr />
        <div class="pull-left">
            <p class="muted credit">Written by <a href="https://github.com/MattCordoba/">Matt Cordoba</a>, Christian Kames, and Jon Doucette.</p>
        </div>
    </div>
</div>
</asp:Content>
