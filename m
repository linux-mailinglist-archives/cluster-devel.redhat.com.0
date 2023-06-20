Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C18736883
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Jun 2023 11:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687255107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZSh3qNYR2BMN65vSszTh7cVDJ+HIMHhOW+cMFW3LEsc=;
	b=dERqr37wICw/GrUkcZ1iwvfOLuZ2UNFeC6+CbMROc49ZJ5kuVUc9OeJZLcs/DOOiaVurE+
	PGbfXtl7dFr0SdjT97/rB0w00+oHdX4a75TCWcHlL2NC66gSQjkefPpDwhRB01XxqJdwPR
	XDsgINWeQl/LsHk03pH/Z5G2Y9NVTvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-BmH_K_MwNJSBTlMZT_rOqQ-1; Tue, 20 Jun 2023 05:58:21 -0400
X-MC-Unique: BmH_K_MwNJSBTlMZT_rOqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43DFB1C07247;
	Tue, 20 Jun 2023 09:58:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31C22200A398;
	Tue, 20 Jun 2023 09:58:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C81AF1946595;
	Tue, 20 Jun 2023 09:58:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD9D9194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Jun 2023 03:47:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BE5E8422B0; Tue, 20 Jun 2023 03:47:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B66B910CE7
 for <cluster-devel@redhat.com>; Tue, 20 Jun 2023 03:47:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66BE0299E75D
 for <cluster-devel@redhat.com>; Tue, 20 Jun 2023 03:47:17 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-3rtFc2biOiqoVclrJzqleQ-1; Mon, 19 Jun 2023 23:47:13 -0400
