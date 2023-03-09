Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF36B28C5
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cUIY1RaIBsBmVMG9F4zD/0ycBdiO/jaF6bDroKmJgog=;
	b=MxpQ9zjxt7o49MPtz/sHnIR/z7kgUHPidi9I07vtOPTBGHWyyw9QIsnjiTSTWzTMgrVu4f
	SljIuNc48JOsdzQwrL7JtuDkA3l0dT+iF8NrtJdYnKbEp5UhSY66KTK0O/zfXEvPGS6MU7
	v8EYzrGRJSvVtRHBK7CJIHqzTF84PkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-MePjB8VnPXqjz24K2DWGPA-1; Thu, 09 Mar 2023 10:23:55 -0500
X-MC-Unique: MePjB8VnPXqjz24K2DWGPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71D158517E8;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64E43140EBF4;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 232CE1946A49;
	Thu,  9 Mar 2023 15:23:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9EEF1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:23:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCE89492B05; Thu,  9 Mar 2023 15:23:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B450B492B04
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:23:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 562873816930
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:22:55 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-2-Dv8M9NMfK4wlzCN2fSgA-4; Thu, 09 Mar 2023 10:22:50 -0500
X-MC-Unique: 2-Dv8M9NMfK4wlzCN2fSgA-4
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:22:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:22:16 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:25 +0800
Message-ID: <20230309152127.41427-4-frank.li@vivo.com>
In-Reply-To: <20230309152127.41427-1-frank.li@vivo.com>
References: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a97193-f5e8-4681-cf1e-08db20b21104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: au3ShEGDkB+EJng6ExCV4irih+z00QukWDh7Spxuy8qWzB/QKoK+CueEysS5/nkcABEu97dp/Qs1ayTZzhXvAsz9S9kDnJ9o4/dHCcLL6dw9SPf5Hh4swt8uLkao+3K7S5wwcpy1DLk4a8xtZArks1bPI5ZMPJeW0haZ57YnTWB0rRqryMEVq6DbIVnurNfBzQ5icFtLdtShWGbEMV43vrusCNvgtnRmBgKF6hE3XyLcbLfKIsz37ZcF+EChLDwf4/OCehLxwb21SCfphgueLuG74tRWKFUvywa+oU7Eb2NTNexAR+jwYzyX6c2TgKlLPmcYXDhfrCPNyGCrLOKYBNV8vBQvl89aPYa11VAuphzsWWcAe+egWE0zTbt3mAlePpoWWA2I4ys5K53VJOnHNia/q3EEhKNoHwnkMvnJaeVvPZfvg67OqGMl6MW/k7DHEK1gKJCO1K3VpMU6myXOcx14YWnXy6dEDMHRGm5ZFsRO6qxOH68vNA9azbeqackX2YB5T3dDUXQXpt7zMIxD5dSwIr57AlU7zZOAkXqHSDFTkqplNXvSpouJkFeXEqKJKwxJTMDb9QxBnXUB5HpmxQ5vLnn0lKbzJEnhKhEDSf82myryXjrQACiQ8cK0HRXVJ/u6rOA3uUeChqurd2UW+Q/cDRvDtN80GGof5sWWSigsnvE1Dy9RKEZpexV8NKFBT+96mHy47d1TUq+CaobJj7utACDMN30INvL0eQEUUsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(6666004)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J6UAysLpoBieQVl74u8AD7N6g9pZBKiK9aoHlx5UOs8MzLg5kLQAIpekTjxX?=
 =?us-ascii?Q?4lkJHJycoA2byXmMFtjX2TsjltV0IDzQrko1CniKcojXQZ+v2TrQmQysu0lt?=
 =?us-ascii?Q?zdXL8ljZdkocXRUHm/+ybfnnKpgETDprT1p9VBnwxemoD5uLM8RECM+N8sZ5?=
 =?us-ascii?Q?naSyUzw+A8oLwjmvMA/eiWRruB22HXVEjR3bTi/lcrIiNR5vtnJAZS5t2xsZ?=
 =?us-ascii?Q?g3Za3gWYHxwYvnRMG/yi3P1AhGdMqWpUPVzL0sGlRQ4vQ/PQBmT2GUlCRh+G?=
 =?us-ascii?Q?A+cL0oyZJbxlAAwYiDwhDCu0UafTHkL9xs7O8nZoHsl2QRl+jujqRUWVIG42?=
 =?us-ascii?Q?XRHOU9qKKNoKQZG5wVXDTzcqanWuFBB7raXymFm0c/OoJ3Kd6Z5p8XiPLHj9?=
 =?us-ascii?Q?LH9eaC2twO/OKmSW51mhB54DkGDeaWFLZqBj38Xx3TdzJb7Cn7tF5guYOAXM?=
 =?us-ascii?Q?IgvAhDov3z8cLHwf4CWji9dzPEQriP4nzkp1N95//+/jpPenjCkF1kSz1Mjx?=
 =?us-ascii?Q?sMATQ7yfA+EBdy8GkcMcCH3HMiOjJZccNIC5JpYxKHvq0PUVTcVcvfPytpPc?=
 =?us-ascii?Q?0HktKrFa7QZskRqQYW6g3bovglr2xxcyu6z0ICD6EldkLMCYdO4vAraojnLG?=
 =?us-ascii?Q?49+FLyfnDY/MevPee1VucvV8IyflvFHGBdzNExocAcVb8zsKQzmDSd6GECRF?=
 =?us-ascii?Q?+l7RwdXSKiJS3XBNs+5JpPU4Q6tQSboOCFBtrDsQs1YxmzNyh2lbHkmINO8q?=
 =?us-ascii?Q?zLygGxfx9I6LoOdHuSZS8zP15AiGVP+WAR+XunpUFlIGjOtR7O+9zXE8G/vC?=
 =?us-ascii?Q?GA/6/VN3h06M/c3SAbViv49673AZkrR+lz8s13DFp2wNNb1xKH2IFYdvoZsY?=
 =?us-ascii?Q?1aK8DODNZgrcyZ3OlQ8Ds6hL43wzmloQ8POFYZORU76s8qjE/BJxMXzU0FmA?=
 =?us-ascii?Q?ipxJ5xdsvp0BL5j5idevrrzlB8x6ECMKVY//n+MaxbJbsFm3b4bBYqYS570X?=
 =?us-ascii?Q?7nkjw6UB5+mwdst05L4wRyJb3NZdfLETRhPX+AeNQB6VtC12p9L/tbcFW3e9?=
 =?us-ascii?Q?6ZLl4BZUf5G5wtjAzEfcGXs8kof5NnwBllBj0eXjPZXYUk1RV56BD9RzUC+5?=
 =?us-ascii?Q?PBkY0fi6uZ7Iiis3nwEfZEfG1BynaQ58PRRALgKZZmaQ+IwMSO7ZRM8aBhR/?=
 =?us-ascii?Q?PVm3f11wFnYJXlkcP+SLUIMEZddiGZtu1R4noim9VD0i1NORnPcq40+XOzKI?=
 =?us-ascii?Q?Dox9R3kiUx1O/r49xPnUCBcnGjxlChXnd/NJLAxIizoHT+bFdVp+ZKBfc8Ks?=
 =?us-ascii?Q?Xg65Zui7vsYSmzn1rbWmPUgD21S1ab33ztL3fOsc88aUqYm/Z4V+A/DIjSyy?=
 =?us-ascii?Q?7fWgSrwQVmsVwItUsU6v5AOMTSHiiZPME3doyCBxlVFwF3/m8L905Shz1ViG?=
 =?us-ascii?Q?PUB9P6k7J85M6sYM++MuTYjzZd1nB2kfmRN+dL3OAwlAHyfPv3eSHnYzq+IU?=
 =?us-ascii?Q?KxfuPhjA0JMFnciEOGmmBvrX7K9AAf+3b12H6LUMdpFjVEiMj2gVyrZtvXG7?=
 =?us-ascii?Q?c0xlQiWx1yN5eil2jKEmXjrQY2L8XQIegV7cGVmF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a97193-f5e8-4681-cf1e-08db20b21104
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:22:16.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faSx+15nOOVnxKx09cjuIr/fJZJg5x4PEYIAtclVHogsw9WqPzeR+hciF7EE/sTXuOlHCF7Jw70/lfFxIfKYDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v3 4/6] ext4: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-none
v2:
-convert to i_blockmask()
 fs/ext4/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d251d705c276..eec36520e5e9 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2218,7 +2218,7 @@ static int mpage_process_page_bufs(struct mpage_da_da=
ta *mpd,
 {
 =09struct inode *inode =3D mpd->inode;
 =09int err;
-=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blocksize(inode) - 1)
+=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blockmask(inode))
 =09=09=09=09=09=09=09>> inode->i_blkbits;
=20
 =09if (ext4_verity_in_progress(inode))
--=20
2.25.1

