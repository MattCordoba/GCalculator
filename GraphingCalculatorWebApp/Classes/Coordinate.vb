Public Class Coordinate
    Private _x As Double
    Private _y As Double
    Private _description As String = ""
    Private _date As DateTime

    Public Property Description() As String
        Get
            Return _description
        End Get
        Set(value As String)
            _description = value
        End Set
    End Property
    Public Property X() As Double
        Get
            Return _x
        End Get
        Set(ByVal value As Double)
            _x = value
        End Set
    End Property
    Public Property Y() As Double
        Get
            Return _y
        End Get
        Set(ByVal value As Double)
            _y = value
        End Set
    End Property

    Public Sub New(ByVal x As Integer, ByVal y As Integer)
        Me.Y = Convert.ToDouble(y)
        Me.X = Convert.ToDouble(x)
    End Sub

    Public Sub New(ByVal x As Double, ByVal y As Double)
        Me.Y = x
        Me.X = y
    End Sub
End Class
