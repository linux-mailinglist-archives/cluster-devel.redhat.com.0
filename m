Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A76B363F
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 06:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678427395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9gyj382XTRS9jaCZ1v+dGsQp/c3cjVPFyaOoxsr5rA8=;
	b=aI+3EEXSPwCVgMvjt2twLCsao0rJGVPjR3w1HdMn1ei4Mz2jaw0nu/y+uhnb9xrSrdScI0
	QjJPnlB6+/dQPvH/knxzKSCf3+nzAbddxSOhEhvr5JjuVzafpOEWN55uKGpo6vOEnW54g2
	ZtKjXKuLnZmE/iZzGGoS6ZF4MDIKx0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-YMboIsZEMaWnKuWe_vyIAg-1; Fri, 10 Mar 2023 00:49:51 -0500
X-MC-Unique: YMboIsZEMaWnKuWe_vyIAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A639038041E5;
	Fri, 10 Mar 2023 05:49:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C614C2166B26;
	Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CE001946A49;
	Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EB531946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 05:49:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C6C2C15BAD; Fri, 10 Mar 2023 05:49:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CE7C15BA0
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D87F429ABA28
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:47 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2104.outbound.protection.outlook.com [40.107.117.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-9dR8hY7xNYeOTJhR6A-8uA-1; Fri, 10 Mar 2023 00:49:44 -0500
X-MC-Unique: 9dR8hY7xNYeOTJhR6A-8uA-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6023.apcprd06.prod.outlook.com (2603:1096:400:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 05:49:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:49:10 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 13:48:26 +0800
Message-ID: <20230310054829.4241-2-frank.li@vivo.com>
In-Reply-To: <20230310054829.4241-1-frank.li@vivo.com>
References: <20230310054829.4241-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: bcffa574-3eae-42e4-c992-08db212b2b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: F09TohasIhTyNhQn1Q15MARbJIWHM7mi6dgLhf9/hSMOnolpvihaJxOWdp3xoMg1USFa+Ekf5868XXq2Cme489uZw0gqais4IgETkt2naElfGnKzMZzuDH/590c+oYQMBVfNkSX3r2aYX7p2p7iBEP4zJypqhMR/KpQwKD7yaIZ1XJVcUCLeTqZVCSr1+ItA7P1zD2iJGsh1INiyKWBqReeBoRX1yUUpST5LxqXgDhSUFLb+4d3K7IEkOy1X8v97NYtSf1iypG2DKeHx8+lr76x7xQr8qyVWl/fm6GwzLCSWR8wWHPSjQmZd1MMdOhbFOufxCxwhbLUWxSPhJzQk8Im1nM8cciSF7ap10AxlSlwguNKHHWaBNq2vhchbCkXIBHlXioDOeLLDK33B89Gq24Iwj/lKo8cqClk6ULcN30+Q3q9ifGQjruNPNQ4S/y30jzUFMAfM2J9KCrxalgsc4d7c98qU9JId7+70InSMScDlI/1h4nqQSsCYCLPIAQS7Eyt2atI0B++TaQwAjPIo/fBFMiUzWt9tSTlzgSfwlITtDasTnBqMZv4pJtGJaAWfLpOMqFQgPb3uyxC2zScz35H9++gW8Sqs4Lgy33zG5QELdxxw/77ImjOGEN5Zgf7buk0J/Fr5Fdga2ZDRa8f1wMMN6hfK5nt9Nbjk8pi9dY47kFLjQLE+E6ySwKjp3OiZZnoO9j7RcL6fii/AhdsaCCpk9ZiuxjbgWDcl55J3TpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(52116002)(6486002)(1076003)(26005)(6506007)(6666004)(6512007)(107886003)(186003)(4744005)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(7416002)(8936002)(5660300002)(86362001)(2906002)(36756003)(316002)(478600001)(921005)(83380400001)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWt6yC7hZnI+11hk3GMmC8uqlDpn5nk71f5MkLq9/9imI/I2aCaOjrgHQ3Gh?=
 =?us-ascii?Q?wTZpi1Sw/Z3ZVb9umR0DSVZKqz/b2J4PcnL3h5kMfw4bvBdvW39d4prvYWT6?=
 =?us-ascii?Q?OHihxeRUgxdGORDP+9BYGeJhmEFrEkJDT9vf78k4wLOZahpwG7Z2Rm/EPWTn?=
 =?us-ascii?Q?OZsBRLT6nOvkxyHk8rxZ6j5FHykyeoimJ7iPtoqs9OiFqo8uprbjxPJA1Z//?=
 =?us-ascii?Q?iH4NqxN2ScUC9F00uvT21pC+UxzYPfkOZC4UGBePll4UmWqgdVOOK7TKcwj0?=
 =?us-ascii?Q?CQry+6eBRZEWq6yqRTRJmDh0idS6SpO7Ul+uhQcLKL266cOPCFKdNF0Ci/jS?=
 =?us-ascii?Q?3/GTXHjjfY3K/mX5r2H5X1HTpO84rtsNi+yGqUsiJ0OxoUFe6jzB0oGZvWYy?=
 =?us-ascii?Q?zTY2y16xzKvCEZLy1OEnKDEtc6jBFRV7TuHixnY6EA8XC8vvd3D+RUjeDWJs?=
 =?us-ascii?Q?s6eHip0VmrFSPDWWD2l3jf42yMwN4KlGohfZ90NEpbGDb9NN12z9uV8PQqvp?=
 =?us-ascii?Q?O2bPYkvZ7VTytz6IR+CVfAiVA7/I1P5sMb11vrjPiPAt51KwRz03oOQsc2ot?=
 =?us-ascii?Q?wtKLO0H03On7G0HGMWkEY4ZDHpXZ23ppXu62VFS8KQM++5YwQ++Rz6JHwkWo?=
 =?us-ascii?Q?rD7Ka/PuRh98G4X5L7IRZ6kp7a3JeSWGMS/31X0t6PlX6eEJPFoY+VzYOuEt?=
 =?us-ascii?Q?BhxikuskwKrAYBXzkyagQMnRCKXc523jdi0I79f2Q+AdNPCFiwjPvHGvW5IF?=
 =?us-ascii?Q?ir3XwTD1rhbTWNPtlJdctaqGMnMK7gMYtv46FX5ubBfErdRdCXpPOrOSyVnA?=
 =?us-ascii?Q?kq+Si3yCl72/VczEdpnNf4LAHQBoycpFE5P739REe6g16cIVf0g4oHWwJIFL?=
 =?us-ascii?Q?xg91tyDUtoVXdvIBPULYfzCywQ+op1jd6onHzH+4udXKaoUG5tLihJCuOUe6?=
 =?us-ascii?Q?wM3XUkBNuuZhde6Wgr/unyaz3RWge/isXAeQ5dB2C0GTMK0RbZ6PgEN1X3dV?=
 =?us-ascii?Q?3RT/jlhGqTGPRvtvYNVQESuIR1uis4I95fJ8YiRDd7YZF9X2hpsQooQbT8Jl?=
 =?us-ascii?Q?njVP2mrIDGomuLS0lcvjd1IKx7IUGG+ARShd/qIG0TjwClN5Z+Y/Wx1s4wRF?=
 =?us-ascii?Q?UkgIcAEn/2D0gF/+fJimffq1rfGgJRTH5AuDP9YaRQ3cpBYU7SoEsLFATBzT?=
 =?us-ascii?Q?uvyCdWWw20pLUwgyP8TbxXUGqzPiVYj+SU6O3JdGNifVtovKVWvBTvClhPQ4?=
 =?us-ascii?Q?jjAUEj3YGZvjjSFf79lcjG4WW33GOXBriBCUO4+dIL63u2qG3+bXsvewZH2k?=
 =?us-ascii?Q?6eulck6G3w4/9XoVtZRHlUnmz7f+YBHSq8M2BuJQEUOuzu4UC23xTaERcA4j?=
 =?us-ascii?Q?PPjWDb5DR2AvsO518GvmpBzg+nxd6TGZ6kEGrUsA1PWvQ3RMq0g4tQAmEDJh?=
 =?us-ascii?Q?XYyinpzz8pbdlkXRDc5y3MpImr3kr53Q8UzN1lbec3pwLzfofz6SvqTQvB8a?=
 =?us-ascii?Q?BTniycCkipR88m5Wl6ibkSnEcjsFvf/GXlsLfH3///T0GevMkkLyoVwwCdzN?=
 =?us-ascii?Q?kTlidXUjPLrL+udnTbHOVTiAQEKiifqBKCN/rDOE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcffa574-3eae-42e4-c992-08db212b2b59
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:49:10.0015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMtR/Nv+Q3wGPOGsV84uFg0xXL7DCwcUMQwQtzGtUnB2SDvburE9KXj7IS/Yf/16VeWDex7mrHo+JAyGMNTiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6023
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v4 2/5] erofs: convert to use i_blockmask()
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
 fs/erofs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index e16545849ea7..d394102ef9de 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -376,7 +376,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb,=
 struct iov_iter *to)
 =09=09if (bdev)
 =09=09=09blksize_mask =3D bdev_logical_block_size(bdev) - 1;
 =09=09else
-=09=09=09blksize_mask =3D (1 << inode->i_blkbits) - 1;
+=09=09=09blksize_mask =3D i_blockmask(inode);
=20
 =09=09if ((iocb->ki_pos | iov_iter_count(to) |
 =09=09     iov_iter_alignment(to)) & blksize_mask)
--=20
2.25.1

