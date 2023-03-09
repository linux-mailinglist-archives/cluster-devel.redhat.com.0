Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9206B2097
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 10:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678355348;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1pF2lf/QTjSsSywmnFn4jrdu3SgdO43CrKT4llWz8Jc=;
	b=MGMmUNFl7E06IBD8I19qvRuW1pTxR/0lJF4i1FeWiDViRey7Ep5ccdxOXdejxmN1eAARNI
	ReufBGtfi+aKXMWq68NU7f3DGnSi6Ru5nqRl5ZXDhyw6pg8CNX0sG8GFiZ5kSeFzkN0VNH
	rME7Y8hcU149Y9x5L5lSJCIHNVsK9sg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-g9zgx2rfNyGU196c-l8dzA-1; Thu, 09 Mar 2023 04:49:02 -0500
X-MC-Unique: g9zgx2rfNyGU196c-l8dzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7FEF1C06ED4;
	Thu,  9 Mar 2023 09:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46693112132D;
	Thu,  9 Mar 2023 09:49:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C40021946A69;
	Thu,  9 Mar 2023 09:48:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF9D419465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 09:43:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B0AECC15BAD; Thu,  9 Mar 2023 09:43:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A844DC15BA0
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B6CE811E6E
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 09:43:47 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-Z03gjk83OwmyI2odnbxYiQ-3; Thu, 09 Mar 2023 04:43:43 -0500
X-MC-Unique: Z03gjk83OwmyI2odnbxYiQ-3
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SI2PR06MB5412.apcprd06.prod.outlook.com (2603:1096:4:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:43:37 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%2]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 09:43:37 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 17:43:16 +0800
Message-ID: <20230309094317.69773-3-frank.li@vivo.com>
In-Reply-To: <20230309094317.69773-1-frank.li@vivo.com>
References: <20230309094317.69773-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SI2PR06MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb44c55-1250-4b6e-a1bd-08db2082c1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: ZgK85Xs/qn79iTJ3559oP5DvbzxAaUrb0JNiAF5t8r4aAI5dmGXPu1AB/1k2sMa5e6YTeO6omL8zcB/QCBXdHRC4Lp9Ernpe62BXGj0ZF8TDFWygbVpOf+B6AquX4uAOeP5BMt8GROSLbY8kLPwT02uaI1VAFvT2zuK0lVQn0U0XZeFvzAjH2LfTbyFCaDElgQciLrre6faQnPl8lVwoqQf5p3KcSQ2yY2v+S7td2+qAqtf7qkFAXqbnTY7Nm1gNVMNesASgyo7dinkfzMNpJOHqgf3UUP+5kt7W5tRvWGaQywRIzZo0vQXAKHDkvqezjBM1pzGr2E9fBP5eKWVODfONHiPE9uf1hDCGct1kKLbUP1+4Y7AUQm+EGMe84yK/GRFDF6VNh4oa2cbChqo0S5ERj1p8RFv27OxIWrNS05x4/FtFHPDhUx7Ds6BW6YXvFRQNtHWZnADYGAnn1r11iLat3JB6xece/P7TELvqG42+cs5w4l9OBebxQz00MHybfBS/ByTEiLBDSuDEBMhq8Y3X/JdILNtSWI6FRJsGNfiURBULICt0MyYK9nDvVfhQUV52kATZu5ioBB5oNcSA/Kvl2NUjBK9TGhxywFZomIbMygadJEihN5PQaDrDqj16sdXRmg8NpF8oKvr1UP2KYrQ+nXe/sPRhT9z+0sLCx3JWzpDNG1vBUt1+igMYqru2Zh+L6EZSQVBsribsE1/fjeCy5QI3AiT05v6b73n9LGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(107886003)(6666004)(83380400001)(36756003)(478600001)(921005)(38350700002)(316002)(38100700002)(6486002)(2616005)(6512007)(52116002)(6506007)(186003)(26005)(1076003)(5660300002)(4744005)(7416002)(66476007)(66556008)(2906002)(8936002)(41300700001)(8676002)(4326008)(86362001)(66946007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+jLDIfmak5fUiEtamrAa133B3Ocl09F7d13JWK4V/bAgiMNIMVbTni8Tnnt?=
 =?us-ascii?Q?bPPwe620ISqLL01SP73yA0zkYuSMKWqE6UM+pa7Mnzv/rY1hXNYd+ZCkmqfF?=
 =?us-ascii?Q?jktIzCjQTLYpZZB2KpJNXDWGIjCmLDAjsedUZ9xDU0K8/uIwHmabM3H+Fcim?=
 =?us-ascii?Q?qsRnqQuVO9q3/kqoIPGKJpRICWYxcV+SjSQ1FX+SvcBarkSQwp1KIsG/g4gK?=
 =?us-ascii?Q?MFMe9BoTd4Z5/IJBayrZuLAhCXChuTpHw7qcPg9GYoIltsG51A6te1DlfFLa?=
 =?us-ascii?Q?UzGC+XYLG4AJfTY4rr/lex/WtPi4juXjjVZu8q7Na/cWXEj1TamuryGMRTDB?=
 =?us-ascii?Q?sehHyIBof0pK32VXoQN2aOeZBPw1aovktpOTSYpgnL8ncwa+3mefwAbzsuy+?=
 =?us-ascii?Q?tE91kXQdy/QnDISwsXYHG2Da6eRDX1Qajck9E7KWmzHJmqjXtmWKOKi6RhNh?=
 =?us-ascii?Q?TXfJASjd12mYkV4n/6QattnbzKjgEma3bYZKZ4MJefLD55ZEXdgoimHBaido?=
 =?us-ascii?Q?sqCy9QidJiIyCK722woDsEdUMWZ42t6y5ywe3uCSNM7bAVkN6Xcfncj1A7IX?=
 =?us-ascii?Q?dpy5oA185OHjWNbM27lkLB6SLcuVFIGG5WkmrP8FmTVrRXuBDXCVWiKJmdc7?=
 =?us-ascii?Q?++jql9Dnfu4KmrobL2orpbmIN97jQqZqs6qpv1s0GEEwlcCFctVQLFrn1PfW?=
 =?us-ascii?Q?5lblY8ivgqlzQXdyQxvbNJm8FyqE+7rFILEt+10rCBvpT0SCN3sYPkO5fXLD?=
 =?us-ascii?Q?KTkSZB1Eu9Cs99mUlU3z9dEGcWweq73wPp+sNyLcMTqHv7EQyP9jyTp9El4P?=
 =?us-ascii?Q?OOBdrdo+/n4ppqm0e5iVI8kXia268iDzSRp+CURQzIPBLHOBr9dqqM+Ydqj1?=
 =?us-ascii?Q?gbx4cxxUVXvMrKZIpd2Q+HqUPe7JQBMWIn4UYujxEsytLku3C8Uum5oBm4BQ?=
 =?us-ascii?Q?zjP4iHoFr9wxxQ/jaXLf+eufMSv2xUPoUA3KxZwms8zYKc5D8go4/iWQSWLX?=
 =?us-ascii?Q?jGoQPDlYmWWRZWzU6ik/qatfV9XQnSSZYg8yIVG29lnDovmKkL7+mn7zSvFT?=
 =?us-ascii?Q?1ffMKVCzGhZN0uJ3C47QurgSmjGVmIFTvhW32OVdqcWV81Xd5CeZTEvpnkBK?=
 =?us-ascii?Q?8CDoCu++kj8gcsmoLdniwQMxVtrKyzCfwCqLGLxiMPoRaWR+7M/JOqAhxuKX?=
 =?us-ascii?Q?4aYGVzAmY7ct1DnwW93jydLvcld5/OcZkMTGU9owEVJs6CxrVgeVInqIOoPU?=
 =?us-ascii?Q?RPnet1wLOF4GATJcoaUi2ZjjLIfApm35ueFhvUA9k7oz88+eFd5AIp8jeUoc?=
 =?us-ascii?Q?42Ir8s/HTXIx827Ww89VW/oDCJCtXi07PDSbA6DHnKCQ7pcTtramKQ5eS+QW?=
 =?us-ascii?Q?xWfHOPHdLvZqAno6DTYOD4edx2cf9bpnlKJP7K982HsP/d7roKQD16h+jE0y?=
 =?us-ascii?Q?+qr8VlJimixq0SUyFpsGvj9GehdvfGtmz1pCLjaKTnKz6a2vOWpHzHA9kld/?=
 =?us-ascii?Q?LdEAqorADv92j3C19Jj8VDpsYQR+wWifBRlMVC/wFbOQYbwy689JQcuutEpW?=
 =?us-ascii?Q?79x9v/bI9JvnzSHnBK1iIM1J//RyAwT2O4kRFCJr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb44c55-1250-4b6e-a1bd-08db2082c1c5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:43:37.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUbJMThK9/0Y5/1w0Kp2MLXdPUxUR6tNr8p6/f3tbF7DsJYvSdWaZxMVdqVNrfm9n6UgOd7C9+IU2L8H/inuxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5412
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 09 Mar 2023 09:48:58 +0000
Subject: [Cluster-devel] [PATCH 3/4] gfs2: convert to use i_blocksize_mask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Use i_blocksize_mask() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index eedf6926c652..d59f9b3f0b85 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -960,7 +960,7 @@ static struct folio *
 gfs2_iomap_get_folio(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
 =09struct inode *inode =3D iter->inode;
-=09unsigned int blockmask =3D i_blocksize(inode) - 1;
+=09unsigned int blockmask =3D i_blocksize_mask(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
 =09unsigned int blocks;
 =09struct folio *folio;
--=20
2.25.1

