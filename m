Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 051384182A7
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 16:24:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-RrA4DaEgOu-jnbICEh9v3Q-1; Sat, 25 Sep 2021 10:24:10 -0400
X-MC-Unique: RrA4DaEgOu-jnbICEh9v3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FE51808304;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776A210016FE;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61D8C1800B9E;
	Sat, 25 Sep 2021 14:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18PELuHE014606 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 25 Sep 2021 10:21:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B3322164DCD; Sat, 25 Sep 2021 14:21:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FDC2164DCC
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:21:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 932F680B913
	for <cluster-devel@redhat.com>; Sat, 25 Sep 2021 14:21:53 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-94-SujV8b_nPw-6wvnfqqJclg-1;
	Sat, 25 Sep 2021 10:21:51 -0400
X-MC-Unique: SujV8b_nPw-6wvnfqqJclg-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-17-BoQ3jcaZMyiqX7mw7vXIRQ-1; Sat, 25 Sep 2021 16:21:49 +0200
X-MC-Unique: BoQ3jcaZMyiqX7mw7vXIRQ-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4544.18; Sat, 25 Sep 2021 14:21:48 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d]) by DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::41ea:157:e802:5d8d%6]) with mapi id 15.20.4544.020;
	Sat, 25 Sep 2021 14:21:48 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: teigland@redhat.com
Date: Sat, 25 Sep 2021 22:21:37 +0800
Message-ID: <20210925142142.1821-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
	(2603:1096:203:c8::13) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
Received: from localhost (123.123.135.254) by
	HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7
	via Frontend Transport; Sat, 25 Sep 2021 14:21:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a5bdcba-66ab-47d9-ef8c-08d9802fcfa4
X-MS-TrafficTypeDiagnostic: DB8PR04MB7066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7066113902EE061BAE343DE897A59@DB8PR04MB7066.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 5o7jcqYnOrx3MiW/WkEIN4N3dsWy31B/gwWU7uiASIn04JrN34qomt6DrYB+2jGIYHTqRi3V7u7raYshKh9XImmHlfl7ZdBVe4ClqpNvcUHiryX3F/yx2iHr1zBYx7PYMn9FoiNdxIT45cUEnlXIEnYkXchY5a5LRok/kAVs1vR29CUxHPnIMnn2aGfLdcX9KDbMhlKWpyA+kVOtnYAjBwXKCmVBQGPLhIsivfhQu9MykF6gbFWoV++tpW1lUjmewZ/DkzjiRHfWaQ+jzQnaHUgZ+cTt1bdeRJyG0E6meaFmk2I12a/MArUFHJjQVuTy7FrQ6ApR+gocFDgGbGnfCxnkT2cWiVFSQgA2cVR3ojfwSb3i3DJpN3nAdFx8czh+3kmQmRQ25AIqhQfX15XJOEv24HcOay79KGIzYPZJ1gQD/tvzUHm1E7igwCyRHaTLXlc2dLdDjc7j57AIL+WkNzOKbhQlASr/O0m3NOVlfKisEWXtrMq9/UlYG/4po3AZ+QB0mYbczjun5zG0j2HNPycHhoq56Az6264SEI84Ta5yCc0ckt2JD4Bzp2IvduscDr7ZhlICETgSeGAd5zcQlH/tugSzTFcZOeZbShp2hhLdZogbI1pweKW5bc+p2jlJH6CJche3waBTw9CYIB8CKM7og6HXvxIJpcLtgPNOQQg06RFItnNkAYFdF0D8rkHS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(83380400001)(316002)(5660300002)(38100700002)(186003)(26005)(44832011)(6496006)(6486002)(2616005)(450100002)(6916009)(956004)(8936002)(4326008)(36756003)(86362001)(8676002)(66946007)(66476007)(66556008)(508600001)(6666004)(2906002)(107886003)(1076003)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMxdDMICn9r1jz460v5gE06JahTp3jO0FUOYJBcI/71UajmfWV9VJYguW58b?=
	=?us-ascii?Q?arhA4tUVGNgEQ9MVGwReBNVll5ZhrSBhPNRWJehobLBmy9cH5FT0E/Pi2aHV?=
	=?us-ascii?Q?hvRRr8sdQupFLBHjJmf8iU+SWPAaSenFRDUqgQgk5NyX1Yn0HGuYywqM5aSG?=
	=?us-ascii?Q?cDGmeOYqxyCUWtMaPIY+soB14r4lEFRZ7YbjKRc2sTo++vY/CihQDztiZG2z?=
	=?us-ascii?Q?UJno7x3NtA1OCQ+hTeS2+0t+twFuyw43CyMy1y3aOohkdw2Wxz8t8VHKCgyW?=
	=?us-ascii?Q?4b/gsSkJBy1rNx8fnG+v+CTGhc0RPTG6VltFcXn5sxq5pCVy2d8shS+3CTa3?=
	=?us-ascii?Q?68NZSs141eWJRy7bwZr7WrIpuWU8gDagBFjVhEvtgfkHxuxaAVDHUJGGRGtQ?=
	=?us-ascii?Q?Wad0l+tGQT8CVcw9Y0Wh05zKo+4T5w8Qz2i3wMHaOxsGBCfgZmLkZ6HtAULY?=
	=?us-ascii?Q?nGPoOg9G+VYI0rcKyTtuwgSiYT8CoIWhoOfLCTxH4jlWTuO0p+CcdQl0CnfZ?=
	=?us-ascii?Q?mVCJz1tgVmFAN/YjVM0al+NKtCCSsbrZNdsyWF+f0PAkFtZ9v44kY7yiU7sh?=
	=?us-ascii?Q?F1UJ9z+A6ZAy2Ra6luaAJUmnH45iEmqNgr7tXCDM+2AyYaC3hLElNg9V7p41?=
	=?us-ascii?Q?MPb5Sg43RYfCdh1KOutZmp6e2SkaXZATuyUobo/yqOZdhZ6lsSVWVNrT3uwc?=
	=?us-ascii?Q?OdIb7a/KYPuAfuUVPyepXyrJivSchhjEXXkvtcE/P6VfbuceoXRDDfKB8rar?=
	=?us-ascii?Q?ZyLRsVSxk44Sv03ke7zTL+rqgWwCHRbHyaBvdmBGSmd+c+zN2PcInki3cOtJ?=
	=?us-ascii?Q?VxkzSdvdsVtLYfQB+HltcK8Gj+54R3dTpfNCyZ4UaNucMNtmkCqOFQjDORFG?=
	=?us-ascii?Q?wWRI1pMaPtyzyH7TFgLRykI3N+KMX9We49XeM77fk74MDVOXVN5Y7nQwkssJ?=
	=?us-ascii?Q?Y+oxb1xqzHNqQrojmtTuyTgHr4JK8DqQ9xdQvMLZ2ejTvXNG6zPWjEuD9YjS?=
	=?us-ascii?Q?RTgO04eBErAijGqxnlu05QqfsYJRZdZiNCHd1BexEC6rN+QG4wupHJ4YeOWw?=
	=?us-ascii?Q?A78K/tlRx82OO3UhR1RkZcK7WbHiUGWCBAYqlY4zh2tA8JfeUyUm4M+vibvn?=
	=?us-ascii?Q?lvhw5wYAW2rB0tbnVHOoKgxLfAXCkbCSpmK13AeoxIU5exCWWC8QzDw8BMyM?=
	=?us-ascii?Q?ZIGwAnRLyadTDW+DMBFmIdZjwNBTG4cbEfv2D65yg1MPFZ29iKdqNYfFOBiM?=
	=?us-ascii?Q?Z93ZZdTbod0YN2LZF/S6IDfHQhHu7HpwQy/yw1QyLqqHyZVw7ZodcpIbVWM6?=
	=?us-ascii?Q?2k6q/Uve2xGXLyEppAuqGTwv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5bdcba-66ab-47d9-ef8c-08d9802fcfa4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2021 14:21:48.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGjIB5LwnyKN5BI1NIU0BcyCYCmnsEvQRz+rvIATQ5r/orhvcm3OIXv/e/95S5z0QDI9Vuji+xNGJFz5UDt8Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7066
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18PELuHE014606
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, zzhou@suse.com
Subject: [Cluster-devel] [RFC PATCH 0/5] add new command reload_config
	set_config
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

