Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 976C96B3644
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 06:50:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678427434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9xMrw0YMJ8YNhWO+KZ0+PPWsKkNRJOu7cTR8Umi150Y=;
	b=OxsPiMzYdC7Ue0JoRqqk/y8a8H0XieurbrcJeZnnNBigNSoSK2OuzkWbgci+sPAcV82Lsh
	j444AkLwMh78fsKis/Waq9QEZ+obgt6HIY/5/PygFrgLDoIRV2aqHksp0nvKjzuzEmUuGV
	9cE1MeKYfyDdUpKFdLRzS/T1U74X5nc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-2iXJOrjXMeWax51_FxvGyQ-1; Fri, 10 Mar 2023 00:50:29 -0500
X-MC-Unique: 2iXJOrjXMeWax51_FxvGyQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFFCD3C0E457;
	Fri, 10 Mar 2023 05:50:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4440492B05;
	Fri, 10 Mar 2023 05:50:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A92751946A49;
	Fri, 10 Mar 2023 05:50:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 276071946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 05:50:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07AAF2026D68; Fri, 10 Mar 2023 05:50:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F35872026D4B
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:50:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4F3A1C0690F
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 05:50:27 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2094.outbound.protection.outlook.com [40.107.117.94]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-MlBbX_YQOMuVxL_e5wTA6g-1; Fri, 10 Mar 2023 00:49:09 -0500
X-MC-Unique: MlBbX_YQOMuVxL_e5wTA6g-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6023.apcprd06.prod.outlook.com (2603:1096:400:341::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Fri, 10 Mar
 2023 05:49:05 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 05:49:05 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 13:48:25 +0800
Message-ID: <20230310054829.4241-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: f656adcf-6898-4ad5-6580-08db212b28c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: q5loVG/P0L8dPSpzK4iqHvOo3G3acBqRX7+o4Q0X6w8SrT+S8DT8na1IHtp+t0Nd0a+KxLiV/YGfQBZBFl8JeQ4YeCp13xBXGrq8xjrREtuRmG6rp9IcAcRjWVWeNrH27dHIsEsz4Qbcvi2thbipeWR2MlZKEhkGXhl4YUcwZQCrD4OCg78xMofqdo9dQhIRc2HFF27RX/xkaKZGE0RBIU4sH9au2kaUEHGnioNyJS2VFnH//IGT82dUP1IkqBEWuar/Tzudp8lWOz+0xQaem2kEdOI2Gu7TQ3EGcYoK+TjxZnfQ45sJ4FU5V0LLhBsDslIOLUrb2KCFiuh3WEn174RJR90kXavhQ11Q4qztfm0d69QVt3ZvGL8KcEGEts1La2sr5kx9xzaHrHU0w+xrD0TwcRVCwe3IXp7oUSmBWAVJtU/rVM2kWkYrWDEc+j27xm5/YfVse8HC/2oTTPag+dlg+CqigwQTHaGZ/FgpCRSUUlhkh2lVBDlZDH54lSiiE/BPFd4VWyU8vgcNlC5+psPv+yVDf5rO4RtMFZMEazHxiKPZJmVRO5dtFsX4erUOkmTvpZtWwMa6SLc46Yi61wu1vIDrzVDxQfrNYBeGxPKUtKJaY3q2TYO7mWcK+/EU6vWHS+YAjowY5R/3CAxJ29tpTidrDY1hE/2qGcMA/i9fhsTXAb5CQws5POwxWlcKNKvcmb8r6t9/eyRlitjWxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(451199018)(52116002)(6486002)(1076003)(26005)(6506007)(6666004)(6512007)(107886003)(186003)(4744005)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(7416002)(8936002)(5660300002)(86362001)(2906002)(36756003)(316002)(478600001)(921005)(83380400001)(38100700002)(38350700002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aprk+g84nqLMpNNI5rUbx6iM5UMphBCJ9RK2qPxGW7h8m8JzB33rKsiQRtDV?=
 =?us-ascii?Q?pqTgd2pTe/i0h1kLN61ORIlFcpiP2n4isWBMiYUUneQEvNgRxGy1UtDo01ct?=
 =?us-ascii?Q?Dy7orjvXIF1ER90NC0gvD3lD3XUL6L/xN+CMSuo99tN/nPb5hSLUEJRpvjUm?=
 =?us-ascii?Q?iCyg/KQiGQ4eGfC5saOz53S9umPvgZKV+Z2p2fvcOvOt8ZCblkIGPiomX2QZ?=
 =?us-ascii?Q?edoRVO6/J+Pas2jZ9AlVIaGJd7hhpWPOz3WuYOyIQHVWlLXUs1zMVVrkMdEm?=
 =?us-ascii?Q?KBSdeJn7sDvsTt35C4Fw9OtZlpgk+Kt9j2S/o2S3JveIIh2GdQpyjygtu8dv?=
 =?us-ascii?Q?bJw3TM6Vl2goTKl/yxqnEyPeIwGXfTI5nFzIgFXMVk1cyCq9L54cYhNTcS3L?=
 =?us-ascii?Q?LuSly58RXb0K+GhG2FUyjXqgzx8y9MNP+uTMHF6LOBJlnzqnHFIXWJLmQlfi?=
 =?us-ascii?Q?FIg03nXNrVvgr8v+NukhifRPLYg4CWnJ786W8TzVqnEs6iiLfO1TAw354g19?=
 =?us-ascii?Q?aSyYRMh1a+aGVEoZwFKlSnEsMtVZ7MYgwDkhgMpaAFzAldNyvxVkcdzWP57N?=
 =?us-ascii?Q?+hkjrev+7rtzAvF1IuPceA0zNFqGxkCB4gof2eWz5E4Yb6b4bD6sHJguvsQY?=
 =?us-ascii?Q?YzMWA6R1xIGOtXAtmDCOUr2+6J/XTRkdsjNL8dFjqfWo/NhSYUhxL1loNri2?=
 =?us-ascii?Q?3vEuXMGkJvhgEMhbZ7kVdpWaA0NBZ0toLmZ7zbM4e6HEs2m+L087UK8dFfEH?=
 =?us-ascii?Q?w1vl+cyhLtRhL8VkRHwlUgJIXh2TcR8hCJK1idwUHduJm4YjCtPkWTmCqQmv?=
 =?us-ascii?Q?PLqO5+h8Cic2DilnEhehXkbgJDNrtHSQ4WWw8V08JbcxqRusfW9U3SgM0lkD?=
 =?us-ascii?Q?MJfYF/6qFZ+/rkrzprrfDUQ+oK1/HXNT8jOWTflh3Soz2LRmFZNq3NZmx8RH?=
 =?us-ascii?Q?/zAn9ikbrNJ2F/Jn9Xs260X+8UyVLTcsATP6y9MrhbP6xY/m4SNERB8R1fGV?=
 =?us-ascii?Q?t3J59j/nGGuyRwRgCKUaY0i3QAkVPXCfP7rrvAuNPiUN8NgbOyb4v2G45Ow0?=
 =?us-ascii?Q?8ZBtMUOQpugU7fg7FEFEQE6AYap2TlKeF0GGC7eUIuNwnuhNerWUdOrXCOEc?=
 =?us-ascii?Q?J1DHTkzkDceh/gcHn2bEYGxeppiX3jToHz8T6BfCh/+iqmiQwaiQGLyhMy0P?=
 =?us-ascii?Q?RRo45RPFtFyJ8Rwjks5xRrAWRHj6nJpAeDpt+i462y80yje9Cd5WRn1dZi9v?=
 =?us-ascii?Q?UnFBys9tA5/rWziHAe2+3Ppc421RraD1Borf7GHDUSb5PDYuaVNhN1VGcF11?=
 =?us-ascii?Q?AijhZ+Y0rNgUD7FZnZcOVXHwd6Af/086bTtdDaUh8D6fIwoBQePvhW7XntN3?=
 =?us-ascii?Q?BaQeD8lFToPFFI+A2Vj6WSJ8b8Eilh5aIYUPHMsKHfdpMl/zARi/k2FezH8O?=
 =?us-ascii?Q?JgdhcRAFPb0heyF/EOeX2TLusKQHWcWK17l/0E0/pkiX8xi8akjCf7vUXM8x?=
 =?us-ascii?Q?z4oJNpsB4osfWJS/7uBgRB8z9ZvxD3bpjQ2Pce49vpeyJoIF4nUIf4rNXW02?=
 =?us-ascii?Q?50b2EBkBmkDPuA20By6EezsCBfMTa2Cgee4Np7PS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f656adcf-6898-4ad5-6580-08db212b28c0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 05:49:05.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GGE7Fo335S2snThWbu0+AtI41kdP2hhJuIk+9ccCwlb+qS60p9Ofe5+dBMtZRWhKpBx6n8xGTGX62ets8gdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6023
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v4 1/5] fs: add i_blockmask()
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
v4:
-drop ext4 patch
-erofs patch based on mainline
-a bit change in ocfs2 patch
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

