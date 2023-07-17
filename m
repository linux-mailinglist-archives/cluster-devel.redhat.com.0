Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB4755FA5
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Jul 2023 11:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689587086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SWbHbGp91DD8u7OeHATxutTeVWi4M1S2Ninvjz8gB24=;
	b=PmOx4DSNcYd+l0LEBp/RzOdnFAMYHJmiKVz2ql5oDTUux1fHNUT6+Xvfy9Xfq/0T59bZko
	2PvOCVyt4RCizOvU7pIuCdt21QN0k4M1Q4cnesyV42lYF43eeJCjoQnL3Tpls8mFO0SM7X
	b+zRuh+ZeNqD2kRsko7CZvnHg0OSj3A=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-AKDJkzN1OnWfDd8a3htAaA-1; Mon, 17 Jul 2023 05:44:38 -0400
X-MC-Unique: AKDJkzN1OnWfDd8a3htAaA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C492C38149B4;
	Mon, 17 Jul 2023 09:44:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B68334CD0F1;
	Mon, 17 Jul 2023 09:44:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B2C419465A0;
	Mon, 17 Jul 2023 09:44:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4F8D1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Jul 2023 07:20:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85319F5CFA; Mon, 17 Jul 2023 07:20:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CFAD10E58
 for <cluster-devel@redhat.com>; Mon, 17 Jul 2023 07:20:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F9358D168B
 for <cluster-devel@redhat.com>; Mon, 17 Jul 2023 07:20:07 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2123.outbound.protection.outlook.com [40.107.215.123]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-QCBSFPRaOLaiFsbh13nW2w-1; Mon, 17 Jul 2023 03:20:05 -0400
X-MC-Unique: QCBSFPRaOLaiFsbh13nW2w-1
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9) by
 SI2PR06MB3993.apcprd06.prod.outlook.com (2603:1096:4:e9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 17 Jul 2023 07:19:58 +0000
Received: from SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a]) by SG2PR06MB5288.apcprd06.prod.outlook.com
 ([fe80::f9b8:80b5:844e:f49a%6]) with mapi id 15.20.6565.037; Mon, 17 Jul 2023
 07:19:58 +0000
