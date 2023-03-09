Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC166B2096
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 10:49:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678355347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lVjZjhO6hPVDxrrFiLMuyLw80kvPSNMI9QKtMc5EwcU=;
	b=OA9ldSFhMHT2emVIqCysVUic+0+8oriCNPMgc1fe/k4zXPCviiDK/GsaTZcglomSMuMP/6
	TTTaTaBunHeSMf3Pi6T+YQb269GwWmFKdTqR4dk7othCQFDIlvMzzPcQjg0UWAaPIunxtj
	R5gKQWJM/PjnbSncQsDfJWRUKlwJ0KI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-4x4z2yGyNFy6v_Qor8MI2A-1; Thu, 09 Mar 2023 04:49:02 -0500
X-MC-Unique: 4x4z2yGyNFy6v_Qor8MI2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6E65802D38;
	Thu,  9 Mar 2023 09:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D646492B04;
	Thu,  9 Mar 2023 09:48:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B56871946A4A;
	Thu,  9 Mar 2023 09:48:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3D0C19465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 09:43:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C528914171B6; Thu,  9 Mar 2023 09:43:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC15B140EBF4
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A03D418E528D
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:50 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-qzSwmmEZM-uE-Q1JTQLbew-4; Thu, 09 Mar 2023 04:43:46 -0500
X-MC-Unique: qzSwmmEZM-uE-Q1JTQLbew-4
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SI2PR06MB5412.apcprd06.prod.outlook.com (2603:1096:4:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:43:40 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%2]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 09:43:40 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 17:43:17 +0800
Message-ID: <20230309094317.69773-4-frank.li@vivo.com>
In-Reply-To: <20230309094317.69773-1-frank.li@vivo.com>
References: <20230309094317.69773-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SI2PR06MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 18824519-4917-42eb-ce3e-08db2082c3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: TaHlsuuOtIbomrEbun33F30ugrEOXJ7z7Q0SY8cVv5MIrgmcws0LK7tyQZFmF3bUwUXeqI7LVKBfYCvaPng0C77rfeutDLn4OyujHQvBwfxkskpriI0FTwFqZq3B3AJ1tc0Alx8pwwE1Ab46fSuk4WcqomTknLdGzQ0J6AAfbpPOXyvZkxfjzFk6QEYXYrgRxtw6VhCjCZGekDqf8rkVJ9bjvu3WIpDaGE84BCGs4UDKNiWMztZyhRM7h49QmC+W5Goxk+KZBvv8pE4Su3V2Aw2gmLNfMIQFo0Ympkre1RT4djoYHS98DQx9DkRGSnDH4z+yRO5aadNfYoELxV3+HknxoEosXEtK332zG8T8rFDqOR1p1lFG/kF9GXvB7XM7eZrH5zeVTfbqYLAnxO8N6e5fjGttoiXZ5B0oo0N9rSFo1XjOATzpboTGwwvJdqG6p2VjBVfx6KWvB7DG2XNS6YFPUAm2kq3ijeTmL78/ydOglM6Qyz4J2Vj6aq9cWqdDTGHtWEf0F+aiIXQk2HTgrkkwfXy/1LXtIwqIvyfu+zrmuDfG1qQIVz6yUllwPHM3Q23nFpqOQ2KSgFft73TbsCavC9J3aU0Xbja40jz76oJK71ItSUY1u3/kS+pKx0iuklIGW9Qz4mShWif9RF2UuOTatV2LlMLm+NVrurURe0t11O/mtVln27yH1MWWlvoJGQoznXJ0C13iofVMz3x61oEoZXyOXBFZWctXNTCv+QI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(107886003)(6666004)(83380400001)(36756003)(478600001)(921005)(38350700002)(316002)(38100700002)(6486002)(2616005)(6512007)(52116002)(6506007)(186003)(26005)(1076003)(5660300002)(4744005)(7416002)(66476007)(66556008)(2906002)(8936002)(41300700001)(8676002)(4326008)(86362001)(66946007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dT5YCFQxsInUBwvXpmWXZj9wZoHXHujQhOb8lpLD2Ey+tI7ENdFBD4Qk1aoH?=
 =?us-ascii?Q?s9Yo+ujB/GCFUm0ZueVSgViCGVXJEsvV5KPjzJ7uMoibPWm+ITUo+JKLXuA9?=
 =?us-ascii?Q?YRHMQr9weeA/0x1cFPW41U2EyzdeS1xJ59Kz+dAYs1Y0VwlbLgihpurmOWWI?=
 =?us-ascii?Q?PJwxyRyertu3gwJZVdBgzrlpYP1gBoTygaSgMZ0SIabtawiRzDxq2Y+0Lwo0?=
 =?us-ascii?Q?C0x5CuQRMEecRJWvzN1ZejVyuSoCM8FpRpoDGCIqyZtwX0ucOqWk9JKpND2f?=
 =?us-ascii?Q?Yphz81dvQAz4cDWKXST+iNuqtmhicgXCwyBXNM58lJUz+cJLKB2nnRBVbN4L?=
 =?us-ascii?Q?zT5C0ZTFORSAXHw5IvJZ6t61U4JCXXxYQuLC9PImOjx2FnmQYqpYlWvdmhpJ?=
 =?us-ascii?Q?t1uEOor5n+gcDVuTYnUA42rMnGtkERVBUD5N1RjTFDIsNyJ7cmHK3ROZv6V7?=
 =?us-ascii?Q?IH1Jgp7qwpuE2Q4H508kx+OBXTupuXSG8WYLHB/BedzxRiUw9URpZyaq0WJA?=
 =?us-ascii?Q?mbVoasV5o+S13LPVsp0sTlLbNy1RncpcwLHn062i37CYNwSc9mPbTlXg0XnD?=
 =?us-ascii?Q?nuvNs3hdt7Am+YVzbIT/XtxyS403FG/vkdvWQmbS4HiT05zkwBiftHNsB8ZA?=
 =?us-ascii?Q?K4rUKlGWddzbe8d1AAeydrlrcToE60UO8jpDupqOWYFQwa4meV1Oihz5Cq1Q?=
 =?us-ascii?Q?8dZBg83gjCErAnW4noSsH01OBqzIT4ikAfRg6dO/qkipqdzeidBG6DWboO0m?=
 =?us-ascii?Q?/7O9E1Sj9QSGATj6yPi2aoHNJ3vLw1uWT5dyCwG8bdgPRSj6TV5zcFmnnMlG?=
 =?us-ascii?Q?Rh7FCU/lZciPhKyueWJiqoFd5EquCbDo9adyi4bjZ8zKB9CQ5+HabhKpv2zF?=
 =?us-ascii?Q?m8mwfRJ7gWgga2iIgsqY8sp+pwo2yMdVUbIXkoh1nTYeZ13zGy8e5Qx9yqOn?=
 =?us-ascii?Q?5/YxApa4fY1ms5tUX9wxzsn05ewWzRSbBkvnLe9t+lr5fDYU/y5QBTnnYvzf?=
 =?us-ascii?Q?DhWIZPyHomSjLxwgflmVU5dXsEHCAFijQCyyLaw7P8+dQg8CAgBvGIy9jVBX?=
 =?us-ascii?Q?gMqTlcdKmB2442zAcWIZuo7lQfpzTKYqxfmXEBeWazUsxN8bXgCFuB9QDrT7?=
 =?us-ascii?Q?7vAyODqeHJZWjh+e3O9Q9Yu8bUd5moxjBNN8aj4/gv8hHKQD8oTNh/qn4VP+?=
 =?us-ascii?Q?wmE7LdBcvkTVCzx6PgW5kLjQF3u2mk5Kl6YKlo1i2V9jy5PAK+xXqzpfUJ32?=
 =?us-ascii?Q?j3t3KMzgJFnQc1dx7dtGxeo7RJof4Btzci9x2JfKMJrw6dOXPK4rpbPrf8m7?=
 =?us-ascii?Q?0s+WgTBD16Vhwy8XTy+XeXyPJVhlrdwVS9+xijIou1LIQasyYCFtzYESsT7V?=
 =?us-ascii?Q?46bFIpXGXRx1EPQm5eebe55NSaHgtCYowfl6UlKiEwpHZpzOx1SuqOqMiScs?=
 =?us-ascii?Q?1g52MDJNUcojQo+zBMK7QTkYV3s3G/Du5pc44CyWqoI5h0YROcP8gRTFH5nJ?=
 =?us-ascii?Q?dsVw8SqQW8aWgdDRA3fOWXxA4ZQ4A/VLOhyI8zoMNkNV2+nVmNPgsN8KYF2E?=
 =?us-ascii?Q?B6oLoKkcyXwx3EyEE5FcyKTlCniRUJylsZeKkGh1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18824519-4917-42eb-ce3e-08db2082c3b0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:43:40.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlXPPrRhlYwwhInBgPc50XLF92eY/8oke3tOmvR9MAg9qpaBSxwKOfQiIwTbxmoGtdOuEwNvSUeJFKREimDDgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5412
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 09 Mar 2023 09:48:58 +0000
Subject: [Cluster-devel] [PATCH 4/4] ext4: convert to use i_blocksize_mask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blocksize_mask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/ext4/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index d251d705c276..c33f91f3b749 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2218,7 +2218,7 @@ static int mpage_process_page_bufs(struct mpage_da_da=
ta *mpd,
 {
 =09struct inode *inode =3D mpd->inode;
 =09int err;
-=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blocksize(inode) - 1)
+=09ext4_lblk_t blocks =3D (i_size_read(inode) + i_blocksize_mask(inode))
 =09=09=09=09=09=09=09>> inode->i_blkbits;
=20
 =09if (ext4_verity_in_progress(inode))
--=20
2.25.1

