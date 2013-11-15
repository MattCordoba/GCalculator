Public Class SerialPort
    Public Shared Function SendSerialData(ByVal functionToGraph As String, ByVal ComNumber As Integer) As Boolean
        Dim Serialport As New IO.Ports.SerialPort
        With Serialport
            .PortName = "COM4"
            .BaudRate = 19200
        End With
        Serialport.Open()
        System.Threading.Thread.Sleep(2000)
        Serialport.Write(functionToGraph)
        'Serialport.Write(functionToGraph)
        'Serialport.Write("1")
        Serialport.Write("1")
        Serialport.Close()
        Return True
    End Function
End Class
