Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8378D659
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Aug 2023 15:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693403590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7pXjEIG5a1nXYRLB3D/dVE2aKXt3PyLpqc9JBHGm/mc=;
	b=eltHUJFv+dn17nx2TTpGFc+slrEfdd0JeEE/MAnnLTO7E9sB8kxVQJ+Vg+DtM+rRcWjWEV
	05iPc91Aju3FO8gHi3lwttxsE6KhUIZhCwTpAzJE9ppxeWHpA+HxvnM1ShtDS6Dyx8qPBE
	WYJjE8t8LLEW+eRjTjxOiWcnzkHGeHs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-UD4Nb9agPM6tkv89fOnZdw-1; Wed, 30 Aug 2023 09:53:09 -0400
X-MC-Unique: UD4Nb9agPM6tkv89fOnZdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A6551C02144;
	Wed, 30 Aug 2023 13:53:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3396A40C2070;
	Wed, 30 Aug 2023 13:53:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C91ED19465B3;
	Wed, 30 Aug 2023 13:53:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C6A3D1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 13:45:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99230492C14; Wed, 30 Aug 2023 13:45:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91270492C13
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 13:45:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F9573815F66
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 13:45:28 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3LRrBJttMw6lMqzZk2S2KQ-1; Wed, 30 Aug 2023 09:45:26 -0400
X-MC-Unique: 3LRrBJttMw6lMqzZk2S2KQ-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U9iaYZ020899; Wed, 30 Aug 2023 13:45:11 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sq9mcqdjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 13:45:11 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37UCB5cY001324; Wed, 30 Aug 2023 13:45:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ssyw3qb3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 13:45:09 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN2PR10MB4287.namprd10.prod.outlook.com (2603:10b6:208:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:45:07 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::2990:c166:9436:40e%6]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:45:07 +0000
Date: Wed, 30 Aug 2023 09:45:04 -0400
From: Chuck Lever <chuck.lever@oracle.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <ZO9H4DnRD41I3rVs@tissot.1015granger.net>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-2-aahringo@redhat.com>
 <ZOjjB0XeUraoSJru@tissot.1015granger.net>
 <CAK-6q+igvE4y-jEvdrjJHW_PnnATtcZGzCkTzp41dFBhynE+Fw@mail.gmail.com>
