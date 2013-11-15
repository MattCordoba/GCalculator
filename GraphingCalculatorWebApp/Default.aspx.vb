Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'DataLiteral1.Text = GoogleCharting.generateGoogleChartDataString(CoordinateMaker.makeCoordinateList("y=x", 1.0, 3.0))
    End Sub

    Protected Sub SubmitBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitFunctionBtn.Click
        If (FunctionTextBox.Text = "" Or XValueBox.Text = "" Or XHighValueBox.Text = "") Then
            Results.Text = "You did not fill out enough information"
            Results.Visible = True
            Exit Sub
        Else
            Results.CssClass = "label-success"
            Results.Text = "Plotting....."
            DataLiteral1.Text = GoogleCharting.generateGoogleChartDataString(CoordinateMaker.makeCoordinateList(FunctionTextBox.Text, Convert.ToDouble(XValueBox.Text), Convert.ToDouble(XHighValueBox.Text)))
            'If SerialPort.SendSerialData(FunctionTextBox.Text, 4) Then
            Results.Visible = True
            'End If
        End If
    End Sub

End Class