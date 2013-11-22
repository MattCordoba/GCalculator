Imports System.Web.Configuration
Imports System.Data.SqlClient
Public Class DataConnection
    Public Shared Function getVoltageData() As List(Of Coordinate)
        Dim coordinates As New List(Of Coordinate)
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("DBConn").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim c As New SqlCommand("dbo.event_item_get_all", con)
        c.CommandType = Data.CommandType.StoredProcedure
        con.Open()
        Dim r As SqlDataReader = c.ExecuteReader()
        While r.Read()
            Dim coor As New Coordinate(Convert.ToDouble(r("V_r")), Convert.ToDouble(r("V_in")))
            coordinates.Add(coor)
        End While
        r.Close()
        con.Close()
        Return coordinates
    End Function
	'''
	' @param d 
	' Date.  Date requires valid Date in a standard UK format rather than US 
	' ie: DD/MM/YYYY
	' @returns
	' stats for that specific day that are pulled from the database
	'''
    Public Shared Function getStatsForDay(ByVal d As Date) As List(Of Coordinate)
        Dim coordinates As New List(Of Coordinate)
        Dim con As New SqlConnection
        con.ConnectionString = WebConfigurationManager.ConnectionStrings("DBConn").ConnectionString
        con.Open()
        Dim cmd As New SqlCommand("dbo.get_stats_by_date", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@event_code", SqlDbType.NChar).Value = evnt.EventCode
        cmd.Parameters.Add("@date", SqlDbType.Date).Value = d
        Dim r As SqlDataReader = cmd.ExecuteReader
        While r.Read()
            Dim c As New Coordinate(Convert.ToDouble(r("data_x")), Convert.ToDouble(r("data_y")))
            If Not IsDBNull(r("description")) Then
                c.Description = r("description")
            End If
            coordinates.Add(c)
        End While
        con.Close()
        Return coordinates
    End Function
End Class
