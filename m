Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 842506B2094
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 10:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678355345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6N9uHASs0FAllGJjWv4bCfWHQVb3klIDKA/TGzU3C8I=;
	b=CDutVkNDmkWED0gCnPaKLACSF2zrX+7hGWMm8iFOX5OuArDv24VyaIbuDfYttGKik8XYHo
	4CIEkHz79Z14k5AXhSM+qRnS655XgaJxyhsIuuRS55PVZK5K0rSNust3kGJF5JbBG3RA/f
	8qc43x1IGVCo81coq+OyyMmRhvWHc7E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-uQG64TYVPpq1UmdENi9D6Q-1; Thu, 09 Mar 2023 04:49:02 -0500
X-MC-Unique: uQG64TYVPpq1UmdENi9D6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E629E101B429;
	Thu,  9 Mar 2023 09:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2E41440DE;
	Thu,  9 Mar 2023 09:48:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D78281946A68;
	Thu,  9 Mar 2023 09:48:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 796061946A44 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 09:43:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C7234010E36; Thu,  9 Mar 2023 09:43:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F4D40C1106
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EBF29AB3F8
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:45 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-dozaZDx6MAy7VYakEUBYvA-1; Thu, 09 Mar 2023 04:43:39 -0500
X-MC-Unique: dozaZDx6MAy7VYakEUBYvA-1
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SI2PR06MB5412.apcprd06.prod.outlook.com (2603:1096:4:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:43:31 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%2]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 09:43:31 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 17:43:14 +0800
Message-ID: <20230309094317.69773-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SI2PR06MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdfc196-f1b2-4666-7081-08db2082bdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: qae3vB1q5azCwwMFBxFyNfulkS2fKl26dHrPR5EE2x89+PmGv+wkF4/+4aKLws+K7tg8UH2kUAZO771w1fj59D5/YRnvOqbqaNGxw/L9+6R4e9MlwrJ89LG+aO7hP5uPVucjhn9HQVzG7Vd6h1sTMpvYGa7IKcA0GqEqL9yOinjY54lR3g1tQX69gg1Pi00ck9+rrauET6gapdYqqNfoz4PIOKsXCKnpga8DbQZxpv/GOpKGazvOlVAvT5b1YOn8CoWMOLLFS0Vs1alJOdhrJ2tA7KMQ+MQn83aOHkYTfiGl9sb4D1H9XmVZasohnH9srt/IW0HrF2npeyFvyzcLEgPYNUft/Sja1P96GOVSsYR71QkbFBtJZRIGVzwSW3hJO9ZkYN5pfkRcKCQng2voJNcQm2Ti5Qh7HpTwP75UmRR81QjoosxLTVIE1MdfG+LvZUzPAqrcTQEzrTUkTu59KALngE4jJeF0asBpip6l4zlLvWphQvjvLEEOLgdbZUvs5ZJ1H7knJrSAxkroXDaHLnISfO1IphYeyWe0mDtbKi94bL3lPhpMptOweVXd5g9ZwVUW9GVZ8nbsqgXn03rA1zc2RDtPcyAgXSnEwjx88rsperdZf3ZiJYccY5e/8F3wxEYywh4ThQbzpCtYkRFaXGTVRZOtfJOTQaa0wIKoxcPcQdDPHm8Th1a7AP4zywn447BAzuVTD4CXEJHXiUq0q9byEhNehwijGoPn2g76q+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(107886003)(6666004)(83380400001)(36756003)(478600001)(921005)(38350700002)(316002)(38100700002)(6486002)(2616005)(6512007)(52116002)(6506007)(186003)(26005)(1076003)(5660300002)(4744005)(7416002)(66476007)(66556008)(2906002)(8936002)(41300700001)(8676002)(4326008)(86362001)(66946007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jegshxbn02X1nQ9NnM0gp3J6Xyonqyz267OOMRqinh4BkSeL3sTf6HJBFoQR?=
 =?us-ascii?Q?g28Nq5NlTjXow0dveGB5xSz9VCunB/WBFaN0pphNfUfW9+QOgNN4nldxdg7D?=
 =?us-ascii?Q?QMREfd2XUCC3IFhFKaFrSiUOZbAb3i3rNDAchTCFwbV24SswW1UK5wE5nopn?=
 =?us-ascii?Q?BNAiGz2hr9KwxThzquTdnrouRTl0TCfLgdkEFTZ0wBnnCoO8hlKhqK1rAOev?=
 =?us-ascii?Q?7ltEAKcwC+TigMLZHJeXcvNlDQ1RpPPidCu4J5ELguMtYxHqTHRoMZQkcSdi?=
 =?us-ascii?Q?wmFSu+LDSg49LB1Fn5AqmF0v4sq1wMf1tJu5yvFT5V2Sn412oMxFKB1vMrhT?=
 =?us-ascii?Q?Awut0jFKDo5fcbGmaS1D4eER2/O2TruCOHVU7gkssx6qWxpwH7WcTeElKeja?=
 =?us-ascii?Q?6o8zNDtfymrZUIGMHmhxjE+/KO3/UtZfvX+67XdHrmo2zUfZ3ks1OwEQvXdU?=
 =?us-ascii?Q?Q1C59ITLACRUv8pM8aEJUmFqWfKxE/A85CfCxspRupXXPmZNfPG2PqILBsqz?=
 =?us-ascii?Q?lO/6Enjak8gUggluwzbWHXdtUkyPakMRPzoxfqU6SfX1DQtVJgsB8+BV2s56?=
 =?us-ascii?Q?heYKICWrCvEBWUj/AdoFQvcVxsPwayzr27iQoQektPtXPWwVu1JrZC0iLoar?=
 =?us-ascii?Q?tDSVqhV7VhmMqUjANrmoE4+QViNwnKPYWxMUp9nexImyj6+OtaeWxcRgnFHI?=
 =?us-ascii?Q?Wu9/c62rBcyGOzWgZ6jj+yNUz/ToP+ZLa9ouML2AnaCvozxTymQL2aj7EVtl?=
 =?us-ascii?Q?qTTO+ekKCpkxKj4u5Mve3JByPVKxjn9nF3RBTqSPdQsShpXZCqeNjaKo0XWf?=
 =?us-ascii?Q?RJtrg9qdIjxR9k/y+gZdZ9rgTwvDSwO3y2sZ9ZA6ZoZNhtUeBStEI5mFoh2U?=
 =?us-ascii?Q?9CPSAQy+2esQi4JqogFK9RrlsqxDclAhletMVoa0TaNIFMtFv6mtCcddU+D8?=
 =?us-ascii?Q?de6fYhaF2b5FQ4AM929O/mwS1nH7HUx+WFZ6Zf0e5pmC8stsOkesmCF1xKLO?=
 =?us-ascii?Q?Mo73eIzcPGfGQKgyo7LJUG+S0ZiNH6xE5lRamHlvXpctNxsrC1HT6F4cIKH4?=
 =?us-ascii?Q?Vhbq8uSM1k5v94WkE8a1nTJzZesmPJiY12EKS0w+ga05a2P8oG2o9H0fUymr?=
 =?us-ascii?Q?43eWt3AqRkEDbXwJmQbmhelBqBa0YjNP1j5xcsbac9YbaVX1O+v2axGF3GSB?=
 =?us-ascii?Q?uHtHLrYg89VoZuelcMJKSaUWSx6ezrAZvoTN6Vve9NYW0K0vzjIBIESweNA+?=
 =?us-ascii?Q?UFUr8PHW9r9H1YV0zfTWx+KgyrUQ/afUCr+WbnCg7l5ZRavI/0QrMm9vrvr/?=
 =?us-ascii?Q?b2ERtetmSdI9a/nitJ4/7Mv3qq7pEvYRSZlXmTjDm9eZwlfuQVDGkva875ou?=
 =?us-ascii?Q?yireaBY9gj0KH3Ah3u+wcbVUeUxPuJwt0L3+e3dwfAfa0E9ixPRs0HL3gT3g?=
 =?us-ascii?Q?hYBSrMzQAB5yWzUZI1dPOfa3oDN/PSFKfJNyREEHaq1JekyPDjfPuGXdZpJy?=
 =?us-ascii?Q?nIMF6/rkqLHLoj0A42LqL+5uzHoJU1uq13V/cLGA/EotBOlITFqskY8MdmMD?=
 =?us-ascii?Q?WbiCAxhSRdoEr5ZKFV6ofdSTmnx3+7Tzol4eWcbM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdfc196-f1b2-4666-7081-08db2082bdd2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:43:30.8079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFyq14KB3cuZWCF5cyf54mK1ICs+rCE80rakkE22SpYH+jFpm73e0dq8Ro89rResc+AGFx8Lcowq7SYuTmndCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5412
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 09 Mar 2023 09:48:58 +0000
Subject: [Cluster-devel] [PATCH 1/4] fs: add i_blocksize_mask()
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
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Introduce i_blocksize_mask() to simplify code, which replace
(i_blocksize(node) - 1). Like done in commit
93407472a21b("fs: add i_blocksize()").

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 include/linux/fs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index c85916e9f7db..db335bd9c256 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -711,6 +711,11 @@ static inline unsigned int i_blocksize(const struct in=
ode *node)
 =09return (1 << node->i_blkbits);
 }
=20
+static inline unsigned int i_blocksize_mask(const struct inode *node)
+{
+=09return i_blocksize(node) - 1;
+}
+
 static inline int inode_unhashed(struct inode *inode)
 {
 =09return hlist_unhashed(&inode->i_hash);
--=20
2.25.1

