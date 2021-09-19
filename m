Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84C09410A77
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Sep 2021 08:47:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-rnKelBjDOhWueQh3T3nfMw-1; Sun, 19 Sep 2021 02:47:04 -0400
X-MC-Unique: rnKelBjDOhWueQh3T3nfMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CD651006AA6;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0531007606;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A3A24EA2A;
	Sun, 19 Sep 2021 06:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18J6hevb030375 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 19 Sep 2021 02:43:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6FAE21677F6; Sun, 19 Sep 2021 06:43:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D6621677F2
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E5261066685
	for <cluster-devel@redhat.com>; Sun, 19 Sep 2021 06:43:35 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-160-woETwB04M52ZUs5QIivNqw-1;
	Sun, 19 Sep 2021 02:43:33 -0400
X-MC-Unique: woETwB04M52ZUs5QIivNqw-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-22-kkmrepIIMDKaSObKh1WCVg-1; Sun, 19 Sep 2021 08:43:31 +0200
X-MC-Unique: kkmrepIIMDKaSObKh1WCVg-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4523.14; Sun, 19 Sep 2021 06:43:30 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4523.018;
	Sun, 19 Sep 2021 06:43:30 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com, aahringo@redhat.com, cluster-devel@redhat.com
Date: Sun, 19 Sep 2021 14:43:12 +0800
Message-ID: <20210919064322.1670-1-heming.zhao@suse.com>
X-ClientProxiedBy: HK2PR0302CA0015.apcprd03.prod.outlook.com
	(2603:1096:202::25) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.135.184) by
	HK2PR0302CA0015.apcprd03.prod.outlook.com (2603:1096:202::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6
	via Frontend Transport; Sun, 19 Sep 2021 06:43:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d79d64e-dcc1-4369-8f65-08d97b38ca94
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB51139C618210A0220EC644EC97DF9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: dbYtRaUcFjXy/PAVLYwvk99oiwy72fXA0utxtm73TMK8oeSJODhjnuVBHvGTKZoy5jaIBPF/6E3GRQpTS8nFLA+Cuk2L2ayEuFQTrGg8Q9Tmr6difxhJsDmDQNbP5AwF64K12LgAZpgmhnWyO+1SafGzgxJa8GnVZclfM89+wYM7T6NDy4HWVlLutd6LArR0ViDozDwQhlqVG6+Ch4uqn8ylYKZt7SgxgrZjpfoWEmhebapnmlVhxI+3EqyYEd55gEkc3frBDbHkYrUwJ4UwM+pjsKtUgzuCpo/uC2aGpzJ5R+nPOon0NxXCCg/DHwYU8HLfW9F0FAZYql5b57afWsNja+A/zUITjsLyDa8mqKaoX8zHMaz3dCHwLl2zzEb9eLBuvpflZ/C6SX5TxmlgKKQJEKTpDHj/q2n8UAeOT9boSn91bx6M49txwld2S3/xroplTNU5rCGD1ZipUGqLdCW7wPD96SEB7Rv69wdg53D9rhl2Kdd4ZH/acIGrHzlTEbG+zwYkjxDR5JC+aeBxZYgH/oHFJl14uGyrVXq9Ith84rDqW0Z0TITWewKDvXcMgbuiKkvpXPtJFbOz0XHscE5WQ423msxGizrqN3yMT4RfEReggivmnxvwEqlZDR9oazuU029wDd9ye3yLcdYZhyyZ3AUOexbwUMPHQLfab8UMGTRdMTyU8Dw5T/E7BwXE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(66476007)(8676002)(8936002)(86362001)(6486002)(2906002)(478600001)(36756003)(5660300002)(66556008)(66946007)(6496006)(956004)(2616005)(450100002)(1076003)(26005)(107886003)(38100700002)(316002)(83380400001)(186003)(44832011)(4326008)(6666004)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZ+VABEydPXPF1KibyVi8i2RiJrbmSfCoB8r5lOS3Cn4iH6V5qHwsi06y31+?=
	=?us-ascii?Q?vb5FIaFaBjkf8tMHsSmcbgaJgXEG96+aGd5Yaxrk0Fgj1bFXCSntL0VtWoeG?=
	=?us-ascii?Q?HPFM9m+WobYpz5So9Uy/ad0GyYlaqRctYzkbZIIVzZQ3mNDNmOv5QeYiyZTv?=
	=?us-ascii?Q?FWG7wyBKYWEV6remRJJvbQQE+X+ERUSbnoFViGzs+JFjBfxQdBwAvKcP30mI?=
	=?us-ascii?Q?2oLgPgZr//R04htyOlsUxGavLwbUlHoDvPAH/C1C555mEfxvavn70EGnZ0HI?=
	=?us-ascii?Q?rlqG2B7anBbzyczY1rfZ3TI33tO7MK2r2KEiOIEt7J3jnA16xMtiicSjQI1v?=
	=?us-ascii?Q?Ky5DK3ZV0tchCZZrEI3ttfYDhIu8HSmlY21skR2I+Uz4FSXRpP9koqVzWYPr?=
	=?us-ascii?Q?384bO93DNpI+CY7tc68QRe7s/s2bbOmzUSONq5G9jgb5gATq35dR9bFrro2J?=
	=?us-ascii?Q?l18qimYbaaJbckn6ZE371DVfPlqSmbKYealsRMrEVyB/5I+cakr8t/CXiu2r?=
	=?us-ascii?Q?+jkl4ASKIessPBiJj9PQIx3kL4m7v05g2BKS+Dt7QVprxDXPcIAEprOZYfFE?=
	=?us-ascii?Q?N9Rc5oMXw8o3jkX/B0Pkv9zv6vynEjYdoePXaETwenk86CBD/DjP9LhitySx?=
	=?us-ascii?Q?obUqV+slhb384SwtcpCH73c58bu+K3efag19+kKZDDExjTFBX2UhDPZU740Y?=
	=?us-ascii?Q?0tiGFysO0cfAUvgTcjWDVHqqtrrImDNzhWcDNPGsLVK716gOqXfYQ9iYwGvp?=
	=?us-ascii?Q?KpqqFySuP6O37J2gR6pqnHA9ldkPcAmjn3p3SXJ0BZD1zmFybH3Zu6UKVBk1?=
	=?us-ascii?Q?68WwIgzFzrrzRfcHRNOsK4+/26mg5LPNIsRfc2ug3M0rRA7XXH2c3oY1lRLG?=
	=?us-ascii?Q?jRaPKdrKhoCbNs7jI5flBX/6Acb654y7n5o5BO2d62E66n+7VB3S+ShvvdcO?=
	=?us-ascii?Q?R5Mv3v8nCL9xx/KJAN/oU3k1CpoTbg5vQ0SmKHKvPNtcIPSfqbdIBvJnJYn3?=
	=?us-ascii?Q?rwSuz47f92yA03JeuzpUuKJpnU8gD1zID3vcgSUBedMoPQ51MeGYU4XSJ5Er?=
	=?us-ascii?Q?ee0smttsn4MNN4FHq13Vy9P2Uz4u4NGGSdCvhGf36Vt9P2AOfaR/wQ3PrUNc?=
	=?us-ascii?Q?BbosCiO9D7yVl3xEgD6KA2U5EBS+V8mvZGfhkFd55VgNA/Z6knqY4kQ84S6/?=
	=?us-ascii?Q?Uv/xji7zZGEljyLPs36slNQb8c5w8lO0oNdxnEYrctuz2K92+vmH73QXlO7o?=
	=?us-ascii?Q?SVI3tYpOPDWboDHcYOI2Sa2X4pR1hk6FSpOhP4D+XZqZ75PG8bseaDgLKnN6?=
	=?us-ascii?Q?xNw5ERtJqrVMLXooC34ggyuQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d79d64e-dcc1-4369-8f65-08d97b38ca94
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2021 06:43:29.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K0fZSNpcH1maTkqqdTq5R0y+PeK8rEtD7m+VpHjzE3sfJaXKoZv4QntXKiP8KOn7dae0Tt3GRVdABgOAhS9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18J6hevb030375
X-loop: cluster-devel@redhat.com
Cc: zzhou@suse.com
Subject: [Cluster-devel] [RFC PATCH dlm 00/10] dlm_controld config settings
	can be
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

This new feature gives dlm ability to change config settings dynamically.
It's very useful for debugging, and also useful for adjusting HA 
behaviours while running. This feature gives more power function to
advanced users. And HA Resource-Agent (RA) could also benefit from this
feature.

The new man page dlm_tool.8 show some example of this feature.

For easy managing command running list, there is a patch to add "-A" on
"dlm run_(check|cancel)". We can get rid of the boring uuid input when
checking lots of running commands result/status.

Heming Zhao (10):
  dlm_tool man: add command "joinleave", add "USAGE" section
  dlm_tool: add run_(check|cancel) all feature
  dlm_tool man: add dynamic setting and examples
  dlm_controld: put MAX_LINE in header file
  dlm_controld: add dynamic setting items in "struct dlm_option"
  dlm_controld: change dlm_options[] to shared memory type
  dlm_controld: make few APIs public
  dlm_controld: support "dlm_tool dump_config" to show dynamic setting
  dlm_controld: add new API set_opt_online()
  dlm_controld: enable "dlm_tool run|run_start" dynamic setting feature

 dlm_controld/action.c      |   5 ++
 dlm_controld/config.c      | 132 +++++++++++++++++++++++++++++++++--
 dlm_controld/dlm_daemon.h  |  15 +++-
 dlm_controld/helper.c      |  41 ++++++++---
 dlm_controld/logging.c     |  18 +++--
 dlm_controld/main.c        |  86 ++++++++++++++---------
 dlm_controld/node_config.c |   2 -
 dlm_tool/dlm_tool.8        | 139 +++++++++++++++++++++++++++++++++++++
 dlm_tool/main.c            |  80 +++++++++++++++------
 9 files changed, 442 insertions(+), 76 deletions(-)

-- 
2.32.0


