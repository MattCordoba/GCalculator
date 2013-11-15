<%@ Page Title="Data Analysis(Still in Build)" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChartingTest.aspx.vb" Inherits="GraphingCalculatorWebApp.ChartingTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="dhtmlxGrid/dhtmlxGrid/codebase/dhtmlxcommon.js"></script>
    <script type="text/javascript" src="dhtmlxGrid/dhtmlxGrid/codebase/dhtmlxgrid.js"></script>
    <link rel="STYLESHEET" type="text/css" href="dhtmlxGrid/dhtmlxGrid/codebase/dhtmlxgrid.css" />
    <script type="text/javascript" src="dhtmlxGrid/dhtmlxGrid/codebase/dhtmlxgridcell.js"></script>
    <link rel="Stylesheet" type="text/css" href="dhtmlxGrid/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_skyblue.css" />
    <link type="text/css" href="jqplot/jquery.jqplot.css" rel="stylesheet" />
    <script type="text/javascript" src="jqplot/jquery.min.js"></script>
    <script type="text/javascript" src="jqplot/jquery.jqplot.js"></script>
    <script type="text/javascript" src="jqplot/plugins/jqplot.dateAxisRenderer.js"></script>
    <script type="text/javascript" src="jqplot/plugins/jqplot.json2.min.js"></script>
    <script type="text/javascript">
        window.data = "a";
        var dateNum = 0;
        window.arrayData = [];
        function retrieveData() {
            GraphingCalculatorWebApp.WebService1.HelloWorld(window.dateNum,callback);
        }
        function callback(msg) {
            window.data = msg;
            window.arrayData = [];
            msg.split(" ").forEach(function(e){window.arrayData.push(parseFloat(e,10))});
        }

      $(document).ready(function () {
          TestsPerformedByDayClick(); 
          retrieveData();
          
              var line1 = [1.2, 1.3, -0.2, -0.6];
              //alert(window.data);
              //console.log(window.data);
              //alert(window.arrayData);
              var plot2 = $.jqplot('chart1', [<asp:Literal runat="server" id="DataLit"></asp:Literal>,arrayData] , {
                  title: 'Voltage vs. Time',
                  seriesDefaults: {
                    showMarker:false,
                    pointLabels: { show:true }
                  },
                  axesDefaults: {
                      labelRenderer: $.jqplot.CanvasAxisLabelRenderer
                  },
                  axes: {
                      xaxis: {
                          label: "Time (s)",
                          pad: 0
                      },
                      yaxis: {
                          label: "Voltage (V)"
                      }
                  }
              });
          $('#previousButton').click(function() {
            window.dateNum += 1;
            retrieveData();
            $('#chart1').empty();
            $.jqplot('chart1', [window.arrayData],{title: 'Voltage vs. Time Day n -' + window.dateNum, axes: {
                      xaxis: {
                          label: "Time (s)",
                          pad: 0
                      },
                      yaxis: {
                          label: "Voltage (V)"
                      }
                  }
            });
          });
          $('#moveLeft').click(function() {
            if(window.dateNum >= 0) {
                window.dateNum -= 1;
            }
            retrieveData();
            $('#chart1').empty();
            $.jqplot('chart1', [window.arrayData],{title: 'Voltage vs. Time Day n -' + window.dateNum, axes: {
                      xaxis: {
                          label: "Time (s)",
                          pad: 0
                      },
                      yaxis: {
                          label: "Voltage (V)"
                      }
                  }
            });
          });
      });
      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
      <Services>
        <asp:ServiceReference Path="~/WebService1.asmx" InlineScript="true" />
      </Services>
</asp:ScriptManager>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="#">Test Lab</a>
      <div class="btn-group pull-right">
        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
          <i class="icon-user"></i> Login
          <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#">Profile</a></li>
          <li class="divider"></li>
          <li><a href="#">Sign Out</a></li>
        </ul>
      </div>
      <div class="nav-collapse">
        <ul class="nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#admin">Admin Portal</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
