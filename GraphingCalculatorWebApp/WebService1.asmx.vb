Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService()>
<ToolboxItem(False)> _
Public Class WebService1
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld(ByVal dateIndex As Integer)
        Dim build As New StringBuilder()
        If dateIndex <= 1 Then
            Dim coordinates As List(Of Coordinate) = DataConnection.getVoltageData
            For Each c As Coordinate In coordinates
                build.Append(c.Y().ToString + " ")
            Next
        Else
            Dim coordinates As List(Of Coordinate) = DataConnection.getVoltageData
            For Each c As Coordinate In coordinates
                build.Append(c.X().ToString + " ")
            Next
        End If
        Return build.ToString.Trim
        'Return "[-2.44, 0.04, -2.44]"
    End Function

End Class