<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="wJobSearch._Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.XtraCharts" Assembly="DevExpress.XtraCharts.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td Stye="" style="padding-right: 5px">
                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="50%" Height="100%" HorizontalAlign="Center" ShowHeader="False" meta:resourcekey="ASPxRoundPanel1Resource1">
                    <ContentPaddings PaddingTop="50px"></ContentPaddings>
                    <PanelCollection>
                        <dx:PanelContent meta:resourcekey="PanelContentResource1">
                            <dx:WebChartControl runat="server" CrosshairEnabled="True" DataSourceID="ChartData" Height="500px" Width="800px" SeriesDataMember="LastStatus" meta:resourcekey="WebChartControlResource1">
                                <DiagramSerializable>
                                    <dx:XYDiagram meta:resourcekey="XYDiagramResource1">
                                        <AxisX VisibleInPanesSerializable="-1" Title-Text="Status Type" Title-Visibility="True"></AxisX>

                                        <AxisY VisibleInPanesSerializable="-1" Title-Text="Count" Title-Visibility="True"></AxisY>
                                    </dx:XYDiagram>
                                </DiagramSerializable>

                                <SeriesTemplate SeriesDataMember="LastStatus" ArgumentDataMember="LastStatus" ValueDataMembersSerializable="Count"></SeriesTemplate>
                                <Titles>
                                    <dx:ChartTitle Text="Job Search Status by Status Type" meta:resourcekey="ChartTitleResource1"></dx:ChartTitle>
                                </Titles>
                            </dx:WebChartControl>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
            <td>
                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HorizontalAlign="Center" ShowHeader="False" Width="50%" Height="100%">
                    <ContentPaddings PaddingTop="50px"></ContentPaddings>
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="ChartData" Height="500px" Width="800px">
                                <Legend Name="Default Legend"></Legend>
                                <SeriesSerializable>
                                    <dx:Series Name="Series 1" ArgumentDataMember="LastStatus" ValueDataMembersSerializable="Percent" LabelsVisibility="True" LegendTextPattern="{A}">
                                        <ViewSerializable>
                                            <dx:PieSeriesView>
                                            </dx:PieSeriesView>
                                        </ViewSerializable>
                                        <LabelSerializable>
                                            <dx:PieSeriesLabel ColumnIndent="20" TextColor="Black" BackColor="Transparent" Font="Tahoma, 10pt" TextPattern="{A}: {VP:P0}">
                                                <Border Visibility="False"></Border>
                                            </dx:PieSeriesLabel>
                                        </LabelSerializable>
                                    </dx:Series>
                                </SeriesSerializable>
                            </dx:WebChartControl>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </td>
        </tr>
    </table>



    <asp:SqlDataSource ID="ChartData" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>' SelectCommand="SELECT LastStatus, COUNT(LastStatus) AS Count, COUNT(*) * 100.0 / (SELECT COUNT(*) AS Expr1 FROM Jobs.v_JobDetails) AS [Percent] FROM Jobs.v_JobDetails AS v_JobDetails_1 GROUP BY LastStatus"></asp:SqlDataSource>
</asp:Content>


