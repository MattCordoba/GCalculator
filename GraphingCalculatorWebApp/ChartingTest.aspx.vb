Imports System.Web.Configuration
Imports System.Data.SqlClient
Public Class ChartingTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim coordinates As List(Of Coordinate) = DataConnection.getVoltageData
        Dim build As New StringBuilder()
        build.Append("[")
        For Each coor In coordinates
            build.Append(coor.X().ToString + ", " + coor.Y().ToString + ", ")
            If (coor.X() <> coordinates.Last.X()) Then
                build.Append(", ")
            End If
        Next
        build.Append("]")
        'build.Append("[[3, 7, 9, 1, 4, 6, 8, 2, 5]]")
        DataLit.Text = build.ToString
        Dim d As Date = Date.Now
        Dim s As String = d.ToString()
        Dim stats As List(Of Coordinate) = DataConnection.getStatsForDay(d)

    End Sub

End Class