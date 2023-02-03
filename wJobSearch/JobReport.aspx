<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="JobReport.aspx.cs" Inherits="wJobSearch.JobReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="JobID" Theme="DevEx" EnableTheming="True">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="JobID" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Job Site" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Employer Name" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="JobTitle" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="JobSiteLink" VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastStatus" VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="StatusDate" VisibleIndex="6" Width="90px"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InUC" ReadOnly="True" VisibleIndex="7"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ClosingDate" VisibleIndex="8"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Interview Date" ReadOnly="True" VisibleIndex="9"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Interview Type" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="11"></dx:GridViewDataTextColumn>
        </Columns>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="StatusDate" Format="TrafficLights3Unrimmed"></dx:GridViewFormatConditionIconSet>
        </FormatConditions>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>' SelectCommand="SELECT * FROM Jobs.v_JobDetails_Active"></asp:SqlDataSource>
</asp:Content>
