Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D946B28C0
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Mar 2023 16:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678375429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F6JKzfrAbC3x2DsWyrVXZK2cLAYHPysmfWSZSbNsgyw=;
	b=hyHf4SdEf/v0+1w1Rpi+4kb6BXGX7SawrIgIo6FE1k2sw4sboXNkopi7/uC+UhZ6NOJkIQ
	CpHFRfBQkK8LSaFCndIZAM2rzBZDYuR16XVnRBVZTXnoPlsRiKpNoka14MgepkFbA722SX
	hCP8SuiOJvTQKCX9kzQSzBmIIy/S4Ks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-CRQOlsckOpaXoKgwPYp0Wg-1; Thu, 09 Mar 2023 10:23:41 -0500
X-MC-Unique: CRQOlsckOpaXoKgwPYp0Wg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8921F18E53DC;
	Thu,  9 Mar 2023 15:22:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42613492B02;
	Thu,  9 Mar 2023 15:22:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 08EEE19465BB;
	Thu,  9 Mar 2023 15:22:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D8521946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 15:22:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3E9212166B2C; Thu,  9 Mar 2023 15:22:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F662166B2B
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:22:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 245923C106BD
 for <cluster-devel@redhat.com>; Thu,  9 Mar 2023 15:22:33 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-D_lo79ikNTquPmXGv2UPWQ-1; Thu, 09 Mar 2023 10:22:25 -0500
