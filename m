Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C076B245D
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 13:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678365707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HqTHeFAFdujKqZi90/dqRhU44pfGP5i2Ys8B13VtCJY=;
	b=G9ofF1+n8SLOF3Kb5UbHj2vZI39MEF73UhtoDCIUcckS4HizzqrAHsDfuiV2GeEmA4ABT9
	lH6e+IogZgqVTteI0mN+GuTAZS2p8Sqxc3VjNK5LIaGMIRnVPrwczTGZcreeoS/hxaN4gw
	Typ1tJ1hUPNy2ll9eys5KZcVxUvfqCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-jK0gz4eNOKO1Y95-dRoHew-1; Thu, 09 Mar 2023 07:41:44 -0500
X-MC-Unique: jK0gz4eNOKO1Y95-dRoHew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568353822DF0;
	Thu,  9 Mar 2023 12:41:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B11F403570F;
	Thu,  9 Mar 2023 12:41:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EE4D919465B5;
	Thu,  9 Mar 2023 12:41:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18FB01946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 12:41:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04C5B2026D68; Thu,  9 Mar 2023 12:41:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF4C12026D4B
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6334101A52E
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 12:41:41 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2121.outbound.protection.outlook.com [40.107.215.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-gTwkCMFRNKWtDZQiI93cSg-1; Thu, 09 Mar 2023 07:41:38 -0500
X-MC-Unique: gTwkCMFRNKWtDZQiI93cSg-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6259.apcprd06.prod.outlook.com (2603:1096:820:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 12:41:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:41:29 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 20:40:33 +0800
Message-ID: <20230309124035.15820-3-frank.li@vivo.com>
In-Reply-To: <20230309124035.15820-1-frank.li@vivo.com>
References: <20230309124035.15820-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f2f4c0-3ffa-4533-c8d5-08db209b9ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 2bmxk9LMJ19LLxjIK7Gnr090TyGqOW7U46Y/tZmZifSSDSW4RNf7aH6rgN4EnpgSJisoOTOoMkHVafZqTDlU8msIpBXMFbpDS+jsKa2P/edT7j9ria3jhO4dZjRk9VDF3zUprP1PHXFdsgP7PrEJ+MD8YRd2o4o7AEE+Jv5IFdX2QFQcrb3A/vZUPDLO6uiVlkgrGePjb/hc98LZ91n/uyKEFWKMG/NIlPm0cl3yvZroDVUiPPapwGquGRtBUeXJkIKnfFWwvitViCbNqua219Ok7OQUcrhiJ4EVVS7PLzWus7RLImno8GKn7MzRnp1vFs8Wb82X2if5oeRFiRrnoQ4k+wzePOpPu4IG4BUmLq5VaRHwsZ4jo1DSw6F5FiqDhg2TBtPNXufABq0JWDfpVTmpZF0OamnKVjc1RcvZ64wpRIz+xkjsFwekkBCqDEM89q1mF8B46EjvcsglqLQONx3ST1U0Kz5ozBzCpmX0TehZhIwCdlD7WpoSnNQ69stjjsERCZkKz4x4l/UV4/7cFBtJ2J2RC3H6WaEncMp5RdY/tKlJcoLxsLwVVENBASGxBHOk6O27xspHAwW8BmckSC5X7h9O5dZpM+XEuXLue4QEw/2MeSBaare4aHlBpPdJSgZ6KYpR+96juFg08d6KZeXYMcXwNoms2dzsQi5tZ/+M7Wm9TY57ie6Y01kzqakxME4mgN9ZyJpWrBYCpQxgUslXk9SQXKWJ2E4+pjfILdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(36756003)(186003)(38350700002)(38100700002)(86362001)(1076003)(6512007)(6506007)(26005)(83380400001)(6666004)(921005)(2616005)(316002)(5660300002)(52116002)(7416002)(478600001)(6486002)(107886003)(4326008)(41300700001)(2906002)(8936002)(66946007)(4744005)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ozMcl8yJ2xNy0sbfFZEJjzTtGv0fuq5gde9UNKZIflRh20tKbOCtIEfA6u2j?=
 =?us-ascii?Q?6xEh1rsLzoxZiOlrae5NEFxbXRrbB4sVIU7u9w7Pue5sdBpugpvtQbEeLHQw?=
 =?us-ascii?Q?9rxl7wIJYGvAYM41hMK2EguFseEiUy3kIQd4jDLtARIj4u6z8rqviGd6iK99?=
 =?us-ascii?Q?qFlzObrLU3RbZiEiB6hPZ5v/2NLt2H5ZV0izdnnEO0H7POFE3ua9h1huC/pH?=
 =?us-ascii?Q?6D4lPySMBYlFSog52QAQJx5eVrIubh4lxmQfL34LPHZdbX9nWRKMc8QTkmc6?=
 =?us-ascii?Q?WOko8rs0fnAZ1hX9l91uDFBJjXiqyKK7Rjh3pUxrOyXu0Ejs/xxcfduLNJPV?=
 =?us-ascii?Q?qjA+QKMWWDvbLlUDNZVSqXw03ANqQ6TiQ2HEQTQ+Px8XPn9VNuK1YzQ9+BUK?=
 =?us-ascii?Q?TIyG49/kC0KJmADeO9Q0wRfuRZxAwqfrRjKP9HlScCZer28w5Z2R9CUYdl2O?=
 =?us-ascii?Q?D40+9ksnDsYBpXxfs+ovp95dyReb07QjzLN5XPzCexuQqFHMuAm0Y0jIa+SK?=
 =?us-ascii?Q?On3bf0tTNgEKPmQcg97sE5VyAwG3CK/qVilKulok8NsehLOIvni+F1UgSHy2?=
 =?us-ascii?Q?1bQD3aVz0THMrw6kI9kjCt8JNJY8zv+kWO14L/m1ILWoWxIt6sv0SI0ajG/6?=
 =?us-ascii?Q?uDUOq7zsNaa5OCgqHgdtcbK+2Gu/DTjrJPbmCgXueddi+V1V1hQpc4BI3RXE?=
 =?us-ascii?Q?hDJRXrWEOfp3pagdAxgtecAUlRDtUdfhev14SOK5DmXz6DLH0KhiSnI5Mml9?=
 =?us-ascii?Q?skc8UxnO0QNV7KrW03xfzxCczoutI8Vdl8qF1oy64OYLGKzvdjc9c7pbvPHT?=
 =?us-ascii?Q?KHf11b4UjgQ5P5DIqtlalZ1F9qn1vatS1LFMoUZk0YbdbpWt8dyuYY8udB3P?=
 =?us-ascii?Q?DGbMbY//St7Ev7VQuEKgnZhcYp8KWWXEiwPGGu1RAv9SAjmHL+kZQRfkX/xO?=
 =?us-ascii?Q?gJ64HfGoe8TFVFL7QdX04guA4wTMJ7VBVy/6x2uXZJbCkbdN6/6IcGgi0Fva?=
 =?us-ascii?Q?hdF8v5/nVybMe8I8a+WyyYyc8A4ycL9fzRXq0mkpxslYwagp07Px2GVfSu6F?=
 =?us-ascii?Q?iVSj3ukrDuxu+g2nyi1bTan67R7Pw+9vBu2KtuUB77O1R7j0xor3UB/9XVSy?=
 =?us-ascii?Q?g4RzLXarC4x4oBe/6nrebkNRN9C+rDnLYq5ofVEcZ7wyYr7wnbBeEJ5w8V0F?=
 =?us-ascii?Q?+kBPQqVAJJKeUBHa/oeZ5VBplGvooL4NCxbpoH6gymzpDgBCf4kw5x0U96XL?=
 =?us-ascii?Q?czaOpJtQ/3C40T98atC5s8Ymoku8tYh7Ies4qCUkrrBNW1/iNKlrrGYDT1SG?=
 =?us-ascii?Q?Cnhw3cXbyaToLVyDFK29GUf2hOCEbIZjoZ1mIwoAKC5QGe0RIGzSMTGocmgE?=
 =?us-ascii?Q?vJ4ps05YRnLJttZ5AxPaWUh+J7FBgvHnUy8RbenUqdStZ5XCQ6p4oVPMuZiX?=
 =?us-ascii?Q?mQf1svO+YRjuSuqUJI6nGVhXSgkA3n1qaQ+pyCsVhMNYO6NRlCK0OBiu7i6W?=
 =?us-ascii?Q?SQ3UpBhxqDvF5iXX9pd4gpTsU1aI6IlrmWrEx1cD5ATexwmnZRwqxXg/Yo2t?=
 =?us-ascii?Q?GxB8ZP0DgK6ZGhcgBJ9She1hyPHnSO7RJeyTfenE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f2f4c0-3ffa-4533-c8d5-08db209b9ab9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:41:29.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VHGA17u1WDd0a0giZZqm7Sr2Ozv/qboL9WeHNxlJ9yk5qFcTq6iwG1GG/IDREqnaydWCJMDjt9u6XAJY6z1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6259
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2 3/5] gfs2: convert to use i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blockmask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-convert to i_blockmask()
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

