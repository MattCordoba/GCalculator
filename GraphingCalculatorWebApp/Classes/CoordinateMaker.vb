Public Class CoordinateMaker
    Public Shared Function makeCoordinateList(ByVal functionString As String, ByVal lowerBound As Double, ByVal upperBound As Double) As List(Of Coordinate)
        If (functionString.Replace(" ", "") <> "y=x") Then
            Throw New Exception("Cannot graph this function")
        End If
        Dim coordinates As New List(Of Coordinate)
        For i As Double = lowerBound To upperBound Step 0.5
            coordinates.Add(New Coordinate(i, i))
        Next
        Return coordinates
    End Function
   
End Class
