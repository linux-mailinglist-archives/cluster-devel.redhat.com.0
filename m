Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75961746F37
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jul 2023 12:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688468184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XsxfN1K4sPMeJCAbst/G1HCSomVoD532D9QZ1C1soS0=;
	b=OSGuRGY1XuY7z8blaPbtgl7BDaBh9Kc1+mTvMuVRhWOJ0ZzwCbaPwMJ3mL737sQgK/dsoR
	G+ny2r8ZopnyYW5GSuwFm6DInY5btD/xyajM2vG6W0TUkxJYMTLnE/xo71hPz6znAzYHZd
	KX+o9S7ziI+jL60Sy2wscAOGnIjDAnM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-07JqXNPgNVO0zXibKFhXSA-1; Tue, 04 Jul 2023 06:56:19 -0400
X-MC-Unique: 07JqXNPgNVO0zXibKFhXSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253EF830EFC;
	Tue,  4 Jul 2023 10:56:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE9B2023439;
	Tue,  4 Jul 2023 10:56:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 858F61946589;
	Tue,  4 Jul 2023 10:56:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C73611946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Jul 2023 10:56:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72DEA1121315; Tue,  4 Jul 2023 10:56:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B47E1121314
 for <cluster-devel@redhat.com>; Tue,  4 Jul 2023 10:56:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8008007CE
 for <cluster-devel@redhat.com>; Tue,  4 Jul 2023 10:56:14 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2098.outbound.protection.outlook.com [40.107.117.98]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-ocU6tlXJMo6d3wcWMSjehw-1; Tue, 04 Jul 2023 06:56:12 -0400
