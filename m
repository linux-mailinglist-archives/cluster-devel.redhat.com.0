Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3766B3640
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 06:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678427396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P29YRcF794NKxi6MOMOG1loUQhA9buIzrs9HnV6u7dI=;
	b=If3Zr80kOJIDl8WlVRcyWXaD/rztJ1aFbOtD4k/6Lgtsx1YBPFcfw4aWrnOiOIoCx6XHQZ
	rz6Uta6Tx3o1iOjETbq3gZZeYgztNG3PWke9DgmMaG0JMzZ5dGNstcs76Rfal6ur5Uo+N9
	B6afDHZCFWwmsscuGvXP71iI3A5DhyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-XMW-2WHQMZqeWcks7upGxQ-1; Fri, 10 Mar 2023 00:49:51 -0500
X-MC-Unique: XMW-2WHQMZqeWcks7upGxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C61ED85CBED;
	Fri, 10 Mar 2023 05:49:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B859A492B01;
	Fri, 10 Mar 2023 05:49:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8921A1946A4C;
	Fri, 10 Mar 2023 05:49:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F110A1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2A2240BC781; Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD1440C1106
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BED64811E9C
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:49:49 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2104.outbound.protection.outlook.com [40.107.117.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-PM3m54n1PuyTTXR4kx0T9g-2; Fri, 10 Mar 2023 00:49:46 -0500
X-MC-Unique: PM3m54n1PuyTTXR4kx0T9g-2
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6023.apcprd06.prod.outlook.com (2603:1096:400:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 05:49:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:49:13 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 13:48:27 +0800
Message-ID: <20230310054829.4241-3-frank.li@vivo.com>
In-Reply-To: <20230310054829.4241-1-frank.li@vivo.com>
References: <20230310054829.4241-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e9e2ca-c6bf-4ac8-d9e4-08db212b2d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: jqOXpbKKBVqWpr0dTOVpkjybpTY4ounv9sUogJZZ+14GmnUxIJP3zAmXaF2q5jNmCgcVri2kQICUNGngkbcZxAQ7Z+/Yc3jMCy+Jbv6h4FByrtNlkrjEkirZ80P7SjsgDFmy1/sWGYvMGaYx4Wna3Fup/i97OQal/uyWBENzCaZlKjWPBsPxIQxuu5fyUkvqtUjyN3CHVCZ3xEQ6PWSqu5RmcqCyQ0fSlLAZ721hSEyFvUluxBxp7s+TrrNKu8GRfjIF07fJnC1GiTq1w02QEZ7dsvYDgNvXsGynb9o3D+Q8/g1acv3PVbKSMt+HvZjeT+hn6Wuvw9YWgLTXZb0LvoWVy4HOXVZrQkhuiR0Ljcl8hvZJF26EP8nw7hG2WnRzS0VWDFZe2NhB3R7NMmdWFKgiekq1Ozq7ksitzlajfKhpJ8QdquNxo2lEQ4thaD2cLHx4gl8edCG4Brt4JjLG3U67LD1JjNm7b7+pXNS9RHhPDMB0U5hmNivDiyWvNsUZPGv1/VFV/JuprsH1D2/+5DMpaCoZPZqQeoeLs5FcXryDDVxY1HStMQxjpJNDUotM9bSuZDyD03EjGEGOPExZXsgWZfcWimjYbbVvB+5olsEBYlSKEfhZcZyunCRYgyGwgznuKS4Xk6sEDYqPxOyfpyFZhv8NTed0731r9jsM7X/6LkoH5A/Je5jON8yAwjbeGfdL4yyRW5f/On3MCbhVyzO8k6ybrm5Jc1d7RxUgtZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(52116002)(6486002)(1076003)(26005)(6506007)(6666004)(6512007)(107886003)(186003)(4744005)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(7416002)(8936002)(5660300002)(86362001)(2906002)(36756003)(316002)(478600001)(921005)(83380400001)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JvqmstesADRGcqKQDYSmBc/deP9207tey/Q/upFcxNOzhMB1TFJ+wldA2z8?=
 =?us-ascii?Q?GJ+NPJj0DtzgiUazSSreJj7+Zap/ChQIjlYh7i9ej+r0SHKGqPS2GkQ/pAHt?=
 =?us-ascii?Q?rrkyPrTaoCkroed3+wpT9DaBqWS5GXrxRVM6zSOj24yE5Szmjwku2bQ2Tqaf?=
 =?us-ascii?Q?8xhvR2P/Mc5XStyKJm0errjJmqU66o0CPrOfpoXMqanCfxq3n4CvNcdEW+yU?=
 =?us-ascii?Q?ZIyOfsurcRPJittQetAvrrK1xkWa0ABXA04PNla0/S03n+6tS6l+fLGq+/5K?=
 =?us-ascii?Q?fXgWcH3ZxcF35sfAWFHYEAYN3Dm04cz7aIA3lndtrXKJbsoeKaK5utWGl/j5?=
 =?us-ascii?Q?7EDIZ4m4hNIn2B2pcBHTNqlowSO6rQz1q2yTq3nVf0EcUfErADRixqq6xoYH?=
 =?us-ascii?Q?MZmPyJdnAWAhzORoNKI/bCgU3Z7GBaZejgvwopniG9hbEnSukC1ImKQiQH10?=
 =?us-ascii?Q?54HEaNydDISy2Fro1nmwp3BtKTD+d49TxMxqlVDdEyduQ9xwTHcrraaRICUO?=
 =?us-ascii?Q?0TMaoww8C3IyOBq0aTsybHD8vY24/+f/DWFHv9HKHCtdWUvmbCvjaN04FIm3?=
 =?us-ascii?Q?NkQYPciOtlVKLDAV5NIaIUfA/R1baxJ2aC/gA+qf/ahQ48WtN14ikcEcu8vP?=
 =?us-ascii?Q?Hh/ZrB51sPlpec8DsC5tGcaS6We2IzuGUaSA5xUKXL2JDL+UCg0IBIcwiEzV?=
 =?us-ascii?Q?/h2qEYvhDBQrzPEuClG9BD6xsYbuZahS+UDhVHV2jy5Ns0dwTo5P/CPagrGD?=
 =?us-ascii?Q?6hr6u/q5b5blPPgBvSvhN0fnenmhfz0UuezU7caHCkYPSxUsJAkNMqt7BCV5?=
 =?us-ascii?Q?JymTSHeqiv7VJ21qOC2rUmQ5MbKE1/EBgcQ0Wbwra5Gne22OsVh92FNH3TP5?=
 =?us-ascii?Q?9U9d5G7nZP6+C9BQYcgRNT1akHpNKnhe86X3o0akq0xHXrpECfwU6I9Lp9m6?=
 =?us-ascii?Q?msVXmMafscERDv7r8QjWyNYDXGDzn2S6qSP6WEdQK0fDz28EWR5lbrZVvW8S?=
 =?us-ascii?Q?nf6N7QInlCdH5Ov/HUoRTzPCw8Ca0AudjdRbxR5AkMLz5Tg4QqiCCilY+q7w?=
 =?us-ascii?Q?YksKKW6r6dS2sgjK9wXvebL7TBWijzI0LbZjixIXGndY8S1r6cnNGZPVCBdd?=
 =?us-ascii?Q?HYg84v8E6Pgj8G8lAAbEIUkmg24SpbiHnKjrstqoSIVIefVFAaAx0CjS6gD2?=
 =?us-ascii?Q?lr+mpQ15n+MTA1MGywnqjb2AbFV84ErLL1Celyrxt05R8gQlSZsnrnAqXfX/?=
 =?us-ascii?Q?UTaL3hYAiHTHCe57W2mDDARZO8dRSCEY7sLK9D+3qJmzUv0KS+zUYV4lXvkZ?=
 =?us-ascii?Q?wI29Gjj0WlISAMFBPoz7dld6xXU6hSxiec7aLITC3ZgKkOJSltb6A3PmBoyt?=
 =?us-ascii?Q?/Tsm6Zk/XJTs+y70upzL8vSmC9QFsYEDNe/hp2BJFdsoTz1BTws4c5V5r2Eg?=
 =?us-ascii?Q?Zt/bhwWb9H7e002cXIwEToeYG73IalZ10jeYTHWLLEolZiHAHddcD1YPfmQo?=
 =?us-ascii?Q?DuYX7PMN8aZJVOOFBHUhw2kXl4rG4HbLXflN3p1rzndEyrb8om+i7tEJthp6?=
 =?us-ascii?Q?mkgf7yhUII5bKH5X6HaRU8o4F3OtahxX57cKp1il?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e9e2ca-c6bf-4ac8-d9e4-08db212b2d80
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:49:13.5817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkZaT5SAT+VtFLn5GdMdMhP+iOBx7jEePtaccpqasgv/WkwLUSErXAHUKqvpIVncr5ZnpLJApNGFlGDdVflQRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6023
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v4 3/5] gfs2: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index eedf6926c652..1c6874b3851a 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -960,7 +960,7 @@ static struct folio *
 gfs2_iomap_get_folio(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
 =09struct inode *inode =3D iter->inode;
-=09unsigned int blockmask =3D i_blocksize(inode) - 1;
+=09unsigned int blockmask =3D i_blockmask(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
 =09unsigned int blocks;
 =09struct folio *folio;
--=20
2.25.1

