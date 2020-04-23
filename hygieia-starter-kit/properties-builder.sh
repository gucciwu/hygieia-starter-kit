#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
cat > $PROP_FILE <<EOF
#Database Name - default is test
dbname=dashboarddb

#Database HostName - default is localhost
dbhost=localhost

#Database Port - default is 27017
dbport=27017

server.contextPath=/api
server.port=8080

#API encryption key. Optional. See https://hygieia.github.io/Hygieia/setup.html#encryption-for-private-repos
#Randomly generated key	
key=DfvBg+AOGol5fOofjMdPYtpYGQ1rH4km

#Authentication Settings
# JWT expiration time in milliseconds
# Secret Key used to validate the JWT tokens
auth.authenticationProviders=STANDARD
auth.expirationTime=25000000

# Sonar Properties #
sonar.cron=${SONAR_CRON:-}

# Sonar server(s) (required) - Can provide multiple
sonar.servers[0]=${SONAR_HOST:-}

# Sonar version, match array index to the server. If not set, will default to version prior to 6.3.
sonar.versions[0]=${SONAR_VERSION:-}

# Sonar Metrics - Required. 
#Sonar versions lesser than 6.3
sonar.metrics[0]=${SONAR_METRICS:-}

sonar.niceNames[0]=demoSonar
# Sonar login credentials
sonar.username=${SONAR_USERNAME:-}
sonar.password=${SONAR_PASSWORD:-}

# Jenkins Properties #
#Jenkins server (required) - Can provide multiple
jenkins.servers[0]=http://119.3.184.192:9081/
jenkins.saveLog=false
jenkins.niceNames[0]=admin
jenkins.environments[0]=DEV
jenkins.cron=0 0/5 * * * *
jenkins.folderDepth=20
jenkins.usernames[0]=admin
jenkins.apiKeys[0]=11818eb420a8f7f6e8eed6d8e0747470fc
jenkins.saveLog=true
jenkins.pageSize=1000
jenkins.connectTimeout=50000
jenkins.readTimeout=50000

# Gitlab Properties #
gitlab.cron=0 0/1 * * * *
gitlab.host=dev.topflames.com
gitlab.protocol=http
gitlab.port=80
gitlab.apiToken=W8nW7Sq7F3hoxXTwxfsb

# JIRA properties #
# PageSize - Expand contract this value depending on Jira implementation's
# default server timeout setting (You will likely receive a SocketTimeoutException)
feature.pageSize=100

# Delta change date that modulates the collector item task
# Occasionally, these values should be modified if database size is a concern
feature.deltaStartDate=2016-03-01T00:00:00.000000
feature.masterStartDate=2016-03-01T00:00:00.000000
feature.deltaCollectorItemStartDate=2016-03-01T00:00:00.000000

# Chron schedule: S M D M Y [Day of the Week]
feature.cron=0 * * * * *

# ST Query File Details - Required, but DO NOT MODIFY
feature.queryFolder=jiraapi-queries
feature.storyQuery=story
feature.epicQuery=epic

# JIRA CONNECTION DETAILS:
# Enterprise Proxy - ONLY INCLUDE IF YOU HAVE A PROXY
#feature.jiraProxyUrl=http://proxy.com
#feature.jiraProxyPort=9000
feature.jiraBaseUrl=http://119.3.184.192:9083/
feature.jiraQueryEndpoint=rest/api/2/
# For basic authentication, requires username:password as string in base64
# This command will make this for you:  echo -n username:password | base64

feature.jiraCredentials=YWRtaW46YWRtaW4xMjM= # admin:admin123

# OAuth is not fully implemented; please blank-out the OAuth values:

feature.jiraOauthAuthtoken=
feature.jiraOauthRefreshtoken=
feature.jiraOauthRedirecturi=
feature.jiraOauthExpiretime=

#############################################################################
# In Jira, general IssueType IDs are associated to various 'issue'
# attributes. However, there is one attribute which this collector's
# queries rely on that change between different instantiations of Jira.
# Please provide a string name reference to your instance's IssueType for
# the lowest level of Issues (for example, 'user story') specific to your Jira
# instance.  Note:  You can retrieve your instance's IssueType Name
# listings via the following URI:  https://[your-jira-domain-name]/rest/api/2/issuetype/
# Multiple comma-separated values can be specified.
#############################################################################
feature.jiraIssueTypeNames=Story

#############################################################################
# In Jira, your instance will have its own custom field created for 'sprint' or 'timebox' details,
# which includes a list of information.  This field allows you to specify that data field for your
# instance of Jira. Note: You can retrieve your instance's sprint data field name
# via the following URI, and look for a package name com.atlassian.greenhopper.service.sprint.Sprint;
# your custom field name describes the values in this field:
# https://[your-jira-domain-name]/rest/api/2/issue/[some-issue-name]
#############################################################################
feature.jiraSprintDataFieldName=customfield_10000

#############################################################################
# In Jira, your instance will have its own custom field created for 'super story' or 'epic' back-end ID,
# which includes a list of information.  This field allows you to specify that data field for your instance
# of Jira.  Note:  You can retrieve your instance's epic ID field name via the following URI where your
# queried user story issue has a super issue (for example, epic) tied to it; your custom field name describes the
# epic value you expect to see, and is the only field that does this for a given issue:
# https://[your-jira-domain-name]/rest/api/2/issue/[some-issue-name]
#############################################################################
feature.jiraEpicIdFieldName=customfield_10002

#############################################################################
# In Jira, your instance will have its own custom field created for 'story points'
# This field allows you to specify that data field for your instance
# of Jira.  Note:  You can retrieve your instance's storypoints ID field name via the following URI where your
# queried user story issue has story points set on it; your custom field name describes the
# story points value you expect to see:
# https://[your-jira-domain-name]/rest/api/2/issue/[some-issue-name]
#############################################################################
feature.jiraStoryPointsFieldName=customfield_10003

#############################################################################
# In Jira, your instance will have its own custom field created for 'team'
# This field allows you to specify that data field for your instance
# of Jira.  Note:  You can retrieve your instance's team ID field name via the following URI where your
# queried user story issue has team set on it; your custom field name describes the
# team value you expect to see:
# https://[your-jira-domain-name]/rest/api/2/issue/[some-issue-name]
#############################################################################
feature.jiraTeamFieldName=customfield_10016

# Defines how to update features per board. If true then only update based on enabled collectorItems otherwise full update
feature.collectorItemOnlyUpdate=true

#Defines the maximum number of features allow per board. If limit is reach collection will not happen for given board
feature.maxNumberOfFeaturesPerBoard=1000

# Set this to true if you use boards as team
feature.jiraBoardAsTeam=false

#Defines the number of hours between each board/team and project data refresh
feature.refreshTeamAndProjectHours=3


EOF

exec "$@"