From: Minjie Du <duminjie@vivo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 cluster-devel@redhat.com (open list:GFS2 FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Mon, 17 Jul 2023 15:19:37 +0800
Message-ID: <20230717071938.6204-1-duminjie@vivo.com>
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 SG2PR06MB5288.apcprd06.prod.outlook.com (2603:1096:4:1dc::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB5288:EE_|SI2PR06MB3993:EE_
X-MS-Office365-Filtering-Correlation-Id: dc89f440-6756-4d58-e63a-08db86963a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 2LHiSsD66HVwzXT++M9h2VhtnGtyE1gUq2xMIlaiPLRLVYLFBF79mjxME3BbJBC0+ZM9hSrO9VYElY5t0hJmaTfc81tEf2Oige3M3kQLdfa8uzM6Yg9FmGNz0YGpvoRE0obkiQZh+0p6iHQ6DGUWRp2p0LsPYX3t28YaILiyXVQm/uzEXCyZyrp4YdpQxAJFrreZnHNHKtbV/7r7hDkP1zVICN5V9vzpVMmrfe3+Odh1sg0VHwF0+y1Ei2dDYOjxos45nK08bZYfbaPA/SMeO/Wo5d55WObAQjeDg70DEZrYlJt/7sJBHYWsO41GqIglXwNTlgqrvu+qff2ikijXgiWvxORT5fRL1qeKULoBF7WdQw8/QNXwlYVTB633etAc11O/dyoFQYO+NakvKWKjDne6emAOCgSPhZC+srgLysY0kKUXgyTRRFVB34ijnSelioIObYmyVukXaOplhnDUYxsxwQhVAvWAZyDWHaaj2ZOrX/JYx9+Vgvi6d9wmVedZ0qMIBK6+IS42E4D5tsJQkXr/9F875s5i4aWjuggMiJfvOhQ1OE9roQElpTNzVnoig9kS6lRz0UDj15KpYQV9ihRLxyGmOyc20utudvuKVQnLTQyTWM2yLV8PptCcs1Fu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB5288.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(478600001)(66556008)(66476007)(66946007)(5660300002)(4326008)(316002)(8676002)(8936002)(2906002)(41300700001)(4744005)(6666004)(110136005)(6512007)(26005)(1076003)(6506007)(6486002)(52116002)(107886003)(38100700002)(186003)(2616005)(83380400001)(36756003)(38350700002)(86362001);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PoocIdjb2Oy3Byr81MxWnszKd2rjHxYh/ZSWiN9MN4gF8kO4zHWXhWfv+BTE?=
 =?us-ascii?Q?OOaaJZaJeAJEjDlp2WvGYLITEmWdcPIGgOv3J+L9OleTtLAQofmJ7zz6kMZJ?=
 =?us-ascii?Q?qHluAbmjt9A88YYMi/Gxi9hF2LvPi+r2mMRijGIeIiQFipjexyVHK+9Y9v76?=
 =?us-ascii?Q?G/75FKtaPVkInC0dVQSPD7+OofZ27QQH3uIgHj8u5QZl0W2p0Ir7rlexZPlQ?=
 =?us-ascii?Q?Z3W9tnLflablnXiX/Kz/YlLdq3N1oB9GaMD6Cf30rtQlfJ5Ha/mX9Tkqefz9?=
 =?us-ascii?Q?1uz3WeeLKwJsTw9PzyRlOSngEM2dBSq7TgB4eyFKwQLdycZzG69Sk8b4/1CJ?=
 =?us-ascii?Q?gxVf4TKE3TizfhwV1lMBJH5wjYnucpJ+9tRsQfWbT5U4p+mo9cncvp4SD7pE?=
 =?us-ascii?Q?uIt6YDc/G9dxY7Kmgm3Ip3A8Q2Armwzs+JJHkgcC7NOjYxGAV9iuZ+6GY71d?=
 =?us-ascii?Q?diUS/K1oWE0vYvrAC55EWJxLiLtkXWRNmm5Lme8ynIXtT5o0e9RGRLlwBOqj?=
 =?us-ascii?Q?ikJtzBEr+uN8hBa6Om+8RfVAAfWe0ZwVEttok07BpMIWdNaHY9nvj7PPqJBG?=
 =?us-ascii?Q?strYxx44eqlWqcgLYnbtbxHCELG53u/X9AidR+dlqqyNqCLSTfYPnUuJI7WS?=
 =?us-ascii?Q?R7WocxTEUur6yhN7dV8kWuJ1QaBgbRo/0pN7dpUCFsH0FhjdXy1nyeg4AHRH?=
 =?us-ascii?Q?OB+Va+l58KTu6WsJBfaldTfbg3Gfr7HxP/ywl97YwM+bJPfp+LT4BU6bIEB4?=
 =?us-ascii?Q?S410BU1ahUVsoaKGFqV4RYoOG3/atqdRHvbk8CwKUgPw2Z9B1ugBEs3EGl+I?=
 =?us-ascii?Q?cRt0TObhzf6KShXxYiTnb2WTgySsd7oak4U+DDwP2qoM9G8l9zDwvG8agbvV?=
 =?us-ascii?Q?m2/CMqwilNmB1brOXNMfJZZOmnxduwAfNDyFib2zjvRhhJtOprD3a5tTkt9d?=
 =?us-ascii?Q?lFC9dgm9ERnxbY1Kl1yuLEST5x8d7tXiwSnTJ2tmZ2Rw4XogKGkR/pHkkFZV?=
 =?us-ascii?Q?49Xn1DuDhZ0VTY62pHCY6CTVKgLkUsicz1zNnfwrsNWGw8hIskBHDyi6yQga?=
 =?us-ascii?Q?lp/dQKne+P1KY9J7ndNGXDx1IaO3v9ODDseaU/utQ7fcFAc+L1mZekSpEipB?=
 =?us-ascii?Q?BZHdx0i+hwJ4vKDfJ1evGHT0s5rj2SVQko/EoBxrjwqv2raFe3EP3RIgFIek?=
 =?us-ascii?Q?MXsLcX/0YU0y/Vll9WnKKDKR95eBvxRZtO0sJYTNnCARtW3veG7PZww9Tifv?=
 =?us-ascii?Q?qkVRioh4ULEWq1yiOuhDihjt1HKME6AMoYDyIr3sHg9GLPfpE3v3x2bBsvJd?=
 =?us-ascii?Q?/dQHSqnVKo/7S6HyTJqfL5UfT89RoCFhpDFO/8HfIwnSAE64/KmjBhzxlT/9?=
 =?us-ascii?Q?uE4COHzvh8HFyS5b48Dvq1+IoCQB+49Rgxc3llfpt7VWy2ckkFUF/2Sw81nh?=
 =?us-ascii?Q?9V62/zey+yLjbr85aGhgG5deoorkq2PAxU4e9fg5ZxRwZJJpchBakQXgqZWS?=
 =?us-ascii?Q?JOiYFF7b6wTNShxFZghgiOGe/FtQmvJRCij1HkBO0Iw6oJcJHvXvu/NTn1St?=
 =?us-ascii?Q?E6cbh5h2KwkIQrkJwyYvZx06OhlBUJhq8WzDH7nh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc89f440-6756-4d58-e63a-08db86963a2f
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB5288.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:19:58.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfl3IIT2RnUVaDZL/gfIZvW1XHLJPB0B6IjUADWQI6ZMloIC1Hcx/33/0UIVKd2ai34lx9JNCvTiODEHXipN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3993
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 17 Jul 2023 09:44:31 +0000
Subject: [Cluster-devel] [PATCH v1] gfs2: increase usage of
 folio_next_index() helper
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
Cc: opensource.kernel@vivo.com, Minjie Du <duminjie@vivo.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vivo.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Simplify code pattern of 'folio->index + folio_nr_pages(folio)' by using
the existing helper folio_next_index().

Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 fs/gfs2/aops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index ae49256b7..5f0254237 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -272,8 +272,7 @@ static int gfs2_write_jdata_batch(struct address_space =
*mapping,
 =09=09=09=09 * not be suitable for data integrity
 =09=09=09=09 * writeout).
 =09=09=09=09 */
-=09=09=09=09*done_index =3D folio->index +
-=09=09=09=09=09folio_nr_pages(folio);
+=09=09=09=09*done_index =3D folio_next_index(folio);
 =09=09=09=09ret =3D 1;
 =09=09=09=09break;
 =09=09=09}
--=20
2.39.0