X-MC-Unique: ocU6tlXJMo6d3wcWMSjehw-1
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 TYZPR06MB6401.apcprd06.prod.outlook.com (2603:1096:400:419::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:56:07 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::7dfd:a3ed:33ca:9cc8%6]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:56:07 +0000
From: Wang Ming <machel@vivo.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Date: Tue,  4 Jul 2023 18:47:16 +0800
Message-ID: <20230704104725.2510-1-machel@vivo.com>
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3743:EE_|TYZPR06MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcda751-4a5d-47f9-e0ee-08db7c7d4460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: zBNv80N+Yr56NfIER5QYTEFwsqzo0dQKf7vv1pYWVXv8bLd0tPEnAGJUiTRaJ+oM7IWB3t6e7Bs1ac3ehvl9aCYEIo+ID1qJsjY9Um9lb3RzdU4AiTorplTVvcg6u98CiGVHZRvjFcICHcp49ite3aUa1yrUEsrdg4v5l+ikxQ+W79CZ0d28dCTJSHRSjEk9sKyW7vFdjPmvIAE+wR1B0w/lPpEgfCH+45gYfhgNSB3o4OdHrq7akoJw/3z497YQbDKqPxU2j5yreK8/E/XZFQSzkMNDG2U6e2ddzS5vsgBh4zwZmVQB/ScyY5+i19QjM2PWSAVF0vYGk10qAXq7i0CUHj+CUHdg/TRkBJONM8GdETHK7yLGqYvS8K/wc8TkHtj/FpmtTEyVgjNeg9dBTV6V8yROOnIWbG5meAVvO1SPB60OfOOtbDWHZYcqFgu93Wk+kvfmxiJitdlGxi9exbhN1+w1wVYeHjvOGvNGcCk9jJ9Fitvrvg5Wj3h/3D52t/KVPFxuxxg/pt8DslpNO73lrMXziNAfFitj7A07M/gUz2kJZlAF7TSkxogW/jzwZ/rKZN5qvC4obil3bk8dY59vtnmX3vtEBmF6C9xNf68/nC1yT3wlL8l4Zkm9xEbG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(451199021)(107886003)(26005)(478600001)(1076003)(6666004)(6512007)(6506007)(86362001)(2616005)(186003)(38350700002)(38100700002)(66476007)(66556008)(4326008)(66946007)(110136005)(83380400001)(52116002)(6486002)(316002)(8676002)(8936002)(4744005)(41300700001)(2906002)(5660300002)(36756003);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v7R3YhZqbJhxXIkDz3FvbL1IJWPuML3xyZXFayUO025DGz2+Sg7H9+k92QDZ?=
 =?us-ascii?Q?GyXGHvRoys+kITXz73qzjOENVVmYA15epmpeeOS3z0YYzewrMNi+7aLNhwH9?=
 =?us-ascii?Q?Z7PlXi8hXQYAUF20Sm1p7SFBN/Qmjy9+M4ZtRHklWqrnRyYymSan0VRl3Yjr?=
 =?us-ascii?Q?H2NHJrTEDFGGeCrLWmHN0YoSXUZKeYk6PaNwmA3U7pdmCjXsKGNj7NVo9TQl?=
 =?us-ascii?Q?EtszEny/NTm6LHdO3vnUae/C8jAoSlHCIzZbaUqEgQAAOC3cljekjw7fmY4c?=
 =?us-ascii?Q?Hc95Bu8scLDCDFvr7/WScKMpohr2x7Rqekgu1oSO+pWT1k6cNGS7jY8H6SAY?=
 =?us-ascii?Q?MRGSHFNUzO7CFVvUJ93kayVtjWbZkkJqBJ9Pu6oxHJGO1C3rlhtrLPQMphI0?=
 =?us-ascii?Q?N5Ia4zHl4EFeK29T303J4aOcKJLV3Ts7YvYDVFdlJPNA5YgjMFaonCT/neQW?=
 =?us-ascii?Q?XZcnPHkpxhnl6dLPw42IxK9ogth0iGKBXv4x28Cz3E8r4TpN3/eXruSDihny?=
 =?us-ascii?Q?uNQ/CTLbE78wG7ZHuNwMfrq4pMsSCFETwWAOrWsUUR/1JoxanpyPSac5f600?=
 =?us-ascii?Q?T6OEWz6dyGCB9xckojL1bySDahjTjMcXN1EWI8v807oBC6W+MR6hGhy9Jdhy?=
 =?us-ascii?Q?F9bwFox6hrQsgfuaoCY+BzfJUhZvlfuhD3IDiDl//O146lnVWKxNxFbES1Ox?=
 =?us-ascii?Q?q27Lhd0TSPecJwNvofrc9jtJDcccpU98lNDXbEyvbUn7cC719VgthJ2s8cSF?=
 =?us-ascii?Q?5P4X5g2eiPdy9NMrBZnDn16MGJST9lObJOrzsLRaox/I97dsw5WQaUrc0Vt+?=
 =?us-ascii?Q?Elu6ZQV4pPeLUygB58PBat2bnmcfwk1QnVwpRghGIoq15Ap65yCqZ74ZbVmU?=
 =?us-ascii?Q?bzPiJEbelEbLh9zIKJIzMRlqIdJ6lffHvbXs+HmhYP8stRS8MjF4E5bG4QEH?=
 =?us-ascii?Q?D3/SdVkFVULRsVK1R7IVJHTuUZvUOuhj3TG9yEuKiOkfbO1uWh7LvEzYKB/H?=
 =?us-ascii?Q?zW0bK4rgqNPFpw44EIFcHKeqhiijCxNzqtv2/6GghW8Ajds4k/A+t5kzWULA?=
 =?us-ascii?Q?Db0d321tAzeKK0Pzoo+BqgETJvgSbBa2qsNZ4e63f241WsQAmzoA8u1W3RDF?=
 =?us-ascii?Q?QMEDTWikBztQypcf7lKbMMs6lA8Z1IbW8ksQU8i3EQhwR7/c58Yvu+ENG7Vf?=
 =?us-ascii?Q?vT33R2dhP1RDkJDkWSkanijYxUgXwtW/eWR32ZS42JjPtFsvfGy1y/x3xQPL?=
 =?us-ascii?Q?hEFgDUEPSgTCka3MJVlxHc3mrCI5R49nYhKj8CtlNxyXNNnlN045XbzwRzT6?=
 =?us-ascii?Q?ic3RpoJECEWeuZXk4zFiSkQO80LfS/zSlDWh//mGCC452eL2x7s+8q5Myu57?=
 =?us-ascii?Q?ujsrceU2pw7f2ZVjtdRrW1J4HnxnlQyU05HuL294RjqMJ/y3+5Tg+IxI6itL?=
 =?us-ascii?Q?mEQvoBfV5CRCnDDrRMNwRNZsWNPNTttrSrCOyLXMjPLLUrSswCNK50cDxWZa?=
 =?us-ascii?Q?EFgYzUDJJpLHfVEqtuOv9V28lgBrMmLw9/Npjhbdfzv/vXIVJ8QCVj3iJzg3?=
 =?us-ascii?Q?/orXQNQnStZ4WCOOiUot3dJfsGLBF2P3Hp1RX89X?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcda751-4a5d-47f9-e0ee-08db7c7d4460
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:56:06.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3Y8ySFXn9cM6WO3Z7dhSCVeNFtuHLpTNcy6bDiGrGAIp5fGFqVTWJL4Gr/h8eSZRwe8IVsFDHkpbzoaUu4wIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6401
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v1] fs:dlm:Fix NULL pointer dereference bug
 in accept_from_sock()
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
Cc: Wang Ming <machel@vivo.com>, opensource.kernel@vivo.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vivo.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

newcon -> sock is NULL but dereferenced.
First check newcon. Whether sock is a null pointer.
If so, the subsequent operations are skipped.
If it is not empty, perform subsequent operations.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 fs/dlm/lowcomms.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9f14ea9f6..ea18b9478 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1081,9 +1081,12 @@ static int accept_from_sock(void)
 =09=09add_sock(newsock, newcon);
=20
 =09=09/* check if we receved something while adding */
-=09=09lock_sock(newcon->sock->sk);
-=09=09lowcomms_queue_rwork(newcon);
-=09=09release_sock(newcon->sock->sk);
+=09=09if (newcon->sock) {
+=09=09=09lock_sock(newcon->sock->sk);
+=09=09=09lowcomms_queue_rwork(newcon);
+=09=09=09release_sock(newcon->sock->sk);
+=09=09}
+
 =09}
 =09up_write(&newcon->sock_lock);
 =09srcu_read_unlock(&connections_srcu, idx);
--=20
2.25.1