This serial patches gives dlm ability to change config settings
on the fly.
It's very useful for debugging, and also useful for adjusting HA
behaviours while running. This feature gives more power function to
advanced users. And HA Resource-Agent (RA) could also benefit from this
feature.

There are two ways to do the dynamic changing job:
- by modification dlm.conf
- by dlm_tool command

The man page of dlm_tool.8 and dlm.conf.5 show examples of this feature.

Original code has bug for those no_arg type options. Whatever use 0 or 1
to set no_arg type option, the option value always 1. To fix this bug,
the 03/05 patch changes some options type from no_arg to req_arg_bool:
 daemon_debug, foreground, log_debug, debug_logfile, plock_debug.
Only keeps help & version with no_arg type.

For daemon_debug option, the 03/05 patch changes dlm_controld behavior.
Before this patch, when the value is 1, dlm_controld won't become a
daemon.
With 03/05 patch, daemon_debug only means dlm_controld enter debug mode.
the foreground option totally controls whether the program becomes a
daemon.


Heming Zhao (5):
  dlm_tool man: add command "joinleave", add "USAGE" section
  man: add reload_config in dlm_tool & dlm.conf
  dlm_controld: add reload_config feature
  dlm_tool man: add new command set_config
  dlm_controld: add new feature set_config

 dlm_controld/action.c        |   5 +
 dlm_controld/config.c        | 288 +++++++++++++++++++++++++++++++++--
 dlm_controld/dlm.conf.5      |  42 +++--
 dlm_controld/dlm_controld.h  |   2 +
 dlm_controld/dlm_daemon.h    |  15 ++
 dlm_controld/helper.c        |   4 -
 dlm_controld/lib.c           |  55 +++++++
 dlm_controld/libdlmcontrol.h |   2 +
 dlm_controld/logging.c       |  18 ++-
 dlm_controld/main.c          | 146 +++++++++++-------
 dlm_tool/dlm_tool.8          | 179 ++++++++++++++++++++++
 dlm_tool/main.c              |  48 +++++-
 12 files changed, 715 insertions(+), 89 deletions(-)

-- 
2.32.0


