Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 092183FC542
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Aug 2021 12:15:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-83zHavfWOHGmp0dKuAqCgw-1; Tue, 31 Aug 2021 06:15:18 -0400
X-MC-Unique: 83zHavfWOHGmp0dKuAqCgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBB187D541;
	Tue, 31 Aug 2021 10:15:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E543160BD8;
	Tue, 31 Aug 2021 10:15:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8046C181A2AA;
	Tue, 31 Aug 2021 10:15:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17VA83qW018344 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Aug 2021 06:08:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 140ED6D9EC; Tue, 31 Aug 2021 10:08:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA1DAEC83
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:08:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 237E689C7DE
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:08:00 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-450-5Q6g_KXlNDSfHwm6M64Swg-1; Tue, 31 Aug 2021 06:07:58 -0400
X-MC-Unique: 5Q6g_KXlNDSfHwm6M64Swg-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	17V8unwP004719
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:07:57 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3aseedgkwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:07:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	17V9uFlm014507
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:07:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
	by userp3030.oracle.com with ESMTP id 3arpf421kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 10:07:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by MWHPR1001MB2398.namprd10.prod.outlook.com
	(2603:10b6:301:2f::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23;
	Tue, 31 Aug 2021 10:07:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.019;
	Tue, 31 Aug 2021 10:07:54 +0000
Date: Tue, 31 Aug 2021 13:07:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: cluster-devel@redhat.com
Message-ID: <20210831100729.GA16317@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
	(2603:10a6:600:1a8::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (2a02:6900:8208:1848::11d1) by
	LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20
	via Frontend Transport; Tue, 31 Aug 2021 10:07:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe8551a-3343-4e55-e440-08d96c6732be
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB239820D3B9FF6C671DA4FA158ECC9@MWHPR1001MB2398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 1fb4l1L4JGW5C3LsFKH2huZDGsqtM6y/VJgM0pg5/L+CJlrT3XoqbLLCs0a0sVVg3YJiW5lw3/px86cX40+dYmScsjU9JfZxNU2lsGRKvWKWaPUVtPELw2t8XYeCN1RXptVjqFgF9wicw6uic1ywYDA/Hn64Y1fauoxFFFESUA+aLGGh7mqdZh053Dc41rV8vtfUbWW0avaRBrM6JiwQe1xB4NCDdh9d9+dun1ibKOpSCrpRei0R39lpA5eXTewbFgh1sX3Pv0gjGLYkArTyQbWSgVb8GqvRdlmNXWjV7LvWUPEWIX17gIkaqQNbkKXVJHmQhd/L4aYBSLMHM/fUfvX9rja/huVd2IWe1e5+xM6d8GNWXSeeaI0o6nUIWnGHPHHQt+lmXpxI8Nab0mMfFyfuoG9ZxcPpkAsPTpzViVJMuU+xa3/Xd+GzRkZZnIcpF1q68XhJxnkSIwX7D7+liv/b09nS3Z/alyT60rDlHQQQ5ImYbpdAeTP8YZWaP1vqdaOnA6OpzGs9XtsXQoaicAF4oSIjg4tLhOsycGZ03yB7CsbcZPZ7L0PlEqEovzgENYy4F3EFf23pF7q0pG5uTdzmrQKbwYd7eTU5YxRXzns54fVjln/tJnrXslCqWgKgmHJ1wmDvVjHkO/wMdPQdlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(346002)(39860400002)(366004)(376002)(136003)(2906002)(86362001)(8676002)(478600001)(33716001)(66476007)(6496006)(1076003)(8936002)(6916009)(66946007)(316002)(44832011)(9576002)(5660300002)(83380400001)(66556008)(52116002)(33656002)(6666004)(38100700002)(186003)(9686003)(55016002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kFNq7uIgU4e2waB+H2DDLQd8SzDYHDSgbdyaxJdCP261jPo1MG/aQpR1y4Q?=
	=?us-ascii?Q?AM8sbSg2navs+RrG4lrUubzBz20iSB4pYfqZMkam52OFtbQykvI1vtE782lO?=
	=?us-ascii?Q?fq7V4GxchDLhrGK3KFW4bet5Mi/+IWErT3+wgLbhENlAJm/739JV5gQkxNS0?=
	=?us-ascii?Q?kQTfYzMTPdhdCyvQsJBTPIR/DeNECpKC+zf51eTBpO+9j+F+sRNocNXQlQrY?=
	=?us-ascii?Q?nFsfZmHp+H22B1Q9qlkCs1SWPKr2cvUM4m7jwDHTAagPxzLJKqII7kVt+B24?=
	=?us-ascii?Q?5TR48to8O4sJWjiNxxCspw28z+I6O/qmvL5trtoG3qz2R7oEzx83ocZxHmbB?=
	=?us-ascii?Q?1LBsSNoqjnhLDEHX7oUGGdAoQ7QvAnuRj4r9FPpYXcfwefKDTjTd/iBY4pQw?=
	=?us-ascii?Q?Xd8G67FEDiqKsdg6Md7z/0meNnzXSBJArM7G9H55YU3r/ty8+2JhgykZfJQ1?=
	=?us-ascii?Q?1V1CuLptdE81ESqGN9sjfYIOD8v3kAh/qKBcDF1ZdxLqxuq6HvRRAdArBJUJ?=
	=?us-ascii?Q?2ohshaIOewQUCIWMO/Q7G1qp1X/s1Q41UGADdHKePp+tuK+x6RQqI4YDQ9y0?=
	=?us-ascii?Q?RBEIOUk7NgHSs3hYLCDySixdNn0N3JQ4ZdMLFaXa5V3ScSfKC1+etk3xHD1N?=
	=?us-ascii?Q?DerkhavREq6cShtLdyCpDOM948ks5l2SPBVKfUaohTUMyqFbzKPTgp3PK+Ba?=
	=?us-ascii?Q?YPgd48LNVuyMNaPs7AgFvckbUeVdicUZyzaAp1aS69RdQJdx/sHXmTSl4UYM?=
	=?us-ascii?Q?dQijTkQpqroYZq1Hr0U+BwxdeIaKaSRwpK/rAKkU3RDmXii3vl4kyPbORZPI?=
	=?us-ascii?Q?2fNx04eWbSfKwgC4xLLF/shlXOBBqpII8qXp09kQBIrmkBocHb8VVJqD1vLK?=
	=?us-ascii?Q?Dc1TQZXt9QUm77CNb7wc8e1HrkiXjzAUNTwPImrj/82v9LXziFrUyRxcRg7u?=
	=?us-ascii?Q?76ERuH9B4HBDaqHbRy04fwqJMz23CjzFixX3vbUvP+BfNGh8GDDtfc4l+MeQ?=
	=?us-ascii?Q?RukZH859VYZGksY+FRjMEVyvayscNF1ObXyj4Rlg2LdldT98ys0SwDrsN/88?=
	=?us-ascii?Q?0sDtPMdM5F16PsBVoSBdLoV13CDVIDdr9LvFRJCdkRWyvy233Fis9VMJusYn?=
	=?us-ascii?Q?hfCQkyCgiH9tmnOYz60H3Pd5WyepvK6ovUK6j/kZfzVhX3KwJ1p/2EreR5xx?=
	=?us-ascii?Q?wqa1xv+QM/viEjJzNp0ZQ+oZJwm1+Ln9mDpeKJv9xRXaqlDxjMx0XawGWQUZ?=
	=?us-ascii?Q?RzDKLwRt6RaUN+XV4Mvi7p1HX8fxveCeHkp89pAKRCkxLXxzV+rk24IWhBUE?=
	=?us-ascii?Q?47af1/8fDwM7oWXVV9bZWn7/UEXDINceehAPp2ODBF/jIhBP+LQyRlJZmO+g?=
	=?us-ascii?Q?eGJBQc0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe8551a-3343-4e55-e440-08d96c6732be
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:07:53.9727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFyGuPgNS0sz47NeustG1IZxeDpj5e6Gr4AmBk5qGR1NWl0Qdorvo8Z8MYv9ZZQRPDReDSUI0SzQoxvTpXqHk8Be/9p+SEaqQBGC3e+RwSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2398
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10092
	signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0 phishscore=0
	spamscore=0 mlxlogscore=737 adultscore=0 suspectscore=0 mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2107140000 definitions=main-2108310057
X-Proofpoint-ORIG-GUID: H3aByntN7rEbTTDbdgY9PlQmvXqk-p-N
X-Proofpoint-GUID: H3aByntN7rEbTTDbdgY9PlQmvXqk-p-N
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [bug report] new ->follow_link() and ->put_link()
	calling conventions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello GFS2 devs,

The ancient patch 680baacbca69: "new ->follow_link() and ->put_link()
calling conventions" from May 2, 2015, leads to the following
Smatch static checker warning:

	fs/gfs2/inode.c:1806 gfs2_get_link()
	error: passing non negative 13 to ERR_PTR

fs/gfs2/inode.c
    1788 static const char *gfs2_get_link(struct dentry *dentry,
    1789                                  struct inode *inode,
    1790                                  struct delayed_call *done)
    1791 {
    1792         struct gfs2_inode *ip = GFS2_I(inode);
    1793         struct gfs2_holder i_gh;
    1794         struct buffer_head *dibh;
    1795         unsigned int size;
    1796         char *buf;
    1797         int error;
    1798 
    1799         if (!dentry)
    1800                 return ERR_PTR(-ECHILD);
    1801 
    1802         gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &i_gh);
                                                          ^
i_gh.gh_flags = 0;  The async flag is not set.

    1803         error = gfs2_glock_nq(&i_gh);

So that means gfs2_glock_nq() can return GLR_TRYFAILED (13).

    1804         if (error) {
    1805                 gfs2_holder_uninit(&i_gh);
--> 1806                 return ERR_PTR(error);
                                ^^^^^^^^^^^^^^
Which will lead to an Oops in the caller.

    1807         }
    1808 
    1809         size = (unsigned int)i_size_read(&ip->i_inode);
    1810         if (size == 0) {
    1811                 gfs2_consist_inode(ip);
    1812                 buf = ERR_PTR(-EIO);
    1813                 goto out;
    1814         }
    1815 
    1816         error = gfs2_meta_inode_buffer(ip, &dibh);
    1817         if (error) {

regards,
dan carpenter

