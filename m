Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDEF497FCD
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 13:46:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557--piQu66-PlypQa-W05hdFA-1; Mon, 24 Jan 2022 07:46:32 -0500
X-MC-Unique: -piQu66-PlypQa-W05hdFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3095100C660;
	Mon, 24 Jan 2022 12:46:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394546F12B;
	Mon, 24 Jan 2022 12:46:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C57FF1809CB8;
	Mon, 24 Jan 2022 12:46:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OCkJdj006759 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 07:46:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 27F611120AC3; Mon, 24 Jan 2022 12:46:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BDC1121332
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 12:46:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A4B2857BF9
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 12:46:16 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-550-o49xCRzMN6ut6E76ADL8GQ-1; Mon, 24 Jan 2022 07:46:11 -0500
X-MC-Unique: o49xCRzMN6ut6E76ADL8GQ-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	20OAtEfY006305; Mon, 24 Jan 2022 12:46:02 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3dr9hsm05s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jan 2022 12:46:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OCeMpl084025;
	Mon, 24 Jan 2022 12:46:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by userp3020.oracle.com with ESMTP id 3drbckbxkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jan 2022 12:46:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by BYAPR10MB3367.namprd10.prod.outlook.com
	(2603:10b6:a03:15d::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12;
	Mon, 24 Jan 2022 12:45:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::c13b:5812:a403:6d96]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.017;
	Mon, 24 Jan 2022 12:45:59 +0000
Date: Mon, 24 Jan 2022 15:45:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alexander Aring <aahringo@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.ibm.com>
Message-ID: <20220124124530.GS1951@kadam>
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
	<CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