In-Reply-To: <CAK-6q+igvE4y-jEvdrjJHW_PnnATtcZGzCkTzp41dFBhynE+Fw@mail.gmail.com>
X-ClientProxiedBy: CH2PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:610:53::20) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MN2PR10MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ccbeda-63c8-41c7-9ed3-08dba95f5267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: /huXeYEyVb8gnaDGjh7Xl5hGH3sz/aW9mWG/CUMNrM6UUAAjX9bPI9zmVR+pg2F1wdHG3eIGMsJG/RB/7AKERDgcjybqEzS+xBZ6RCRInLeEBZFHIk7sHthVT/aPz9ZmrJCBhp18EEmB8JxK7k9dzav9eNrg1O2C3GRu18bY6r7VSsmb9S8DMz23AW3LpnDeUk/0d0NUkusdJpmkKCxr/EkgkCefp+LwgdIzIdbHAZqYT89ZAhkKpvP8HSI779k/5alkSLnCMCMUqQPzgb1yNv3Z9RQchUbkx6VqvgCmThZTqg8bmfYpH24AnftVU7esYKuX2E4ye2XkcunUcBCzM6yuXalpVYrY/d9i9DgimrbRk0L82d/aGE46PlRZe7jsKCc+Pr8i+YsMwHR3r9AHg3vtKHaDP2iTTeO+3xR/zH9PODEWyUaVrQmPhPsdagXC1kY/TAEdQB6wV8LA/jqj3wOjVJeeF277PWyh1CLIXUEHWiClw5ApyvW6cC7oWSKVqGAeaNLlht3G5epQTrlwi3UHjeJQZ94+QtQftGDPv/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199024)(1800799009)(186009)(6512007)(9686003)(8936002)(86362001)(966005)(478600001)(66476007)(53546011)(6486002)(316002)(6506007)(41300700001)(66946007)(66556008)(6916009)(6666004)(5660300002)(8676002)(4326008)(26005)(44832011)(83380400001)(2906002)(38100700002)(7416002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0R5U3M4UmllR3RRaWp4clQxVGtmRzJYMm5yN3RSLzRKN3R2REF1Z0o1d3Fw?=
 =?utf-8?B?bmxOZ2tBbUliTndUUldtOXcwUURaTitHYVZiQXZnMlZBdE83a2R1VCthYU8v?=
 =?utf-8?B?NjNHUjVYTEcvV0ZEWGNtd2p5a1pIcGJ3TFBOSjRMeGFWWkpya1d0bHB4THRa?=
 =?utf-8?B?SnFsN0lDZTFFRmh3OHpqM2VBMTNHeFNMSWJDOFRCWENlK25pMDR6QXRLL0dr?=
 =?utf-8?B?OE5CZHNNZDAxMmtoZXZNRWo3OEJJZUNjUVcxS2hYZTBPNzA1SmdTcGoxc0JD?=
 =?utf-8?B?NWphdkwxL3BoL21TcjJjam9vRWE2MVU2a1VXMDhhZENtNnVNSksyZ2JmRlVo?=
 =?utf-8?B?a1FueVRCY2FxUXFXTkxSNzJ2YjlVZ3NwNzNldytyeTF0MFFmN1ljcVJVNEwr?=
 =?utf-8?B?NXFQZGlpYjluclMxREFtUlh5Yks5OWJ1MWx3VjVvcnNyRHp0UVhQcUhRQVh2?=
 =?utf-8?B?dDJlZ1B0b0twQ0RhMndzdTNGVkpwNWs3aVN1ZDBiL0VZTThCTm8vb2hrUGZM?=
 =?utf-8?B?OTdubHk0VityZi90Q1ByLzJJa2VPamZDSGJ0czU2YWdTUFRvZ3lsQ0xQY2lM?=
 =?utf-8?B?T25xWmZHV1dGaVl4ZDVYNEYwYitLcVU3UGtrT3ZMUzV2SFZ4S0RHNTRGYWY0?=
 =?utf-8?B?dk1wMmxtbUQ2bmFjOHRyRjZBUHRIYmxsWm9xR2RYblNzYnZqUEtMRWR5U3gv?=
 =?utf-8?B?NjVqclNZOXdHU1lSeFMvL29LajFnU05YVE01QXp1dkFsSFJPclB4TDNCMUt5?=
 =?utf-8?B?SEp4TGI3OVowMVg4bDZkMUVBc2huZUFuSTFyTWxBOWFXeXZVNXYyRWpRbzky?=
 =?utf-8?B?OUF3eVRRdkpxS1pSVVNHV1JOZGMxc0ZuaUpzUHNLalhESTJxOGxienpVejhr?=
 =?utf-8?B?eEhDODRrbndhL0V1OUx1M3gzNWc2aHlLUXhkMGNNYVlHZENza0xJeVAweXll?=
 =?utf-8?B?TUpTTUJqeHhTUDJxZzkwa2xGUTVBd0ZVVkFSajJERjZ5RVhPcThVZDdFaFV3?=
 =?utf-8?B?OFM4RVhLQVNyTG9iT1RiS1Y5alRmajRmeSsxMERwdmlTbmlYWEd1ekU4M3VG?=
 =?utf-8?B?dkovVkxvRGYzUWxFTWZtemVmU1FBemFWRng0ZU0wZFRTVEc0aTZLdWkzbEdr?=
 =?utf-8?B?cWZNY0V6bmpoaWlWQVJLZlpIVlFpdzNkbGlFcGdCa2VDZm44MnQycFZ3amwz?=
 =?utf-8?B?Y2tvL1dZQzliUlJCaXFRamhRdUpvTEd1UXN1U3EzMEVHMXlKdDhzU0IzQkxE?=
 =?utf-8?B?ZFA0eXhkVlBqWkVEVXRzQ3pJRDJQWEJZOXgvSXRaWnpEbno2Q2xROVRNWXps?=
 =?utf-8?B?dFpjb2FkajZKQ2t6bkMzemsxTC9EdExpWHNYbTJnTndiUW5BbGVFa0M5R2Ji?=
 =?utf-8?B?ejk3Z2UvbDlWQzdNVzVsNW9qNDNWd29rdGs2WWdIbjdBNlFBbVROQUFXNnEv?=
 =?utf-8?B?b0VFRUg3ZXkvdmVBVk03TXppQUZVOXdWT0Y1MmdhRHlKNThjakNiOHZJTlpj?=
 =?utf-8?B?NTE0N0Y1ZWFkWWlZaWwzaXJmb0ZBYnZxTjlleHdHbFlwRjUwa0phL2g0N1BN?=
 =?utf-8?B?NnVBaXlwbGxBRlk1VDJzcCthUHNjTml4UjQxU2lYV3p6MXlqakJTRmMwTGdk?=
 =?utf-8?B?VGlMWldIRkF5ejEvWnpNOWtwd2xXRE9aOGxEWkdzQXNZdEE0QlBJYXIzYzgz?=
 =?utf-8?B?YmFVSUlhb2ZNQXRvVzdlQ0k5aW5SdWxKNkRRMjZQN2V2cWZBazl1RGtSc0tw?=
 =?utf-8?B?am9BMUUvdDVjTWhkb0thOG9LaDBPRTVOOExiVk4xa1dZMVF1ZEhpcUg3dlhL?=
 =?utf-8?B?UjEweXNCNXFJVDl0OVkxeUh6Rk85NFBEdTZJUElPemoreGtncDUxM1p3REJP?=
 =?utf-8?B?Mld6cWRHRjluOGNxemp4ZmI1b2RMVExOWEgxODNTU2tNdmZ5VzFOZFVLSEhD?=
 =?utf-8?B?YXdJamJFOStwaE9ZbTF0a1luY1oxaWRSaDFzMXE2SDB2SjdaOHlBeFYyVXhz?=
 =?utf-8?B?NkJVZTNXb3hWQllSaGpnN1BJSk1iV3ZxUEd1OHFqdjY1Nk5HalVYempzZkh6?=
 =?utf-8?B?b1BjQms0c3BVa2luM2JpZnZjYS9lYTA3c21HQXJzMkcxbzN3MjJXTzl6VHJJ?=
 =?utf-8?B?cWlLMW9YVUJzMFgxVG1GaUFKWXR6WlQ0Tk10aERDdEJzNko5VzFQd1A2WGFY?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 98UogAr7ADYrhHNAPlhGQu6D7Tg0M/YexPvBicrThQyVv2Tqml6V79clIfBjmcsHJnrIDQxsm1xjDYHaNnVLHNvAjzJpG+cxcmZMs/VvAKz+2AMXdV1siybddhv1sEOR2OOYBdLOhD/bAVap1a/zzisTpBIKzyava0g2QwHYKmOFHLopSmP1tti2yBBRBDlA3VwojXy3S5GVVy+gacsyYy9AiiiNMRsR89T6WpVh5bj70a15DoC9tbBl90Pqfl4QZCdX8Jmv+NudL1MlnUc0BJQbRT24Akbsth0x6LehkcnMPJ0MRW2KSzFmYYirwA2u1UGiSRj8Ts8dlFwdUBsL+vtNfXp8YmRQoZDxnaPj58JA9C2XBH6Al+cTfyBe9zr9qwo18ILig0iy5/0PgwzBD18a2B4H14rYY+F0vg2+OgtGqPiBUDl8mtYFphZdp7S/n1KVa8bGD7AzLcpKcw6Sgpqlfw/Z8o/Kv09x85V/Awj3CJ/Oyd9okVu/mRYA1sKV6y8PYnof1TPmU+PXhl64nX29JZyOAZ0bTX7sX1L6hYd7jsNxSKiHtOxvLrHXRrem6iaOoLrSQpgIfCkC5DoJyMpoxT/dCRYtcpfYo5bUUPdlxoMNSX4O27cDjjkIYXH+Zp2bkYvShYy6EpM/urCZdKmvbbUsj4/5iBLqpu6wSJ9BxDTYbYdiA8NIJXZfAueaDSMp7HIQeU/rrqBTIbKQbbi4I6vLil0Jeqv0jWbSexeWmN4vKnzJSzluO09Y76LdJFZIc/x4HrCU6VAm9P/PnN2OCWGQkOG5gHnHEPMdzoWM4pCAI+aESL+JQKtUedvR4nVg+FeNqLHOkGNjO8nlyqm0FU3K2kVRWwxyGsD7PNDsGt5mV234CYfvQBKb0rXx8OFU6J6KKNErfjGx+eeNYw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ccbeda-63c8-41c7-9ed3-08dba95f5267
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:45:07.4968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDZWHyUHM+YqXpfIM3o2emGrMGqSbgKJgG6f6ff/0mrPZ/EGSF1vY/XgO1eQh357LROGXM47wfeTiiMRdYAdIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4287
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300127
X-Proofpoint-ORIG-GUID: 7cOAZbLwQot4Y1xJnv9Pi_FcdF664-S_
X-Proofpoint-GUID: 7cOAZbLwQot4Y1xJnv9Pi_FcdF664-S_
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-00069f02.pphosted.com id 37U9iaYZ020899
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 1/7] lockd: introduce safe async lock op
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, jlayton@kernel.org, cluster-devel@redhat.com,
 ocfs2-devel@lists.linux.dev, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: oracle.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 08:32:43AM -0400, Alexander Aring wrote:
