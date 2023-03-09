Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A00446B28C4
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABdlfFKTz8tsHt7W1qoxIUIRTGDXM4d17eYJUf0eVtg=;
	b=eMqIm77oy0IyuQ4OoayN/to7ZNr+BMgp2Qq4YMM26XVkRC3j5oQ0dssc/ozFay3o6hGzqX
	W6jpGPod6NxJyFKEZ2qVZjpzwldHlmRkSoP9fKFNiPK3Z7HdOJy5mure5nPwQyGaBWJi1Q
	s2hfbGW3+jldf89sUn3Ctwpd4pdHBLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-LnHGBnRCNJGuDrOfGvYQfQ-1; Thu, 09 Mar 2023 10:23:49 -0500
X-MC-Unique: LnHGBnRCNJGuDrOfGvYQfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70A6D84B098;
	Thu,  9 Mar 2023 15:23:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 656352166B26;
	Thu,  9 Mar 2023 15:23:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B8F819465BB;
	Thu,  9 Mar 2023 15:23:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 00CCF1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:23:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8552C15BAD; Thu,  9 Mar 2023 15:23:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0277C15BA0
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65B891C00402
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:16 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-DfbQ-sFgNtuW_gQx5SwZnw-6; Thu, 09 Mar 2023 10:23:05 -0500
X-MC-Unique: DfbQ-sFgNtuW_gQx5SwZnw-6
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:22:23 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:22:23 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:27 +0800
Message-ID: <20230309152127.41427-6-frank.li@vivo.com>
In-Reply-To: <20230309152127.41427-1-frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c74165-0494-4652-fce9-08db20b21502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: MRTfHU0Gm1HEODi3Ljfa6O9bH5g3gFJJw2IY9HPW3uhYS8xluRXK3a23y8m8IgGpmWxwOXO8E8KLYy+VPoBInNSZizmgycC1HobhuNxh6HiJx5AMMOoIulhfFQAWAFzjndOrHSp8c9vSSMNolIjb367EG0oMFWN0HYDIEfK1BQurQlaRZHJV3vNpVTSLkOSJZRQEyAFDQ6oHwbuZI1t2AeP15GDf5O2ynq7sDEdpI9NqjL3KLPVTuaqNjK9DIV5I5LC/oymeUMsaxjyVYWHSPSXk2WEGSKQ38258mo0rbm/D7AVn8ndkoIs40FByzSU0RZSZf9yTD6rR0oe7XDdndhCoaJKgu4lZYY1vOl97vPr1GgwedDE9/H8A/RQe6Lio38lolz8WtPT1ZEQZzcowBk/GChGIRrX7gKtGUYM51W0mCSL/i3vdI4jB1+4BEVHfGTkOBs5wrtiO/y9RA5B3Nd4tWWAhKXaTRVuZZNtU0iIwFCwlI8OAIF09P9oxuwZTmiFGcJ5WF0l3zSJKtr8z64jtQYwXmjWeS3uUX6Hpi64W5B/rQFW5G7sRk67qcSTRUenxnJQ6LKIrh+tcvfGaUQqK8c1uLGtOA9YMNEx+uCv9GxnfF20XPUpHYE16U0mXC0itvE24Kr4CR0PACS7VAgPYyBC/pnpb2l9zl1Z8I86NpwOBRmz9+ZkR76uDHqbjUm7Z0Uyr2LZnmBSguI8CukAaXN5HBOjNXq+b4qhB42Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VRV+D8aIKWmOGzclNTNYDfgBdfCsAsuBCvKpSVpY4ZJpFbS2WGAP3XmgSIV8?=
 =?us-ascii?Q?g/ZEryBB9wvUAryFpE/cFw79cv/TZkRBhp+VJ4A0li7G1wrv4fTIDlmnx/St?=
 =?us-ascii?Q?bbruLtiD0yubpbSI6fepTXEVkBgW8Upl0ugu1Jnfj1l63dkPnlzRdJRr/lkY?=
 =?us-ascii?Q?M9KSZixEezHDYjQR76WxaKvoJqLLEZMtrewb7gJwKLVhxJQ6zpSdga6G8tYy?=
 =?us-ascii?Q?TklD6Q6ByqqzB+18zioLAcU7bEIQGxLe9mX1/OOL8hc9Xu6R/hBTPYQqoy3S?=
 =?us-ascii?Q?eFMrRWt5RiNq0RkzkvTrXqP0eWNKymOSGtqcqG44BGkK9n+rKf26J9tr8snL?=
 =?us-ascii?Q?LCtJRC2VWbkwcfIkBHxEPoHYoTC3xwIA7CTZZB+VKATw/NFq+rdGTXkvejiL?=
 =?us-ascii?Q?SZPSD/yMT5NkiKJXQqeGnzbSFMXMk7PRwMAnJYPanYhZe0608lNeZiqUvW8O?=
 =?us-ascii?Q?DjmmSgi1Y/nZN/cW6q25pRCKDxyeZaMJ0YIpSC0msFpQ7TKTiotej20kyqIB?=
 =?us-ascii?Q?6OsKK9aBF63ANMi15aZv9DP0q9vL3pS+ZBM9/Vc0IGBDOaeLah7Nn+XM8ZH1?=
 =?us-ascii?Q?pvAxgajUDvyvk91ePNhuivBmisvk2NDma0vrFgEqIvD5PwHhb6tyeKtEJZW6?=
 =?us-ascii?Q?tdCnO3HI4N2hojM9MdA6tMErTWzo9D09fMBxwtwhiQ7nX8BgaSuHBE6Lr1We?=
 =?us-ascii?Q?rwuo/nLam1a8dEgJtiNtsKpKn5LPK4Wzs6jYPpsjNjMfn0ZWJZiUbHXr69Ca?=
 =?us-ascii?Q?2yN02x6iYlEK8KG3bIxJfcG5e67ddkBgXl5+3nOPIBp6+Qk1BagAO8V9/DWq?=
 =?us-ascii?Q?7JcUihraDqMlc6TB/EZsOeV+fylmMk4omEmwHKX5XCgZoQVpY5+J2itJdhag?=
 =?us-ascii?Q?HpetS5CoqXc5EaHqbBgIKlwEYXLSTklTUV4t+ZFOfb57ZnDTYj8e3qj7XD45?=
 =?us-ascii?Q?EyXAavkcBgBdwTzuVTqWgOICLmKjGRyIWgl7Y+6WyjQkPz4i/jvRYmSl82VP?=
 =?us-ascii?Q?U1x5zd7kn9G/7kxLVFbLwKTAQUvsU2NdR0/1QjT75RlTP+kbMDoVkK8oNvCt?=
 =?us-ascii?Q?eRSD8ezyOzl97uN36seO0YaMvFm0EPjqlh4fg0F/lWrLvgCBmQIBqpkNrmA1?=
 =?us-ascii?Q?PnJOio6WE4cM3TEmrc6+8iUNi2Gi9tnHaxmA3xiYb5UIrkoPLQXdApTMr4pU?=
 =?us-ascii?Q?KwRRwmE5QVCwMAA1QOaP6x9mzUBEj8sqscXef9+w0WuocvkuZL6ZbeUqxU4g?=
 =?us-ascii?Q?m0bD9Lrissn7tVKNZeIvhzyfE8vjf05D+SFDzI/SZotye/Vw55JMVTl9FUUJ?=
 =?us-ascii?Q?/5KJrJJCl3MK4HA5WPbRboWy3oiMNgRok2YfCc6eqpYeSWwULgrImjiaPqHc?=
 =?us-ascii?Q?9sN48rVME6aTQvbNcC2QmCDm20j7ZOjDrjzaFcTrFLBuHuuWwShq4s7bmbGn?=
 =?us-ascii?Q?7NbsqO/RRwAKr/FBBXojj4BuYH7HRtcfobHkefrf0T4NODyzQVxlDJtiqS84?=
 =?us-ascii?Q?ymvXKHVag4LBTuZukjiCevVx/NkjP1xoHu5Ng2KP/purCpeuOBSDqha2Vohb?=
 =?us-ascii?Q?96UInTivnktiMxiGg4kdvj9zWJC49ddJeXAquSur?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c74165-0494-4652-fce9-08db20b21502
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:22:23.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwLsINpxtBm3ouemSErTJcMc5WkWVEC2EPQ7vFF10iaOcViQfcsG/LK6F48BJHDGgzO1bs6r1O7WX1uk5r9g4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v3 6/6] fs/remap_range: convert to use
 i_blockmask()
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/remap_range.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/remap_range.c b/fs/remap_range.c
index 1331a890f2f2..7a524b620e7d 100644
--- a/fs/remap_range.c
+++ b/fs/remap_range.c
@@ -127,7 +127,7 @@ static int generic_remap_check_len(struct inode *inode_=
in,
 =09=09=09=09   loff_t *len,
 =09=09=09=09   unsigned int remap_flags)
 {
-=09u64 blkmask =3D i_blocksize(inode_in) - 1;
+=09u64 blkmask =3D i_blockmask(inode_in);
 =09loff_t new_len =3D *len;
=20
 =09if ((*len & blkmask) =3D=3D 0)
--=20
2.25.1