In-Reply-To: <CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::8)
	To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eeb727b-a0e7-4042-c179-08d9df37782e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3367:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB33679F8B0E98D03F986E2E3F8E5E9@BYAPR10MB3367.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: O7H6ZIwdKLFzx4/GYhnuld4lezQJzfihg4AmVCZM6LI5vRrvUpOl36Vge+xMW/Sya5AJ75NZ5LlUp/txn6b6ncLG1tYDKKaQPwzQbZjm9m6VuDDTM1pxZE2mWi21oRzFS771/YJvOCVUgbIaNDFlLhvdNQln7K8pCdzN2pCIgJvG2i57KmgL3IvWHPyf0satuHLxK+CkmUlme5W61gdJ4CN5QWdXJEu3/67gtEqCHD33stwl3PGP4wHAaUNZoiLWzhrheor4pPY27rlNC1AXLp9KLsg9q52PnZ8KwCb0E7Pl353Lslew6ffRHACU84FnwRbaeoFttSy8n4zdbFU26v8jkCT3IBxtSIE8O1MRsl+K3QVWBvwjtf8vOfKMpCWY0PVSWLDO+DsVaFIBkiz9h4ALNvJIePZV8/ug3WIlqMqemvlQcN43fQTLDIatv/6Lw+slPf/XJ5wrGd861a+OpMbOncIxK23mz0DtO/9rwSmNnxbJl64Wcfj0EpaQ6B94jqV9uCWex3mgNgj5FGhVKYczBqFluwJKe8sJysIZLDQ/A3e68Fshx/oOs8Ms+WrLVVnaByRsJqHpSt0JvDq11YyDKHyNc7+nnw+6pw0GU86LqJKajmNE6/cm9I5y1kL6Mu0cIvbSuIKrZhWmyG8hoV9sfK6oyRYZ7tyXrtNHB9+m9Qzzh2h1II47dqGyFYMqQW4CGqCcBGz1ZnLzEI0LUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(7916004)(366004)(6666004)(1076003)(6486002)(9686003)(316002)(5660300002)(186003)(8676002)(4744005)(8936002)(6512007)(86362001)(26005)(66476007)(38350700002)(33656002)(66946007)(110136005)(52116002)(66556008)(33716001)(38100700002)(6506007)(7416002)(4326008)(508600001)(2906002)(54906003)(44832011);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtNMAB34ubxmFQwNy6RDw9ntOFp9bTidUXsSdAleVJ1RcDzamM4kX7SqardS?=
	=?us-ascii?Q?eS09aZ6omzRvSPK/zAV53B1Nbs0/suIkyP/ayCcvnIQA5AvEXxQ0B/swm4pw?=
	=?us-ascii?Q?1rNB6ft0ACY+TURHxRyUm6kUeODKzrjFgr6Ug0BUZ891Q2Gypi60HcXkbaNq?=
	=?us-ascii?Q?IJ/laKes8grwQFR5UQliBa1GdXUZYpJMrBHD9Mocc6n5MFfCLCDP6HLaqw1j?=
	=?us-ascii?Q?xYt1bgpoH73GuDPNatuy3lFKLvvHCbl3xWMZJPjv6NEFW8MPHsIumQ28lNPr?=
	=?us-ascii?Q?2j5bL5C1hPMjTwj+W6ZGys5B7zOTTDB+C9N311ChOLpnSz1SnYhSZV48tgyq?=
	=?us-ascii?Q?Trbdt4a1kmYt7uuTBT57HANBD2Itp8YgllYCQ63fLCr4OoajVPnsMY7ZDv6V?=
	=?us-ascii?Q?69LGQPA7W7c/9fVEMRJzBnrnixEFmm+A32A76onlcC0JF81CbmLXIUfQvlZM?=
	=?us-ascii?Q?TDTE3ojrE5cgtq6V8A2mQpdKs3mgmSO3Rp/gqQf73Qrh9ncEUMkltPBQv3SY?=
	=?us-ascii?Q?b2qJkIIe1KBjMK802D03yaJtoUa5BcQmjH/bx5Og5UdeN3v5mz6XTkTmZnOb?=
	=?us-ascii?Q?mhkBGrKB3HKOtHb/ulQ8VQDG+6vy81eRI0XaqfrAoojVkZxrVdaP5tLIIUH2?=
	=?us-ascii?Q?TOLQ58bH5Je1fdd2cvjjIfMArVzY7tDXM02tyG+GNq4W6QkZktx675IOfYTe?=
	=?us-ascii?Q?fDSTomrtCegzduFt5OPRj5GuYzZG0DINzvmI5XBAhDVNLbMnpTgtaAMtT3OY?=
	=?us-ascii?Q?2AA6ql3NUQrfq8FWCm4qwp1Flm3XMW8jHESy4Y4fg/M8gqQ9ivAAhLDYmk3t?=
	=?us-ascii?Q?WiDyl3c4QjjSI/9dJbEQh0dPEjqCVVbpLh8/PZ+n+GLgKgvu0bVKte7HL2Y5?=
	=?us-ascii?Q?g+4v4zTtO04GKJOTmqBVubiS6Qe/8SBOvws5tGib4/qZFsudyoZOq8k8RRTe?=
	=?us-ascii?Q?2BE9IeRqyjUjJ3l8SO/jRY5RwReZc7C99nr1S+hA/exqpYQBiwYGOMg49Yba?=
	=?us-ascii?Q?XUrksA3OrR0UsILlcJqtWfib4JFTAfgFkUB7yES+vrDVuRx6GC0BjFZ1yV+Q?=
	=?us-ascii?Q?fhwjYwKou4vkdwtOcxkU/dNaVNb3AZpNK31JqtpTjWytWPA2ToVPBUcCBJpZ?=
	=?us-ascii?Q?obFh4YQvOj7IRzkKl5fg6sqUHXRgq9uLF0ht6Ej9+3qKB6aWcmwJgcqYKonQ?=
	=?us-ascii?Q?gWkHJaZcUlFChwRQORdu9tIDNSHzxFiddpC0tFzqpusGNxbkvq87k+/DcfMx?=
	=?us-ascii?Q?Wss9RpGrmu2/5gV9cgVdQtugBrtj+7igR2s/hep+WZOJjTze05xeSqsZ0u7M?=
	=?us-ascii?Q?2t/u4T9xnnErhhDONePJ3JrJ+QN9Bpi0g1xPVDMvnr7GjHFuGmPhuCrtwxJf?=
	=?us-ascii?Q?Tgr0mbtJl4J9uskTVKjzKIFp8fHidYCUmW+97vJYduszjJN/QdQ23P1pHIG+?=
	=?us-ascii?Q?ZLgCeKxupbkDmFcV6+HJl+/UCIZ45/ezZ6LuMuoSVBTmzKpLRgAUL+IkIOgh?=
	=?us-ascii?Q?nuWkqGlWNdtejBoG1Yl3cuJIkvA9Ae9sgGvM2Cx0BEvzCRuzEf2x+3MMq3qz?=
	=?us-ascii?Q?6QImTQm8zLcEfxMTMduVl8TpjSw5xjbF1n4ncoiC1hLIhxX2m4itVpDEVTfm?=
	=?us-ascii?Q?NmkEw1em5Jb3FAxmD9wxRGt+iKaMKpOfBlP++4sy0aQqgrTRWcaUlZUHxJCQ?=
	=?us-ascii?Q?X2ySLJyO4duaUMi+jPSbGc/o6fM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eeb727b-a0e7-4042-c179-08d9df37782e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 12:45:58.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sL9540FA3GJEeH3vD/1PPykg4qvuXRBs5ugr9U2mHpBTTBryz8xmk4RZ0VQrm4WBQtoAYJhTo3YBql1tXHDfVfe2+Mah1NeviWv0KfKoSvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3367
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10236
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	mlxscore=0 malwarescore=0
	spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2201240084
X-Proofpoint-GUID: NjJ2FSWQDrppWJl_4tVn3WS7nwGKclI9
X-Proofpoint-ORIG-GUID: NjJ2FSWQDrppWJl_4tVn3WS7nwGKclI9
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: rcu@vger.kernel.org, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	linux-sparse@vger.kernel.org
Subject: Re: [Cluster-devel] fs/dlm/midcomms.c:913:22: sparse: sparse:
 restricted __le32 degrades to integer
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> 
> I see also:
> 
> fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> 

Why not just do this?  (Untested.  Maybe I don't understand?)

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index cb1f4351e8ba..a164089abec4 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -121,7 +121,7 @@ struct srcu_struct {
 #ifdef MODULE
 # define __DEFINE_SRCU(name, is_static)					\
 	is_static struct srcu_struct name;				\
-	struct srcu_struct * const __srcu_struct_##name			\
+	is_static struct srcu_struct * const __srcu_struct_##name	\
 		__section("___srcu_struct_ptrs") = &name
 #else
 # define __DEFINE_SRCU(name, is_static)					\

