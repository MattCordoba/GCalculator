Imports System.Web
Imports System.Web.Services

Public Class ChartDataHandler
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim coordinates As List(Of Coordinate) = DataConnection.getVoltageData
        Dim stats As List(Of Coordinate) = DataConnection.getStatsForDay(Date.Now)
        coordinates.AddRange(stats)
        context.Response.ContentType = "text/xml"
        context.Response.ContentEncoding = System.Text.Encoding.UTF8
        context.Response.Write("<?xml version=""1.0"" encoding=""iso-8859-1""?>")
        context.Response.Write("<rows>")
        For Each c As Coordinate In coordinates
            context.Response.Write("<row>")
            context.Response.Write(String.Format("<cell>{0}</cell>", HttpUtility.HtmlEncode("MC")))
            context.Response.Write(String.Format("<cell>{0}</cell>", HttpUtility.HtmlEncode(c.X())))
            context.Response.Write(String.Format("<cell>{0}</cell>", HttpUtility.HtmlEncode(c.Y())))
            context.Response.Write(String.Format("<cell>{0}</cell>", HttpUtility.HtmlEncode(8)))
            context.Response.Write(String.Format("<cell>{0}</cell>", HttpUtility.HtmlEncode(c.Description)))
            context.Response.Write("</row>")
        Next
        context.Response.Write("</rows>")
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class