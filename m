Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD25A43F9
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Aug 2022 09:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661758915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+AatRshl0yXPfRtMhNReTHCx1qWiLUccWDRD7v9sfUM=;
	b=DKcbd7W9wvpV4l/Qbs4m1tuGH3RkrQC0SOA2/04yiqYzKfRP/fj9ID4tSyVUr9KUHggtiQ
	v/R7RzPfV1GEwsdWozBnf55o3Xw8VSsUyfZazQ6QieUXPueq06h324JzgfRpkCkZXkMDb2
	541dPplmpiSnAB4GrHK3GsPhyRWOtaU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-iA-9hyQ6MPyscqXyMqDevg-1; Mon, 29 Aug 2022 03:41:51 -0400
X-MC-Unique: iA-9hyQ6MPyscqXyMqDevg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 645A629ABA1F;
	Mon, 29 Aug 2022 07:41:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 277A14010D42;
	Mon, 29 Aug 2022 07:41:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD1111946A49;
	Mon, 29 Aug 2022 07:41:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D6A671946A41 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 Aug 2022 07:41:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C040A492C3B; Mon, 29 Aug 2022 07:41:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC54492CA2
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 07:41:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FE5A101AA46
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 07:41:46 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-fhn_h-66MdahgImFHJQqWQ-1; Mon, 29 Aug 2022 03:41:44 -0400
X-MC-Unique: fhn_h-66MdahgImFHJQqWQ-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T2VKnY016502;
 Mon, 29 Aug 2022 07:41:43 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79v0jjwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 07:41:43 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27T7NNde018063; Mon, 29 Aug 2022 07:41:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q25j6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 07:41:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1456.namprd10.prod.outlook.com
 (2603:10b6:300:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:41:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:41:40 +0000
Date: Mon, 29 Aug 2022 10:41:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: aahringo@redhat.com
Message-ID: <YwxtqfWnuiCJkVQ0@kili>
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d68db4d1-9cc8-47f8-ca7f-08da8991e930
X-MS-TrafficTypeDiagnostic: MWHPR10MB1456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: P6+q61u1gepMoiN94yEGLSh3WBrUUUf2iTFBMhINTgUHRG+M99XahO1CT4rTj1PaLtRJmxxGSDDjXutQgeNoLzLB+ioOgVEqgD2hEfrucykFH0idSVT/WUSuU5/m1Yq1FBheY+c17a7pdBvGFFjBlU8fhKyVG4v54rc8KBK35HHa+rlnqnYfb7kkCTmFZwQliEhOBnENKmkthYKgxk/vAENaXAn3InzlJPskxyXz9hOaaU6wPxhNkGy6QUedvYPmYwHClL4oga4RW4hKJKRGM7EbcecyY5G0z4SWKOXrcELlpq3NEBBlMJhUmlmWqpDhvaHzHHOxh9aISe8eDqHtT80Ut1VmHgCugwhXc4BnZ7FE/fO20vVoNURVKuW908dHWl1miy/ph2aK7+rKhipLTFsKLlWR+xY+N0e4qr3Y07wwokwjp2haVUOVI1jntreIr8NB4nzSyE3MJHMfsIqLp82O1zYVVj9Bz0Jm8ZQtnQHaxwWrV+RX+553vNjkhMhvbqgMnm7S9p+tMBn/mFNnDNSPRSaGJF0CBKm9hKMcsIsYOC8qv1JpegFaw3QVyh2fCf6QZvg+1OpDzlG6vchjpb6Z1TBdvf118pCjpB3MuVosFTEfc7eekS6N/FyhJ3NEcSnYA0PvDGunECzOV/gIgihgikzrPnMtA0+KgmbokDFG3e0Mzc7Z6Oel1BEGe76dkT9TPu2/QXf098iCg4KmOHzhkRAEaF0vH01ZP19cdJooARJIEk88pCNlIOSNaFvSH2UX8IygGgbcKR1/4vIPcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(39860400002)(366004)(346002)(136003)(376002)(316002)(38100700002)(66946007)(52116002)(107886003)(6666004)(6512007)(9686003)(26005)(450100002)(6506007)(66476007)(38350700002)(86362001)(66556008)(33716001)(8936002)(83380400001)(44832011)(2906002)(5660300002)(186003)(8676002)(6916009)(4326008)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7WRIYlvq14VZi7ny1B51v3fkHgLT6MPh/TX4iAW+8Ppdknp6nm4iwLgw4EYp?=
 =?us-ascii?Q?p4xULLGuR1DQVEZQ9uxHf31Tt8IGxoMC/E8BQ1KmB+6yfavVkdGDTpDyWc2z?=
 =?us-ascii?Q?N85btQQnEuicJ9mN96HCdGL08kT4EMpuTvY0qDiv48y+OGYwC2zj8r5mcpy1?=
 =?us-ascii?Q?pzqgsNfAAfG5YHp8A2MElXAIMeO3Z8rwKYpZ0REKWLjR3il55QYcl7NqPmu2?=
 =?us-ascii?Q?R5g/5JAuNR06qVjaP1tPqB8zYYpGwvD8wagrCJxFNeWKnzpru0Ao7mn2E1CF?=
 =?us-ascii?Q?vHLQrEPUat8Fhx4gkD7U49kwg0wdgmzpj9YXs89dFrmlBJDPSGuS6KXMLbTt?=
 =?us-ascii?Q?8voRgjdYmSHawar6SiTKvNaSRzhNGZn5xXWn07LPnKk7yrjcwWtCo508Gxmn?=
 =?us-ascii?Q?HXReQm55l3NioMr5ifDBryKM5Yi0Ajb+0Vez29RhG8Fd+C30JjPPPnTnXvU+?=
 =?us-ascii?Q?ljIY03c7K/bennVOk0377yFsLcFMU7VHTh90LBhaeyENrXzrZNLH+zgwSR9p?=
 =?us-ascii?Q?CdC77mtXb66o0mKcDyZleXVzM4ozL0GFYZg54zSd74aV/YG9iHNSoDrBN/l6?=
 =?us-ascii?Q?OxTV7epVxOhtNyMdj65GjbRx5V0159QOMa7pC6CZ8iZfa3V1zP/wpI9p91PC?=
 =?us-ascii?Q?decuQAOHxW13mj9nSU5sK+r32XNElRtaIr0/It4TNMPaHvXnD2RhYurjVbEW?=
 =?us-ascii?Q?le4TLI4sx6V+u1UcIjsu1KJZhzWxi2VcLajIhTxHH/HHfY8n6saFfXC4zphN?=
 =?us-ascii?Q?fwY0CHy0OGaBDOhizHVtO6ka25IkhspsqFv9nClYGMhRl/k8XlfrCTCj3+Bc?=
 =?us-ascii?Q?ijuR324YYeiAtyEtCc2FxvTp3Sem33hfBlZWRLYIpEwQgPk3X+rN877t/gqy?=
 =?us-ascii?Q?TvOGANb08xB8vvh8Nkjv112pgk8zqpvjspIbjDKdIC5V7nH52+Xm7M2szjkX?=
 =?us-ascii?Q?2Ov4bg+Id8Ns0sq8gnazNoL6paAv+UMQetGowPKMUCmDqHJ1RjIDwtez9Pnq?=
 =?us-ascii?Q?6H7Vxpka0yelXq28+VlR3SWzM7aFSOmt7oJXr10AI95VgOqHe1l2g0aiVOEs?=
 =?us-ascii?Q?mfrElcH2e7AcfQvSp42Hb712e48CefxX1S2i4HVBN6OtC3b9fQG803rtKRAf?=
 =?us-ascii?Q?GS80VDAcp4A3oRjwqslGRB/f2g954Eq6imf4mVpDAwtxTKrNWjQPrPAg5F3i?=
 =?us-ascii?Q?XBu7+DOkWaPBX7TVh6FRVsW6gpvDIxuseNhoh4FwhLw6Gt5Gs8JXXhBwvz/P?=
 =?us-ascii?Q?h2hJW65agwkBALjKDKOEBdGZKIavDArUWlwXh6HBW0G/vPWVdYUdJPbGVuPm?=
 =?us-ascii?Q?lL2eExYdbXviZT6DZeEKNqRpDofUSom4JPLtMIVd7VIWZpA1PXQ2pZRrE2xe?=
 =?us-ascii?Q?SZs/GKKxtlHqhm79z1++ujB+2SPWF34fRsRrpjLM49rVFmzSQSshwpdfgsii?=
 =?us-ascii?Q?BBevZMzqPzkeJkiOc/c/9JCjIIyuhm+6ht0RG1o/aP/1+9WbvO/WN7xm9+Au?=
 =?us-ascii?Q?OYXNTdh8sPqK9PlTA5SYDPMfoaG7tlSe2hlvJqsR2//qVyKN35qRtVlP6A5S?=
 =?us-ascii?Q?h0RBMAVT+VSLGsumfVW02x0zhB8ApwQikufRqPtr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68db4d1-9cc8-47f8-ca7f-08da8991e930
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:41:40.4554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trhznbIU/dNaL6N+305RnsYNFkd/CFKjl+w4k3F6RAyV5dD2lZti8yK94RiiJReT7QH7vkeslPFs3MnZKGVpD7F6jKU+JK6syg2a3IqSzGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1456
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_03,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=675 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290037
X-Proofpoint-GUID: AB7WJoitkaOuX3KWJgbDlG1l7uj74qvI
X-Proofpoint-ORIG-GUID: AB7WJoitkaOuX3KWJgbDlG1l7uj74qvI
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [bug report] fs: dlm: trace user space callbacks
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
Cc: cluster-devel@redhat.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexander Aring,

The patch 7a3de7324c2b: "fs: dlm: trace user space callbacks" from
Aug 15, 2022, leads to the following Smatch static checker warning:

	fs/dlm/lock.c:5900 dlm_user_request()
	warn: 'lkb' was already freed.

fs/dlm/lock.c
    5832 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
    5833                      int mode, uint32_t flags, void *name, unsigned int namelen)
    5834 #endif
    5835 {
    5836         struct dlm_lkb *lkb;
    5837         struct dlm_args args;
    5838         int error;
    5839 
    5840         dlm_lock_recovery(ls);
    5841 
    5842         error = create_lkb(ls, &lkb);
    5843         if (error) {
    5844                 kfree(ua);
    5845                 goto out;
    5846         }
    5847 
    5848         trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
    5849 
    5850         if (flags & DLM_LKF_VALBLK) {
    5851                 ua->lksb.sb_lvbptr = kzalloc(DLM_USER_LVB_LEN, GFP_NOFS);
    5852                 if (!ua->lksb.sb_lvbptr) {
    5853                         kfree(ua);
    5854                         __put_lkb(ls, lkb);
    5855                         error = -ENOMEM;
    5856                         goto out_trace_end;
    5857                 }
    5858         }
    5859 #ifdef CONFIG_DLM_DEPRECATED_API
    5860         error = set_lock_args(mode, &ua->lksb, flags, namelen, timeout_cs,
    5861                               fake_astfn, ua, fake_bastfn, &args);
    5862 #else
    5863         error = set_lock_args(mode, &ua->lksb, flags, namelen, fake_astfn, ua,
    5864                               fake_bastfn, &args);
    5865 #endif
    5866         if (error) {
    5867                 kfree(ua->lksb.sb_lvbptr);
    5868                 ua->lksb.sb_lvbptr = NULL;
    5869                 kfree(ua);
    5870                 __put_lkb(ls, lkb);
    5871                 goto out_trace_end;
    5872         }
    5873 
    5874         /* After ua is attached to lkb it will be freed by dlm_free_lkb().
    5875            When DLM_IFL_USER is set, the dlm knows that this is a userspace
    5876            lock and that lkb_astparam is the dlm_user_args structure. */
    5877         lkb->lkb_flags |= DLM_IFL_USER;
    5878         error = request_lock(ls, lkb, name, namelen, &args);
    5879 
    5880         switch (error) {
    5881         case 0:
    5882                 break;
    5883         case -EINPROGRESS:
    5884                 error = 0;
    5885                 break;
    5886         case -EAGAIN:
    5887                 error = 0;
    5888                 fallthrough;
    5889         default:
    5890                 __put_lkb(ls, lkb);
    5891                 goto out_trace_end;
    5892         }
    5893 
    5894         /* add this new lkb to the per-process list of locks */
    5895         spin_lock(&ua->proc->locks_spin);
    5896         hold_lkb(lkb);
    5897         list_add_tail(&lkb->lkb_ownqueue, &ua->proc->locks);
    5898         spin_unlock(&ua->proc->locks_spin);
    5899  out_trace_end:
--> 5900         trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, false);
                                        ^^^
This is freed, but probably the trace code doesn't care?  I'm not sure.

    5901  out:
    5902         dlm_unlock_recovery(ls);
    5903         return error;
    5904 }
    5905 
    5906 #ifdef CONFIG_DLM_DEPRECATED_API
    5907 int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
    5908                      int mode, uint32_t flags, uint32_t lkid, char *lvb_in,
    5909                      unsigned long timeout_cs)
    5910 #else

regards,
dan carpenter