X-MC-Unique: 3rtFc2biOiqoVclrJzqleQ-1
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5)
 by SEZPR06MB6644.apcprd06.prod.outlook.com (2603:1096:101:181::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:47:05 +0000
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c]) by SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:47:04 +0000
From: Li Dong <lidong@vivo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 cluster-devel@redhat.com (open list:GFS2 FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue, 20 Jun 2023 11:38:39 +0800
Message-ID: <20230620033859.997-1-lidong@vivo.com>
X-ClientProxiedBy: TYCPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:405::18)
 To SEZPR06MB5022.apcprd06.prod.outlook.com
 (2603:1096:101:48::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5022:EE_|SEZPR06MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3541a7f7-2836-4c28-8b53-08db7141030b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: l5n4PUP63YtDBW4DL7Z8q99W13pWMzuxeA5RsZ1zwqbO+Oq1DswUCXcViqxtCfLmpiDYeTjFDdwrKZa/xEKitvAMHhYLP8R4f5NQpes+dbtm66Q0pHTrGWoixd+L7CmQ+eRarhnqLLHxBQm31aBez5zsfOozXMkVkB5i1zQgu0g9v0gaXBH3rR1SNb9Wco3R3IJ6eZL2r62kf7mu7mhRNWnDyuL39Rkg9+eZA4v+Wu4fypWx4+r1FN7FvJHYYsfNZhwJpiZrwiSPLQkysT/LM4101uMfnenoz0bScDgJ4DAsbOFrsaAX2EWW7nESx94giaq1DnATEawAzljkJPZe88OlJAHO+w2K3ePuGTXKcV8MYzqHSPHAVKhfKrzZ7EqS3XEFAiBF2jlc6BpnAcbdKYj3HCnrn4qOzBknqlXam8wk4A7LH+a3aKkfO+oAcYPFmd0cXvVBw7Kf1JAJg91BcssnR4LTLi6td2xx9U8AHG9Veumw5h2R6fvdFWLlj5G3G2doXju8f+EE3B1jNOGMb4q2x33+NdeZ1kJG10XGilMURnfOuofgVTNENwGaN3eLTv8k66G72BFOQBXyjbJgmKood1DRDxw30fULWePTQBBNl43pdoWOWqiTToq0bZZ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5022.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(5660300002)(66946007)(4326008)(66476007)(66556008)(1076003)(316002)(36756003)(4744005)(2906002)(8676002)(8936002)(41300700001)(6486002)(110136005)(86362001)(478600001)(38350700002)(38100700002)(6666004)(6506007)(186003)(107886003)(6512007)(26005)(83380400001)(52116002)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uUPPWKyekKRv2TkpKCHUNbrZ0U9Jrtf4Z1jnuXnCMQRC7OQvhKVc3NDUXVBp?=
 =?us-ascii?Q?xxvY0wLVq7VzK7A1EfsjscmFOcYKVFf3LtKjglZ1ICOxf3VRDqVHzBdDl5Mc?=
 =?us-ascii?Q?ncJ11S0ugzhIemiejidIg84BQKiz4ifsr/UvOuSDPYAZmrzq69Kr98yIpuhy?=
 =?us-ascii?Q?O0ZMjNcH0kOYV7Gz0k7wYC8YDBrFiWfnfzGiIUM7JNxREYO2c65jj6tEw56G?=
 =?us-ascii?Q?YNn7uIhNbmaCW+nDg4Wfv6gtetSTf0rgN7jS3cz/I1O8P8Q5p0DBG7uGA0Ik?=
 =?us-ascii?Q?iLXf2Cua5ImQbn/imZSoCX1fOqZ/LomBvKzZF9wZuqwbszQz4yLdJH2ngUEg?=
 =?us-ascii?Q?bV1sJ1upzO1sCh/vqspFw34eqMnwUzpYrrhSTGxHPpPIgGsgd1dMUltQK1sH?=
 =?us-ascii?Q?EtYINqqYW/m7AeG3tHkxTpBnowlNzrsoyje5Oj3MQzJs8s9PvThoUHyKf/qB?=
 =?us-ascii?Q?+hd+S+DuBEDEY1NeR3FHZojKwob2IcH3x0xO3u1iPtiOK6uKHTd80ARGXLzg?=
 =?us-ascii?Q?XOLWIxbmuGSBzKpMDlji6HuZ0KnUtjsA3y6Bz9jzGr2aGvt1sqrcPTbj5m50?=
 =?us-ascii?Q?XSWhH77jX23+VzrOQuZj4iOrPlRVyh3amopoM3qvcvlz7zkjFbcxvOTT1oo4?=
 =?us-ascii?Q?86PTFa598t0sKgXEvP2Kf2HjCgFK8wzaSHKgc455szJpZGxYUJ9KG0VgmOTE?=
 =?us-ascii?Q?veVcVeRpqyp7oVo6QxR57QIhvvGV0qKyGijFY9nEXnDmYghoWD9YnMJDEATB?=
 =?us-ascii?Q?5IFDMc0iY57+oztx5oDDodUdMWsKbfHlX9iScY4nnp6FvnPvvuHa85sG9k6N?=
 =?us-ascii?Q?MlvoE0FVnx5J0vLLzuRsAZr++YF88zlCEIY+xX6iiNFF3U/Al8cR1DGDDWqB?=
 =?us-ascii?Q?yhPMIVgwfrp1BIFEytpnCzMrv5+R8g8c2RVn21UMfG4C6gKb6Wbmb+8piz0H?=
 =?us-ascii?Q?78Y/a3k0JRrMrWMOQoUBRNTVEve2Z/lBg4da5kIiwA7yMsPecb60oMurPk2T?=
 =?us-ascii?Q?Pto9n+gX6c9huzIsFQjWRq5IQFZTl7apkfNq+DC8M4+cA6VCsPPFuX4u4uN5?=
 =?us-ascii?Q?oTjBUuGYSHtEQ45g5689w6zbSBtDofxuhcO7/PF5Xa3XNYw/wo4JNuiWTNjA?=
 =?us-ascii?Q?nq8OShVD4y8numqpomfJ55PXEyll5Z07SE3P00Z+qjR6LAnZpZSUz86Ov1jA?=
 =?us-ascii?Q?y99FQcRsMhQXF6FLvs61owDRsafGzqAgDPCgtXIrtLqWQVNUQnTQOkfwKC+y?=
 =?us-ascii?Q?DHK3lTEfU1GMK3LERpqEoXsKF45Z47iWCCneWsldrzyFO6I+ppZY5K+GDnSx?=
 =?us-ascii?Q?X10d0Si7I1vqyl5mZ1l3JK7M4da0+SslXnW4txQU287q5Pakz1EFHsztY7Qd?=
 =?us-ascii?Q?SsP99SgATXlaVVCd+YaRWd9f+lmiZNG6VkR1eWGbt8O0R6cU1OAYFPrZAqL+?=
 =?us-ascii?Q?1SjBfFNANcq/1lyy8QbQmKECye0kCOBK4l1i2SW5vqntahoThb3GMWyVt2JH?=
 =?us-ascii?Q?666jJar/sjiAWRCeoJZd7khbwh55IXYeZUvrlxpGoL8U+lSxViHkeJJslCCe?=
 =?us-ascii?Q?1Ci/KUNRmvYoVTeJm6UavRba5lsVh23/pSpDuLOF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3541a7f7-2836-4c28-8b53-08db7141030b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5022.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:47:04.3781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAIcxzaQpuKC6+YJnZtd05nyyvrN60nRBkeAi0qxkBBb59koyg/CR1MowfXXrwUQNuexU9jX0FkvBFto61+xQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6644
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:58:17 +0000
Subject: [Cluster-devel] [PATCH] fs: Fix bug in gfs2_freeze_func that can
 cause deadlock
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
Cc: opensource.kernel@vivo.com, lidong@vivo.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vivo.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Function gfs2_freeze_func causes a deadlock=EF=BC=8Cbecause sd_freeze_mutex=
 was
not released when return

Signed-off-by: Li Dong <lidong@vivo.com>
---
 fs/gfs2/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -741,8 +741,10 @@ void gfs2_freeze_func(struct work_struct *work)
 =09set_bit(SDF_FROZEN, &sdp->sd_flags);
=20
 =09error =3D gfs2_do_thaw(sdp);
-=09if (error)
+=09if (error) {
+=09=09mutex_unlock(&sdp->sd_freeze_mutex);
 =09=09goto out;
+=09}
=20
 =09clear_bit(SDF_FROZEN, &sdp->sd_flags);
=20
--=20
2.31.1.windows.1

