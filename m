Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE573299B
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jun 2023 10:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686903306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iSBWgVjUhOeerx3olbAot02ShMo1FJtdO0LIqH+yGVE=;
	b=brOEOsNkIdHA5cOsjlSG3y9vhuyyW09rM/Ojef1IpN/p9lFWSi86Gghy4QrxeYTbJghapf
	9/yaU0s8vABoOIsF5lXdZn2Ja6z9iXKTn8XMpZndClN9J9MBoWclGINunmZxxPza4vd+JS
	LYk5PY4L3vomwDzmVeQzLMe2gWCJgoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-CrjHeKqZNPOH1Ot3cuWF8A-1; Fri, 16 Jun 2023 04:15:02 -0400
X-MC-Unique: CrjHeKqZNPOH1Ot3cuWF8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F13CE81DA54;
	Fri, 16 Jun 2023 08:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24C362166B25;
	Fri, 16 Jun 2023 08:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D23D619465B8;
	Fri, 16 Jun 2023 08:14:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB47F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Jun 2023 02:49:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C893B140E952; Fri, 16 Jun 2023 02:49:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C078D140EBB8
 for <cluster-devel@redhat.com>; Fri, 16 Jun 2023 02:49:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B3CB185A78F
 for <cluster-devel@redhat.com>; Fri, 16 Jun 2023 02:49:17 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2101.outbound.protection.outlook.com [40.107.255.101]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-RozdhvyqOWSrNm-SUqzgbQ-1; Thu, 15 Jun 2023 22:49:13 -0400
