<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="JobInput.aspx.cs" Inherits="wJobSearch.JobInput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        var command = "";
        function OnBeginCallback(s, e) {
            command = e.command;
        }
        function OnEndCallbackGrid1(s, e) {
            if (command == "UPDATEEDIT")
                MasterGrid.Refresh();
        }
    </script>

    <table>
        <tbody>
            <tr>
                <td style="padding: 0px 5px 5px 0px;">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="100%" ShowHeader="False">
                        <ContentPaddings PaddingLeft="50px" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">

                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="SiteLookup" Theme="DevEx" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="SiteID">

                                    <Settings VerticalScrollableHeight="175" ShowFilterRow="true" />
                                    <SettingsBehavior AllowFocusedRow="true" AllowSort="true" />
                                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="Click" />
                                    <SettingsPager Mode="EndlessPaging"></SettingsPager>
                                    <SettingsBehavior AllowEllipsisInText="true" />
                                    <SettingsResizing ColumnResizeMode="NextColumn" />

                                    <Columns>
                                        <dx:GridViewCommandColumn VisibleIndex="0" Width="40px" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="SiteID" ReadOnly="True" VisibleIndex="1" Width="60px">
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="SiteName" VisibleIndex="2" Width="90px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="SiteTopLink" VisibleIndex="3" Width="450px"></dx:GridViewDataTextColumn>
                                    </Columns>

                                    <Styles>
                                        <AlternatingRow Enabled="true" />
                                        <Cell Wrap="False"></Cell>
                                    </Styles>

                                </dx:ASPxGridView>

                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                </td>
                <td style="padding: 0px 0px 5px 5px;">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="100%" ShowHeader="False">
                        <ContentPaddings PaddingLeft="50px" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">

                                <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="EmployerLookup" KeyFieldName="EmpID" Theme="DevEx">

                                    <ClientSideEvents BeginCallback="OnBeginCallback" EndCallback="OnEndCallbackGrid1" />

                                    <Settings VerticalScrollableHeight="175" ShowFilterRow="true" />
                                    <SettingsBehavior AllowFocusedRow="true" AllowSort="true" />
                                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="Click" />
                                    <SettingsPager Mode="EndlessPaging"></SettingsPager>
                                    <SettingsBehavior AllowEllipsisInText="true" />
                                    <SettingsResizing ColumnResizeMode="NextColumn" />

                                    <Columns>
                                        <dx:GridViewCommandColumn VisibleIndex="0" Width="40px" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmpID" ReadOnly="True" VisibleIndex="1" Width="60px">
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployerName" VisibleIndex="2" Width="200px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployerSite" VisibleIndex="3" Width="450px"></dx:GridViewDataTextColumn>
                                    </Columns>

                                    <Styles>
                                        <AlternatingRow Enabled="true" />
                                        <Cell Wrap="False"></Cell>
                                    </Styles>

                                </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowCollapseButton="true" Width="100%" ShowHeader="False">
                        <ContentPaddings PaddingLeft="20px" />
                        <PanelCollection>
                            <dx:PanelContent runat="server">

                                <dx:ASPxGridView ID="MasterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="MainJobData" KeyFieldName="JobID" Theme="DevEx" ClientInstanceName="MasterGrid">

                                    <Settings VerticalScrollableHeight="594" ShowFilterRow="true" ShowFooter="true" />
                                    <SettingsBehavior AllowFocusedRow="true" AllowSort="true" />
                                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="Click" />
                                    <SettingsPager Mode="EndlessPaging" ShowNumericButtons="True"></SettingsPager>
                                    <SettingsBehavior AllowEllipsisInText="true" />
                                    <SettingsResizing ColumnResizeMode="NextColumn" />
                                    <SettingsDetail ShowDetailRow="true" />

                                    <Columns>
                                        <dx:GridViewCommandColumn VisibleIndex="0" Width="40px" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="JobID" ReadOnly="True" VisibleIndex="1" Width="65px" SortOrder="Descending">
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="JobSite" Width="90px" VisibleIndex="2">
                                            <PropertiesComboBox DataSourceID="SiteLookup" TextField="SiteName" ValueField="SiteID" ValueType="System.Int32" EnableSynchronization="false" DataSecurityMode="Strict"></PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="Employer" VisibleIndex="3" Width="200px">
                                            <PropertiesComboBox DataSourceID="EmployerLookup" TextField="EmployerName" ValueField="EmpID" ValueType="System.Int32" EnableSynchronization="false" DataSecurityMode="Strict"></PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="JobTitle" VisibleIndex="4" Width="250px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="JobSiteLink" VisibleIndex="5" Width="350px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="6" Width="175px" ReadOnly="true" Caption="Current Status">
                                            <PropertiesComboBox DataSourceID="JobStatusLookup" TextField="Status" ValueField="Status" ValueType="System.String" EnableSynchronization="false" DataSecurityMode="Strict"></PropertiesComboBox>
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployerRef" VisibleIndex="7" Width="175px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="ClosingDate" VisibleIndex="8" Width="95px"></dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="9" Width="150px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ContactNumber" VisibleIndex="10" Width="110px"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="AddedToUC" VisibleIndex="11" Width="100px">
                                            <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>

                                    <TotalSummary>
                                        <dx:ASPxSummaryItem FieldName="JobID" SummaryType="Count" ShowInColumn="JobID" />
                                    </TotalSummary>

                                    <Styles>
                                        <AlternatingRow Enabled="true" />
                                        <Cell Wrap="False"></Cell>
                                        <Footer BackColor="#D3E9E9"></Footer>
                                    </Styles>

                                    <Templates>
                                        <DetailRow>

                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel1" runat="server" BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" BackColor="Gray">
                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Job Status History" Font-Bold="false" Theme="DevEx" ForeColor="White" CssClass="detailheader"></dx:ASPxLabel>
                                                        </asp:Panel>
                                                        <dx:ASPxGridView ID="DetailGrid" runat="server" AutoGenerateColumns="False" DataSourceID="JobHistoryData" KeyFieldName="HistID" Theme="DevEx" OnBeforePerformDataSelect="DetailGrid_BeforePerformDataSelect">

                                                            <SettingsDataSecurity></SettingsDataSecurity>
                                                            <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="Click" />

                                                            <Columns>
                                                                <dx:GridViewCommandColumn VisibleIndex="0" Width="40px" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="JobID" ReadOnly="True" VisibleIndex="2">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="3" Width="175px" Caption="Status">
                                                                    <PropertiesComboBox DataSourceID="JobStatusLookup" TextField="Status" ValueField="StatusID" ValueType="System.Int32" EnableSynchronization="false" DataSecurityMode="Strict"></PropertiesComboBox>
                                                                </dx:GridViewDataComboBoxColumn>
                                                                <dx:GridViewDataDateColumn FieldName="StatusDate" VisibleIndex="4"></dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="StatusDescription" VisibleIndex="4" Width="450px"></dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                    </td>
                                                    <td style="width: 30px"></td>
                                                    <td style="vertical-align: top">
                                                        <asp:Panel ID="Panel2" runat="server" BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" BackColor="Gray">
                                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Interview Details" Font-Bold="false" Theme="DevEx" ForeColor="White" CssClass="detailheader"></dx:ASPxLabel>
                                                        </asp:Panel>

                                                        <dx:ASPxGridView ID="InterviewDetails" runat="server" DataSourceID="JobInterviewDetailsData" KeyFieldName="intID" AutoGenerateColumns="False" Theme="DevEx" OnBeforePerformDataSelect="InterviewDetails_BeforePerformDataSelect">

                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False"></SettingsDataSecurity>
                                                            <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="Click" />

                                                            <Columns>
                                                                <dx:GridViewCommandColumn VisibleIndex="0" Width="40px" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="JobID" VisibleIndex="1">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="InterviewDate" VisibleIndex="2"></dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataComboBoxColumn FieldName="InterviewType" VisibleIndex="3" Width="120px" Caption="Interview Type">
                                                                    <PropertiesComboBox DataSourceID="InterviewTypeLookup" TextField="InterviewType" ValueField="IntTypeID" ValueType="System.Int32" EnableSynchronization="false" DataSecurityMode="Strict"></PropertiesComboBox>
                                                                </dx:GridViewDataComboBoxColumn>
                                                                <dx:GridViewDataTextColumn FieldName="InterviewLocation" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="InterviewNotes" VisibleIndex="5" Width="369px"></dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>

                                        </DetailRow>
                                    </Templates>

                                </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                </td>
            </tr>
        </tbody>
    </table>






    <asp:SqlDataSource ID="MainJobData" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        DeleteCommand="DELETE FROM Jobs.JobDetails WHERE (JobID = @JobID)"
        InsertCommand="INSERT INTO Jobs.JobDetails ([JobSite], [Employer], [JobTitle], [JobSiteLink], [EmployerRef], [ClosingDate], [ContactName], [ContactNumber], [AddedToUC]) VALUES (@JobSite, @Employer, @JobTitle, @JobSiteLink, @EmployerRef, @ClosingDate, @ContactName, @ContactNumber, @AddedToUC)"
        SelectCommand="SELECT Jobs.JobDetails.JobID, Jobs.JobDetails.JobSite, Jobs.JobDetails.Employer, Jobs.JobDetails.JobTitle, Jobs.JobDetails.JobSiteLink, Jobs.JobDetails.EmployerRef, Jobs.JobDetails.ClosingDate, Jobs.JobDetails.ContactName, Jobs.JobDetails.ContactNumber, Jobs.JobDetails.AddedToUC, Jobs.StatusLookup.Status FROM Jobs.JobDetails INNER JOIN Jobs.v_LastHistTransaction ON Jobs.JobDetails.JobID = Jobs.v_LastHistTransaction.JobID INNER JOIN Jobs.StatusLookup ON Jobs.v_LastHistTransaction.Status = Jobs.StatusLookup.StatusID"
        UpdateCommand="UPDATE Jobs.JobDetails SET JobSite = @JobSite, Employer = @Employer, JobTitle = @JobTitle, JobSiteLink = @JobSiteLink, EmployerRef = @EmployerRef, ClosingDate = @ClosingDate, ContactName = @ContactName, ContactNumber = @ContactNumber, AddedToUC = @AddedToUC WHERE (JobID = @JobID)">
        <DeleteParameters>
            <asp:Parameter Name="JobID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JobSite" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Employer" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="JobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="JobSiteLink" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployerRef" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="ClosingDate"></asp:Parameter>
            <asp:Parameter Name="ContactName" Type="String"></asp:Parameter>
            <asp:Parameter Name="ContactNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="AddedToUC" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="JobSite" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Employer" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="JobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="JobSiteLink" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployerRef" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="ClosingDate"></asp:Parameter>
            <asp:Parameter Name="ContactName" Type="String"></asp:Parameter>
            <asp:Parameter Name="ContactNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="AddedToUC" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="JobID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="JobHistoryData" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT HistID, JobID, Status, StatusDate, StatusDescription FROM Jobs.JobSearchHistory WHERE (JobID = @JobID) ORDER BY StatusDate, Status"
        InsertCommand="INSERT INTO Jobs.JobSearchHistory(JobID, Status, StatusDate, StatusDescription) VALUES (@JobID, @Status, @StatusDate, @StatusDescription)">
        <SelectParameters>
            <asp:SessionParameter SessionField="JobID" Name="JobID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
        <InsertParameters>
            <asp:SessionParameter SessionField="JobID" Name="JobID" Type="Int32"></asp:SessionParameter>
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="StatusDate" Type="DateTime" />
            <asp:Parameter Name="StatusDescription" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="JobInterviewDetailsData" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT [intID], [JobID], [InterviewDate], [InterviewType], [InterviewLocation], [InterviewNotes] FROM Interview.InterviewDetails WHERE ([JobID] = @iJobID)"
        InsertCommand="INSERT INTO Interview.InterviewDetails (JobID, InterviewDate, InterviewType, InterviewLocation, InterviewNotes) VALUES (@iJobID,@InterviewDate,@InterviewType,@InterviewLocation,@InterviewNotes)">
        <SelectParameters>
            <asp:SessionParameter SessionField="iJobID" Name="iJobID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
        <InsertParameters>
            <asp:SessionParameter SessionField="iJobID" Name="iJobID" Type="Int32"></asp:SessionParameter>
            <asp:Parameter Name="InterviewDate" Type="DateTime" />
            <asp:Parameter Name="InterviewType" Type="Int32" />
            <asp:Parameter Name="InterviewLocation" Type="String" />
            <asp:Parameter Name="InterviewNotes" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="JobStatusLookup" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT [StatusID], [Status], [SortOrder] FROM Jobs.StatusLookup"></asp:SqlDataSource>

    <asp:SqlDataSource ID="InterviewTypeLookup" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT IntTypeID, InterviewType FROM Interview.InterviewTypeLookup"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SiteLookup" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT SiteID, SiteName, SiteTopLink FROM Jobs.JobSiteDetails"
        DeleteCommand="DELETE FROM Jobs.JobSiteDetails WHERE (SiteID = @SiteID)"
        InsertCommand="INSERT INTO Jobs.JobSiteDetails(SiteName, SiteTopLink) VALUES (@SiteName, @SiteTopLink)"
        UpdateCommand="UPDATE Jobs.JobSiteDetails SET SiteName = @SiteName, SiteTopLink = @SiteTopLink WHERE (SiteID = @SiteID)">
        <DeleteParameters>
            <asp:Parameter Name="SiteID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SiteName" Type="String"></asp:Parameter>
            <asp:Parameter Name="SiteTopLink" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SiteName" Type="String"></asp:Parameter>
            <asp:Parameter Name="SiteTopLink" Type="String"></asp:Parameter>
            <asp:Parameter Name="SiteID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="EmployerLookup" runat="server" ConnectionString='<%$ ConnectionStrings:JobSearchConnectionString2022 %>'
        SelectCommand="SELECT * FROM Employer.EmployerDatails ORDER BY [EmpID] DESC"
        DeleteCommand="DELETE FROM Employer.EmployerDatails WHERE [EmpID] = @EmpID"
        InsertCommand="INSERT INTO Employer.EmployerDatails ([EmployerName], [EmployerSite]) VALUES (@EmployerName, @EmployerSite)"
        UpdateCommand="UPDATE Employer.EmployerDatails SET [EmployerName] = @EmployerName, [EmployerSite] = @EmployerSite WHERE [EmpID] = @EmpID">
        <DeleteParameters>
            <asp:Parameter Name="EmpID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployerName" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployerSite" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployerName" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployerSite" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmpID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
