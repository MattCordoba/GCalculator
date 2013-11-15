Public Class GoogleCharting
    Public Shared Function generateGoogleChartDataString(ByVal coordinates As List(Of Coordinate)) As String
        Dim googleDataString As New StringBuilder
        For Each c In coordinates
            If Not c.X = coordinates.Last.X Then
                googleDataString.AppendLine("['" & c.X & "', " & c.Y & "],")
            Else
                googleDataString.AppendLine("['" & c.X & "', " & c.Y & "]")
            End If
        Next
        Return googleDataString.ToString
    End Function
End Class