X-MC-Unique: RozdhvyqOWSrNm-SUqzgbQ-1
Received: from PS1PR0601MB3737.apcprd06.prod.outlook.com
 (2603:1096:300:78::18) by SEZPR06MB6040.apcprd06.prod.outlook.com
 (2603:1096:101:ec::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 02:49:05 +0000
Received: from PS1PR0601MB3737.apcprd06.prod.outlook.com
 ([fe80::9531:2f07:fc59:94e]) by PS1PR0601MB3737.apcprd06.prod.outlook.com
 ([fe80::9531:2f07:fc59:94e%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 02:49:05 +0000
From: Wang Ming <machel@vivo.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Date: Fri, 16 Jun 2023 10:48:24 +0800
Message-Id: <20230616024836.577-1-machel@vivo.com>
X-ClientProxiedBy: TYAPR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::28) To PS1PR0601MB3737.apcprd06.prod.outlook.com
 (2603:1096:300:78::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3737:EE_|SEZPR06MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: a73c0201-14a4-4d3c-a1e0-08db6e143f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 020LSNA+hZ8TjVVwzNutrO+mTsEXDAdPeaP3jymGIFWfpaSMctdKOi3ZX0gKllSj5JlQ0Vbdz02Z+phTSeKEpB3aI0BsI/lELdXp1JZAQOt2pfFtGz4b/pvvK+sLST6lcOctyfJwvlJ5C8O75F386wf9MD7bYtoed1let2w6QE0vg2/CWV28kJbQNzFxxzu0PWMrGf3F5nH2C2vnKdN7349m8o4AA+WNIPJgZRU2Ed7YUFiMiVXj3DjfG5uWCo40eQP8ECp7q178qwNsZS0a78kiis8IzkDj+4KKLIFvKS4TqI40QMy9TX6o6aoQQicnkzYxMJloWIoK63BCgRevq9+w6PnpCb6YV5gWU3LpFiBRxvOWLMDPPOGsbUVmwjsi9eQ5uF/U/28uQoSUwux7gt7xjmqUMJtzz5a/1EVml+toq/t7SWnM4XeYHUhnmB/2sJ35Oetn/aLOKEpJqDvl5Qs3St2s1S6fW14ivqXTnT2ehenC9Or1XcgJ5iFQiwNwFmxU0ah2HbX39wnA5GywL3lFLrTJgvD35gmOY1neISMPiKwLR0/L2ZRgq0aUf6FawoNMZoIOWxgCp0yzqe4QRyck6MQj7kQJkpvQYMMw+bXcx7sneSJxRtidn24KHDt4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR0601MB3737.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(110136005)(478600001)(6666004)(52116002)(6486002)(5660300002)(8936002)(41300700001)(2906002)(36756003)(86362001)(8676002)(38100700002)(38350700002)(66476007)(66556008)(316002)(66946007)(4326008)(107886003)(26005)(186003)(6512007)(6506007)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FwnfegnS5uyDKGzXwVAusFxThPNEkmcXN9eqYsCLdu/B4ZbNUB62yY5x90B/?=
 =?us-ascii?Q?5Mh3T1OVmzjA8MUibdg0IH34qzXklsmA4y4LCybe+T/cFcvrxQlNn2hQieP8?=
 =?us-ascii?Q?O2hMuqsZ7VqOTkFk4RCu07NFVXM1stFkRy3PVA9Y+wMsdkuxqh2M7mFL+pGt?=
 =?us-ascii?Q?7qxG7d+WcY+tyNypzkjG/urMGVdU9EEOZL831SmO04w/xJ6cMhGPKuPW00E3?=
 =?us-ascii?Q?NO98JYVLVKuVpTwpGrjseKZLvhVwptZI35S6MeMKdaxfV51NaZ9YwzuBCz1F?=
 =?us-ascii?Q?HfW1lgVlLjORDiaxRNCSAM8KQXjHVa7Dp4pvnsRbyFcGuxlq5HzpV8YilYWC?=
 =?us-ascii?Q?P9Pf85S+bA5oSEnZGC6VLuJ52KwnnnofBiUsrhc6SCvgxndDhzJzEBZlZ5em?=
 =?us-ascii?Q?9UUTRKb6WFKk9UZ1rIwJgfv3YLJlb0ZIb3T1CbJ+01Uzv+igkTDfnw2XisDN?=
 =?us-ascii?Q?V+8EhYJA1IHno1Yws9kAATMQ2RJiSp9A+QB78k8N6biSLMpJpc8AVQpKP6O6?=
 =?us-ascii?Q?ONkIJ5JIF2+R8MdcV6fR4kYyZ/wAKl1mXdxzlzflo9TwSJO54ehujQeZz7lg?=
 =?us-ascii?Q?DBji+gQeZhMtSsmsq4OTJgZVSIzOHLk2LaBV/oQyom+9bFaXceMsgBKgFtae?=
 =?us-ascii?Q?IxPDa2yxQK4tpQwgq/SemhZwGLeYMkuRCONu2EGsPJx4oFvXimbI5XMXvbOW?=
 =?us-ascii?Q?JbePjS3ngzYady0qL+1YjXJmkvxMvPjnsWGYH3NOe+hYpAy9zuL75eKChDEx?=
 =?us-ascii?Q?/gA4BTIRRd8MNvfPaTY6Dr7SaW6aYnuGPlCrf24PhzfiCtvsWPCorRYqCdLU?=
 =?us-ascii?Q?HX5tRv/7M35ihbbSesJLWmQy8v1cu7M6ZsXS69kVdNDKVZsUowl8/X3h9a5v?=
 =?us-ascii?Q?izotr+v/zJ/jk8+GcZUzWDls4N3paCEEzA0XKDr6sOqb8xNo2WUxZDOKNc3S?=
 =?us-ascii?Q?0ziquyUXWsMr9m5fIimF2tpCvKW9oag5QIFmBgF4DAwGkEDzgDz5YdVStO59?=
 =?us-ascii?Q?NUM7lLca4g6PIwCHJgojbmsBkJMEqAiR0yw+lxROkMvEuhufXNf2mh3zn8Ob?=
 =?us-ascii?Q?e9AK1JaFZPodZY8ieNY3hhYShoPlQBttWc+Y0tlRjNFtLKv9697D+PplgOvQ?=
 =?us-ascii?Q?fpJQwLnxLieeNbcK0tXGT6nK1P/e74rv6Js3sJyRj+d2ibqCTT5loFpWEuW6?=
 =?us-ascii?Q?WdOCIeonUwqzdSo/lRl9hiSiYXU/wz9m7AC49mdfgjO5udHRWQlIIcxNPc8y?=
 =?us-ascii?Q?BI9CgjfUtNI70ORsd63r5Xl68VOung8bgzOkpVwH9Ot1abz1Bz8RwMTm1TSg?=
 =?us-ascii?Q?7AFhYKPdRXX6w2ESjAwLhZ+JYS1b0ve2Nco268F2JLqhp/Xa9rNmNsvtlZS3?=
 =?us-ascii?Q?ec3D81Dfo4X3S5YWsrH5GJ/47QKSrfCWGc097Zg11Aei42YBakf2omX+jNI7?=
 =?us-ascii?Q?zKEBOyru0AyQH1v8vkgCsNe+iXDIaWbhLAxNk9ENqBYt5VoQQrQ7BNwdwmaS?=
 =?us-ascii?Q?1ZsPNPunVo6Kztsb4chFKKfSeeMWUSzCcRFwCw5AYiGDcOOms5fyrncS/M7J?=
 =?us-ascii?Q?50cjB7ja8c9SyKLjOYQagCUAq1c768UGcc/B6+sQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73c0201-14a4-4d3c-a1e0-08db6e143f7e
X-MS-Exchange-CrossTenant-AuthSource: PS1PR0601MB3737.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 02:49:04.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niWkx9UrcUSBVQ4+IMudovidaRQK3Sxi/utNtmqpw5f/OB5D+lYQTPbo+EJjpfhlKcSyC3dZGHrsZmW/4evOHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6040
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 16 Jun 2023 08:14:58 +0000
Subject: [Cluster-devel] [PATCH v1] fs:dlm:Fix potential null pointer
 dereference on pointer
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
Cc: Wang Ming <machel@vivo.com>, opensource.kernel@vivo.com,
 gregkh@linuxfoundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vivo.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Before dereferencing the pointer, first judge whether
it is NULL, if it is NULL, there is no need to dereference.
Fix the following coccicheck ERROR:

fs/dlm/lowcomms.c:1082:26-28: ERROR: newcon -> sock is NULL
but dereferenced.

Signed-off-by: Wang Ming <machel@vivo.com>
---
 fs/dlm/lowcomms.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3d3802c47..0a2d1b5ab 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1079,7 +1079,18 @@ static int accept_from_sock(void)
        sock_set_mark(newsock->sk, mark);

        down_write(&newcon->sock_lock);
-       if (newcon->sock) {
+       if (newcon->sock =3D=3D NULL) {
+               /*  accept copies the sk after we've saved the callbacks, s=
o we
+                *  don't want to save them a second time or comm errors wi=
ll
+                *  result in calling sk_error_report recursively.
+                */
+               add_sock(newsock, newcon);
+
+               /* check if we receved something while adding */
+               lock_sock(newcon->sock->sk);
+               lowcomms_queue_rwork(newcon);
+               release_sock(newcon->sock->sk);
+       } else {
                struct connection *othercon =3D newcon->othercon;

                if (!othercon) {
@@ -1110,17 +1121,7 @@ static int accept_from_sock(void)
                release_sock(othercon->sock->sk);
                up_write(&othercon->sock_lock);
        }
-       else {
-               /* accept copies the sk after we've saved the callbacks, so=
 we
-                  don't want to save them a second time or comm errors wil=
l
-                  result in calling sk_error_report recursively. */
-               add_sock(newsock, newcon);

-               /* check if we receved something while adding */
-               lock_sock(newcon->sock->sk);
-               lowcomms_queue_rwork(newcon);
-               release_sock(newcon->sock->sk);
-       }
        up_write(&newcon->sock_lock);
        srcu_read_unlock(&connections_srcu, idx);

--
2.25.1


________________________________
=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=E5=
=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=E6=
=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=
=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=A8=
=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=BA=
=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=
=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=99=
=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=E7=
=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=81=
=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=E5=
=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
The contents of this message and any attachments may contain confidential a=
nd/or privileged information and are intended exclusively for the addressee=
(s). If you are not the intended recipient of this message or their agent, =
please note that any use, dissemination, copying, or storage of this messag=
e or its attachments is not allowed. If you receive this message in error, =
please notify the sender by reply the message or phone and delete this mess=
age, any attachments and any copies immediately.
Thank you