X-MC-Unique: D_lo79ikNTquPmXGv2UPWQ-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4073.apcprd06.prod.outlook.com (2603:1096:4:f5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:21:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:21:59 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Thu,  9 Mar 2023 23:21:22 +0800
Message-ID: <20230309152127.41427-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: aacda692-1cf9-40a2-33fb-08db20b20679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: G4Pjw5dPbaeSobXs+hHJALkpNaxqVrInZ3P/dUvslGuaxS5icrGf96zouh8jplvNB9vxQpnsRa4gaNPe9gzbGAgkRQuqoMpWK2YtRZrYOxi/fHbUg0iZZk8HjtMdiLqjf/ov0dojwJNNBbB/ygRySIB4bIdMEODvYaTpf3G0gVGsT0D7Jun1L25zdyUQ7QsQW1yWhfSr0+MOlLlMfqv+5xgdiGTE0/9yV5erJa68ZZueXzRTWL6oKJ9OuU8nXswEKxPdf6Sf5hNnaShnX4myd1MlY0lTD2ARtH5B90utrosTWZMq4TDVQ7rw6xlI6tyqtdGvGSVcLF3zxvUFn0vh1NBpjmbexF3RsSAnIj0JzZIh/N2GsbArXeBQUa+8qcXm3W0QJEmgOYGEtW1SNhwc7PT5S85ZuHMsis3CphPJz7RbmM200a7tUwDGJVpAcs2MkWYQi2cRBgudTs6l9WsnCyFwsL92Oc6AR6/FreBUQfHdmWY+LqBgWE9Slrq4X3+PdpDRUWf2u7sbODRjuh4UIcCi1fScvBGSQsiFA2hJ46TQ6HjXkwogwGmwjhaadTdg4JkwBll4ZuUrp2ySrxyu7VmevNbfjyYLp6VKPcMX2hJdzIL12yyxeh0lT9FPrjtv2D10vqjZ2dBlaq/Y79ryV3Uyg6BoTbLONg9I29xM/n0CUZYLqey0NKtt3hy9QrqF6Jzy2RudsrKq/ACGuN/QN+lKCqraob8o7IelUu4FL7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(316002)(36756003)(921005)(86362001)(38350700002)(38100700002)(1076003)(6506007)(26005)(107886003)(6512007)(83380400001)(6666004)(186003)(2616005)(8936002)(5660300002)(6486002)(478600001)(7416002)(52116002)(41300700001)(4744005)(66946007)(2906002)(66556008)(8676002)(4326008)(66476007);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFx2AaYmgjQTOiYJdNJ5Y2pz5I2+7gQRUQbTGVCKvSa8v7E+P7ep3I00wZSv?=
 =?us-ascii?Q?VfE0nFh+V+/xPB515Yiy/hhWJnlrxR2D24OkN7vT5hrKrOwK65WOdtB/q3bt?=
 =?us-ascii?Q?Cg4GXr1OcU9EWW5SXgSdswmVrlvFNICPgND5kmkmOg31+mLQ/FO8TKs7y46U?=
 =?us-ascii?Q?RKav4GuVECPl3g8Ok0L3KrAnJEzy4g5Pjrv3ooz/N+BsiyGlJo2wVWrK4gOk?=
 =?us-ascii?Q?Hx2EXIT84qNpt28auIFSAmWOqLe7e8lp9+JnhOZ0Hna6ElQYpx6XsEbYAP8b?=
 =?us-ascii?Q?2+TPTk5YPXLjFSrF+KdC/VDd5bKdG9oRDm7lI283GnZ9YRrzr7xX0/znm0MS?=
 =?us-ascii?Q?kg2zM/eD0Z5a4mImqncZgy0mNRzjS9y9oPF6CdPLarhGsKj8EOPuhx1hiH4l?=
 =?us-ascii?Q?o55dOTH46d4uIQYnWJYxb36hwjopa+sxAN71ybNjJsDhy2Q5d/vmvskZvUVc?=
 =?us-ascii?Q?xEr+h97vTkmopm4HLy8N1O2AMxRucb3LR2kSNbhFaRMQuyFtSX+EGl1RRUL8?=
 =?us-ascii?Q?Plh/gbNRe8IS/91y5TgY6uW3s0e/aUUcN4b6I+VRyV+dfQco+BXJYpgH51bi?=
 =?us-ascii?Q?L3oDXGZ//CJxHIU0GW1sVPHgPeNaa5NhxGYMz9F/mUWnd2KerbGPDMx932/T?=
 =?us-ascii?Q?YLTGfz1BvRnvSlik2oaFpdLdZcBnpn6YtIEhT5mONy/vjZZYoAbmMLB82rbp?=
 =?us-ascii?Q?tRxFb1of7/VPlkdMzzbWgudYviRcB4It6hhNjLGwm1hLN0slh2p3XAT44KaM?=
 =?us-ascii?Q?9IPR/0zcnNsDzGfOe5xUNCYlSbIVggR8FdGOtymqpBKxqVMe8Ar7NjVOrrNZ?=
 =?us-ascii?Q?MF73ThDzGmF5vbspU5mD1DtUdD+P86kcvB1D+ShJ1WXvwEnvAbaJ5bZaJ+A0?=
 =?us-ascii?Q?hL/l2HW7q/spXdnqB6TVIoLg2MAE9JnNXfzgsIuw1Plj7Qm+3mU6kpt5nLZU?=
 =?us-ascii?Q?t6mtWMTBVLx0AyboOaRr47q7TmT2Qo2HnJvJq4XYi/efWXkTwFJqimyD2z6D?=
 =?us-ascii?Q?VuVmB3oATIbFca6/vcI2oUELNeyxOevQ3WEcjeZLgDD3qfMk+vagfHq9C7Ig?=
 =?us-ascii?Q?QWbVflP8/m3opCF6XYQPhef+qBLYhsGh1pt8tKhOFQ5phA8V1KbdcYeqkuOQ?=
 =?us-ascii?Q?Ba0LLLP3RDkP/b/I+RSYNadSLCUk8nykWiG2d1yjySC6koy9py/eXuCn19A5?=
 =?us-ascii?Q?ACEBPiuO1J5+iM6HQjiTlLEwo6F3+nYRGHYY0REkw3lfHwapMsZJM6Eho4mt?=
 =?us-ascii?Q?Do/NFIq9EEQ0l1fZLO/KBXQyzYZBAE2uSMsAb65B3OXg3SJoESDA2Ff12zyS?=
 =?us-ascii?Q?m2MQhiF4Jk4Nb19tenHd0CnhzP3FFJR7mV18bLy+byQatBjnhMQb6syxZcTX?=
 =?us-ascii?Q?8Rbik+sQrcd32mOHluSAB25n0Jvyx+c0h8LnWnpD1K0eHwAi7lhyJwnDpXWL?=
 =?us-ascii?Q?Tdx4Md19zaKfKYbVwhSLY8VoKto/mpq7hLWp1kkwRQZbxsQTK9OAvELAISiC?=
 =?us-ascii?Q?qqOBniy+WF5ditT2ovAS02OEPJdCpoXN3fheGiSJWGCw6PGoShpK+wMU5Nrh?=
 =?us-ascii?Q?cQVagMdHPE9VDkQ+Z7PmcMs3dUY+Re+9mJcAZWp0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacda692-1cf9-40a2-33fb-08db20b20679
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:21:59.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otqDAUOTrXaBBUEezH21yUh1L+jDlF9Dyb8Bvsa2Kw1WC6aF8euhBTSXugH8TLCPAudua1xbzopsJ55utVQnWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4073
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v3 1/6] fs: add i_blockmask()
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

Introduce i_blockmask() to simplify code, which replace
(i_blocksize(node) - 1). Like done in commit
93407472a21b("fs: add i_blocksize()").

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-none
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