> Hi,
>=20
> On Fri, Aug 25, 2023 at 1:21=E2=80=AFPM Chuck Lever <chuck.lever@oracle.c=
om> wrote:
> >
> > On Wed, Aug 23, 2023 at 05:33:46PM -0400, Alexander Aring wrote:
> > > This patch reverts mostly commit 40595cdc93ed ("nfs: block notificati=
on
> > > on fs with its own ->lock") and introduces an EXPORT_OP_SAFE_ASYNC_LO=
CK
> > > export flag to signal that the "own ->lock" implementation supports
> > > async lock requests. The only main user is DLM that is used by GFS2 a=
nd
> > > OCFS2 filesystem. Those implement their own lock() implementation and
> > > return FILE_LOCK_DEFERRED as return value. Since commit 40595cdc93ed
> > > ("nfs: block notification on fs with its own ->lock") the DLM
> > > implementation were never updated. This patch should prepare for DLM
> > > to set the EXPORT_OP_SAFE_ASYNC_LOCK export flag and update the DLM
> > > plock implementation regarding to it.
> > >
> > > Acked-by: Jeff Layton <jlayton@kernel.org>
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/lockd/svclock.c       |  5 ++---
> > >  fs/nfsd/nfs4state.c      | 13 ++++++++++---
> > >  include/linux/exportfs.h |  8 ++++++++
> > >  3 files changed, 20 insertions(+), 6 deletions(-)
> >
> > I'm starting to look at these. Just so you know, it's too late for
> > inclusion in v6.6, but I think we can get these into shape for v6.7.
> >
>=20
> ok. I base my work on [0], is this correct?

Correct.

Fyi, that is currently what is pending for v6.6. When the merge
window closes, it will jump to what will go into v6.7.


> > - The f_op->lock check is common to all the call sites, but it is
> >   not at all related to the export AFAICT. Can it be removed from
> >   this inline function?
> >
>=20
> This flag implies it makes only sense if the filesystem has its own
> lock() implementation, if it doesn't have that I guess the core fs
> functions for local file locking are being used.
> I guess it can be removed, but it should not be used when there is no
> own ->lock() implementation, at least not now until somebody might
> update the fs core functionality for local file locking to handle
> blocking lock requests asynchronously.

Can that be handled with a remark in the documenting comment?


> [0] https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=
=3Dnfsd-next

--=20
Chuck Lever