<div class="main">
    <div class="box">
        <div class="row-fluid">
            <div class="column span3">
              <ul class="nav nav-list nav-fixed-sidebar">
                <li class="nav-header">List header</li>
                <li id="TestsPByDLI" class="active"><a href="#Chart1"  onclick="TestsPerformedByDayClick()">Tests Performed by Day</a></li>
                <li id="DataCenterLI"><a href="#DataCenter" onclick="DataCenterClick()">Data Center</a></li>
                <li class="divider"></li>
                <li><a href="#Chart2">Load Failures by Day</a></li>
                <li><a href="#">Analysis and Reporting center</a></li>
                <li class="divider"></li>
                <li id="SourceLI"><a id="SourceLink" href="#SourceCode" onclick="SourceCodeClick()">Source Code</a></li>
                <li><a href="Default.aspx">Graph our Wall.com</a></li>
                <li><a href="http://intense-brushlands-8847.herokuapp.com/artists">Music U, a RoR based Music Directory (in Build)</a></li>
                <li class="divider"></li>
                <li id="HelpLI"><a href="#Help" onclick="HelpClick()">Help</a></li>
                <li onmouseover="MyService.loadData.GetData()"></li>
              </ul>
            </div>
            <div id="pageDiv" class="span9" style="padding-top:40px">
                <div id="analysisDiv">
                    <div id="chart1"></div>
                    <button id="previousButton" class="btn-primary" onclick="return false;">Previous Date</button>
                    <button id="moveLeft" class="btn-warning" onclick="return false;" class="btn">Next Date</button>
                    <div id="move">ff</div>
                </div>
                <div id="Chart_div1">
                    <div id="Chart_div" style="height:400px;"></div>
                        <script type="text/javascript">
                            var mygrid;
                            window.onload = initGrid();
                            function initGrid() {
                                mygrid = new dhtmlXGridObject('Chart_div');
                                mygrid.setImagePath("dhtmlxGrid/dhtmlxGrid/codebase/imgs/");
                                mygrid.setHeader("Employee Intials,Start Time,End Time,Hours Spent,Description");
                                mygrid.setInitWidths("75,250,250,50,*");
                                mygrid.setColAlign("left,left,left,left,left,left,left,left");
                                mygrid.setSkin("dhx_skyblue");
                                mygrid.init();
                                mygrid.load("ChartDataHandler.ashx");
                            }
                        </script>
                    </div>
                    <div id="SourceDiv">
                        <h1>Python Gmail Script</h1>
                        <p>This Python script allows a user to check a there Gmail and communicate a positive response through a serial port </p>
                        <script src="https://gist.github.com/MattCordoba/7273993dd6e1d32b342e.js"></script>
                    </div>
                    <div id="HelpDiv">
                        <h1>Help Page!</h1>
                        <p>[Still in build]</p>
                    </div>
                <div>
                
                </div>
            </div>
        </div>
    </div>
  
</div>
<script>

    function DataCenterClick() {
        document.getElementById('analysisDiv').style.display = 'none';
        document.getElementById('Chart_div1').style.display = '';
        document.getElementById("TestsPByDLI").className = '';
        document.getElementById("HelpDiv").style.display = 'none';
        document.getElementById("HelpLI").className = '';
        document.getElementById("DataCenterLI").className = 'active';
        document.getElementById("SourceDiv").style.display = 'none';
        document.getElementById("SourceLI").className = '';
    }
    function TestsPerformedByDayClick() {
        document.getElementById('analysisDiv').style.display = '';
        document.getElementById('Chart_div1').style.display = 'none';
        document.getElementById("DataCenterLI").className = '';
        document.getElementById("TestsPByDLI").className = 'active';
        document.getElementById("HelpDiv").style.display = 'none';
        document.getElementById("HelpLI").className = '';
        document.getElementById("SourceDiv").style.display = 'none';
        document.getElementById("SourceLI").className = '';
    }
    function SourceCodeClick() {
        document.getElementById('analysisDiv').style.display = 'none';
        document.getElementById('Chart_div1').style.display = 'none';
        document.getElementById("DataCenterLI").className = '';
        document.getElementById("TestsPByDLI").className = '';
        document.getElementById("HelpDiv").style.display = 'none';
        document.getElementById("HelpLI").className = '';
        document.getElementById("SourceDiv").style.display = '';
        document.getElementById("SourceLI").className = 'active';
    }
    function HelpClick() {
        document.getElementById('analysisDiv').style.display = 'none';
        document.getElementById('Chart_div1').style.display = 'none';
        document.getElementById("DataCenterLI").className = '';
        document.getElementById("TestsPByDLI").className = '';
        document.getElementById("HelpDiv").style.display = '';
        document.getElementById("HelpLI").className = 'active';
        document.getElementById("SourceDiv").style.display = 'none';
        document.getElementById("SourceLI").className = '';
    }

</script>
</asp:Content>
