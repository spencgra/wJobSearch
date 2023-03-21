<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="JobReport.aspx.cs" Inherits="wJobSearch.JobReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Active Job Report
    </h1>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="JobID" Theme="DevEx" EnableTheming="True">

        <Columns>
            <dx:GridViewDataTextColumn FieldName="JobID" ReadOnly="True" VisibleIndex="0" Width="50px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Job Site" VisibleIndex="1" Width="110px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Employer Name" VisibleIndex="2" Width="170px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="JobTitle" VisibleIndex="3" Width="150" CellStyle-Wrap="False" Settings-AllowEllipsisInText="True"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="JobSiteLink" VisibleIndex="4" Width="850px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastStatus" VisibleIndex="5" Width="80px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="StatusDate" VisibleIndex="6" Width="100px"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="ReplyStatus" ReadOnly="True" VisibleIndex="7" Width="45px">
                <HeaderStyle Wrap="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InUC" ReadOnly="True" VisibleIndex="8" Width="45px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ClosingDate" VisibleIndex="9"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Interview Date" ReadOnly="True" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Interview Type" VisibleIndex="11"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12"></dx:GridViewDataTextColumn>
        </Columns>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="StatusDate" Format="TrafficLights3Unrimmed"></dx:GridViewFormatConditionIconSet>
            <dx:GridViewFormatConditionHighlight FieldName="ReplyStatus" Expression="[ReplyStatus] = 'NRIT'" Format="LightRedFillWithDarkRedText"></dx:GridViewFormatConditionHighlight>
            <dx:GridViewFormatConditionHighlight FieldName="ReplyStatus" Expression="[ReplyStatus] = 'OK'" Format="GreenFillWithDarkGreenText"></dx:GridViewFormatConditionHighlight>
        </FormatConditions>
        <Settings showfooter="true" />
        <SettingsPager PageSize="20" />
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="JobID" SummaryType="Count" ShowInColumn="JobID" />
        </TotalSummary>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>' SelectCommand="SELECT * FROM Jobs.v_JobDetails_Active"></asp:SqlDataSource>
</asp:Content>
