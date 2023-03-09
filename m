Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F476B2457
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 13:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678365688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hWXgreMdZbBxLqgMgID8XyabR1GxXrQOSyQzjgl8reg=;
	b=HJ4Ie/BJ6/KiTExO6/lAfv0G61y8LzWI32MykIEaCNPz1PdRTlSX6UhY4/jRoYoKYEeSq3
	lWY4q0j+QGTmgSyEIHxlSoRNCPU/wEHw9AB13KHjRa/DWrZzbHAgJbOjvZ2smCBuk1f6f3
	S8pOjmsFfIBCkdFjLLKxamkM94C2EhQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-v4YEKTx1NdKhHX8buEbtmw-1; Thu, 09 Mar 2023 07:41:24 -0500
X-MC-Unique: v4YEKTx1NdKhHX8buEbtmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6C391C06ECA;
	Thu,  9 Mar 2023 12:41:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B238C492B04;
	Thu,  9 Mar 2023 12:41:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C44019465B5;
	Thu,  9 Mar 2023 12:41:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8E7D91946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 12:41:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EA5C492B00; Thu,  9 Mar 2023 12:41:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 661FB492C3E
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 499E981172B
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:20 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2138.outbound.protection.outlook.com [40.107.255.138]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-0iR8CuKFNZeGLmtGXCyRGg-1; Thu, 09 Mar 2023 07:41:16 -0500
X-MC-Unique: 0iR8CuKFNZeGLmtGXCyRGg-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6054.apcprd06.prod.outlook.com (2603:1096:301:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 12:41:09 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:41:09 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 20:40:31 +0800
Message-ID: <20230309124035.15820-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eae045a-6ba2-4a96-7172-08db209b8ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 6P7++5T/2tqGKxda9iuUKw8ulfTUUCg6+UoNEWVIwNSjwA0epc3XEC1YFz9RLh4sSlWci34CCE1ylqMfd5Wv8cewLK3O8QKpg3kW5xKUQXMIPokQVHmwhHNHSr2FTd8oJZlTHA4M83vAhzNQqPgoaWGvOsTblnNSpDrINP/sRffSMe4YIRvKwJvmq4QA7Ojsd18NLMKh0EoyHenKEVZO7+fY9M+3dMA8N/eH5SJ6ez4opLM+wEHZ3HiJ8YrW5tu+l9THAo95XU6iaof+xB+iYasxA2WAlHAqLdZv/oIP0F2MnpbOg3b4WEwLrE7MzB+t1AaPZUlnSz4Ff0QoKY4UVKKwNfbsAOC0XGEslYUmVWbbbGG0rIY+J7VJszha1uEjcW46BB9B3vLAUYYjDm0KTMXKUkBMkI6X+hNQ+tZpkAU3cJgDuEySrz7tVxJL3ADuNfKSgEjb4vITTzsSsJsZua/RfI4MOTeJxFlLvwU74kkH+D0U6oy8H62p/hMjnpspfGvmZ7H/jRRbAMvNzimghS/GxaI6LqX1l07wsSL98kWSDjbzSXCzxmPP/j6C4XMOooyqar24Ao1WvVzYTd2rAOPn+M4aO0XJQCflH0S/uHl/ZurWDrsZ3s8TKSpWHebHiTFJXLMMBe8hlXl5wGiHn72OEhdia6zM8/l1KBq+YFHUz3oTTlvmYmqVXTfWwnHU0l43U5xYaVO6dbOuoFU1v4WxkthZkhKnfb1cpEo7hbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(4744005)(36756003)(5660300002)(7416002)(83380400001)(107886003)(6666004)(26005)(1076003)(6486002)(2616005)(52116002)(6506007)(6512007)(186003)(66476007)(478600001)(921005)(4326008)(8676002)(66946007)(66556008)(8936002)(41300700001)(86362001)(316002)(38350700002)(38100700002)(2906002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qwUd1U9/ddEhpB5ym1KhX/c+Jrt5cpwDYPe76437Qh0GFP1W3XGo9N7Jp+7J?=
 =?us-ascii?Q?z8XOi2+403LUHNwtqmHA5tUEmsJUwMX8yjLSfNGiZ9ao6gbpUf9DUDuO/Sak?=
 =?us-ascii?Q?/AbFXwwhUOhsDO8I4jqj1fCZP1DqR3wtDu9UpNR5G1s31KyhrMIPwW29nXmK?=
 =?us-ascii?Q?CAH5nKSM6ghRhTVuVQ7yjxBN9cApwhcORjiYyPf4A6Wpo09xhSh/+XplQDaX?=
 =?us-ascii?Q?/7lkW5yHD8hxhkSOmwF5z7yJ1ezQ1qpBBuc0vzQkXPDKTdR5RVRuDNnMNSYW?=
 =?us-ascii?Q?e5fMSTXoL2dLZntSxXFVEqsLq6QouBPfO5aVmGf5q04fR6NAoFQbw22WAQuS?=
 =?us-ascii?Q?dPrJep0pLV4TlqV3APbH9MDaAqJmfAfjcIeUF0AKGx5MYUOc94knFjcTbLrR?=
 =?us-ascii?Q?BpY9m6dd33yBblVODvBiCbBGAX2eR1XHVk9pbjtpN/gjulLc8pcaTkt1wmE/?=
 =?us-ascii?Q?IpZ+2lFrR3p7IDLvsfunxeBN/vK5WO3S3NyqaTCKzARPIJ0jMoBQR7dW4Bvs?=
 =?us-ascii?Q?XfC6HOtiFthuKBV8dz4tOEOkSH77AnrsXXJxRyyMg4ONhI77vrzbTWGvNni6?=
 =?us-ascii?Q?5JYKauIwacNdaMTbNqRb6WX5FLyOfGPBL3zpGny4TffQafW7Xe57vbrRpb7i?=
 =?us-ascii?Q?1egJQBp1cTW286wP92BSDSSES0wBxVK68iQh+TYH2ifhK/jit8D7g3yS+66l?=
 =?us-ascii?Q?qUHPkbtPDE1fTgCrrMqM+baMTeVxmYMFGQE11UU6scs3NiSah49r951GpYqN?=
 =?us-ascii?Q?mNc0dyfQA2gfE/vJFIQOjFuwTm39Ncbtt6GERbDPdlqgrQGk0+eHEiTyGtmi?=
 =?us-ascii?Q?QTXsbVJ0yVU14o/Hlien5AjdK8z/CwsVCyQZ6xWopCfdV9RE1+hYmjCOivcP?=
 =?us-ascii?Q?yZAFmyKj/4KHUJjB74hK2IUKGPIGOYrmdFDLGlb5yaJuC11GwLX0jk6F3YKY?=
 =?us-ascii?Q?O7zxkv3+dyCyvlXg+5y/agU51wKtlGXRmynLz4K9kSxHY/wMhWDS3cn6TkxH?=
 =?us-ascii?Q?oM+D+nwbPwO0YxGSd/9K/WCzeyXoydYcl4zgng8A3VzXpHc6p2Gibw2ZCcvv?=
 =?us-ascii?Q?Igt/EKLXgs08FBrPoKHJ19D4hlk1xe3m6OyvX+A2v4syhmA/MtX3huAZFDlu?=
 =?us-ascii?Q?NDEaeJxkaIHS2U0P+1ugrx4EgT9zT38+Dzra5TmMYUEdf26LhM0JqBXABp2j?=
 =?us-ascii?Q?01d8ZWJHUGo2PCqBKt8K5gGVKtOMwF/zgEIKVtzX21w9OLu8Stj1zmUXvWbs?=
 =?us-ascii?Q?IC3N0LyUuInxob1V9ABPenQt7HuKzMUK1Uf6/+mbiFJsF7HzxJcfeV43N+6G?=
 =?us-ascii?Q?3LmwYSZwG+V9X6DAGPYfxWhdfdAHutIeh1ioookV/ax2ITMrUuLlqIQKjIGj?=
 =?us-ascii?Q?4g0g8UePAGa4otn58WXE6XM4uR1A2nbKIpXbWjKbBCr0DT/gSDr5c9NtfvVR?=
 =?us-ascii?Q?F0KJHc5jIQXmpgX0C5pA8dDRQSR5fpolU1uBFKDifIkBuQEtHKG72XbpZD+h?=
 =?us-ascii?Q?GXzIiLhhf85vKsFwgjGDDVObDqYOL1ZFIF6WdnRHzhhWNhmlrm/qkL9t61Ui?=
 =?us-ascii?Q?CbrNvqJJgvSEJA+OBOquxBi3z/oSpzkbPsA+rXax?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eae045a-6ba2-4a96-7172-08db209b8ee0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:41:09.4338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIwsa5dMsMOPNVWk3UVyOvQAp9MVjcVoSIKUNaLd8ql1Zznrw5khsn1CPeaHJtkuSbq3UFTLetoWINaXLzFwnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6054
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v2 1/5] fs: add i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Introduce i_blockmask() to simplify code, which replace
(i_blocksize(node) - 1). Like done in commit
93407472a21b("fs: add i_blocksize()").

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-convert to i_blockmask()
 include/linux/fs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index c85916e9f7db..17387d465b8b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -711,6 +711,11 @@ static inline unsigned int i_blocksize(const struct in=
ode *node)
 =09return (1 << node->i_blkbits);
 }
=20
+static inline unsigned int i_blockmask(const struct inode *node)
+{
+=09return i_blocksize(node) - 1;
+}
+
 static inline int inode_unhashed(struct inode *inode)
 {
 =09return hlist_unhashed(&inode->i_hash);
--=20
2.25.1

