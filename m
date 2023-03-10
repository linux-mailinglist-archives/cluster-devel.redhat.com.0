Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D36B36D4
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 07:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678431065;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pex9aEt2J/rXn68Q7Mhe+oUcnvnN1Kkk+C785IQtocg=;
	b=J7Df/NkbQB5we4uEJvdBHU1NfCG+fVKVWZmRaUu7uf7YmQvSk5g6W8boq1bYeSb62sDH5s
	rgzLKv+RhPNT8pWCHcpipsgsMEP3rV8lrxu37iw3lOOym/65Vu9Ci3lD4c2ALMZuepCCOe
	ee4Co6GzUX6xR9AjabapULwxA2O6iqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-JurkifKOMcGHMVdb2Q8Rcw-1; Fri, 10 Mar 2023 01:51:02 -0500
X-MC-Unique: JurkifKOMcGHMVdb2Q8Rcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A69F101A55E;
	Fri, 10 Mar 2023 06:51:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E10734097544;
	Fri, 10 Mar 2023 06:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B58181946A49;
	Fri, 10 Mar 2023 06:51:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 125761946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 06:50:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E81B8440DD; Fri, 10 Mar 2023 06:50:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8A418EC2
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 06:50:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBEC61C05AC4
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 06:50:58 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2131.outbound.protection.outlook.com [40.107.215.131]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-FRr34iquM2WwCyjcM0z5Yg-1; Fri, 10 Mar 2023 01:50:51 -0500
X-MC-Unique: FRr34iquM2WwCyjcM0z5Yg-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5327.apcprd06.prod.outlook.com (2603:1096:101:6a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:50:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:50:45 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 14:50:34 +0800
Message-ID: <20230310065034.62340-1-frank.li@vivo.com>
In-Reply-To: <20230310040508.GN3390869@ZenIV>
References: <20230310040508.GN3390869@ZenIV>
X-ClientProxiedBy: SG2PR04CA0193.apcprd04.prod.outlook.com
 (2603:1096:4:14::31) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 203119cc-15b1-4f75-5403-08db2133c5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: JgJbj/huh9APjUupHDrNv+G6xx3b3bGJmK88sf3xYGB5e8nOK7WSfjJ+GTEr/gsoEFlpwXo0EK0+AdiV94/m9bIw2JGWfWKwI4zjTIy7v2LEEnSKVtrrwib7vNQHzdKSAEt4JDlip9upoF9kxt+/nYzJ9g75oPRDu4olaU7NtSU/HnYDCZ0KnibOaIqkhKcKCV2RjHl85Q72AQrZeEG1sTHEMukEtzu6g/RcObh/UFxYJfC8HaAZj/iJ5WgCUBogudchs0yBuKUqDGu9P9H3uHRMW20IXqvj3ouRxtQMOMo4QAqL63Y0YrPkvRv42WCj4AoGMI1JsI5xIUR6MY928+NW2Nw2RKNLGKqXAvr6uTx0EDKhaxN1Wt2ovpUVJ3usFdcMVG2Wno2zUQz42qZ/DSTOSRwCTaBlO1Ww67K9L6YqIU1plmF10bhVUGVHDGctWTi7C9M0dvPXehJu5ZoSbyyU27UznKEa/f9CfIu06Eu/gDDpysXnR5f+L1LT0xmgB06PF7lwOczBwWEdcCGVuHqW8VICryHP6QudTDinIXYN/HKtdClh+N0flxvvNxyOybzZvjpNkzWntja0DFOrOHxFG5f0NtwfEG9BEpiAw85UL4LbFjBl3CZ9qOgHAkq3Ga1pZ5s3qs13K+wDrw6LVLMaNRvKxCS5gQKX3h49HDjoMSk4eF0ye3WTPWe2+iEao20pshGj+mKbbmKYlL3CDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(2906002)(5660300002)(7416002)(26005)(8936002)(36756003)(66476007)(8676002)(41300700001)(66556008)(4326008)(558084003)(66946007)(316002)(86362001)(52116002)(478600001)(921005)(966005)(6486002)(38100700002)(6666004)(1076003)(38350700002)(6506007)(6512007)(186003)(2616005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I6Vq5WUZhkZFCYCL6wFKVPQhhOoRsvYiiu9qvv0ekAqFgXpvKw59OjYKykI/?=
 =?us-ascii?Q?dIZ9VT5TJCkR3uHr1lfoFZgxcPgR2YwUcR38Xjmcb2Niqgn09j4bznyNcqRF?=
 =?us-ascii?Q?aJnobe/5Kdz2YNjIy5xKN/TSKyhUBQFQeanWatH0TKeb+RgTK5czo/PDPB6J?=
 =?us-ascii?Q?e02rednEDTX01XjU8Di1U9vA+PElbY6yngSM7SL8LhaIich+1K3x9a6Gy0Sh?=
 =?us-ascii?Q?wDXcQLkNLpy8ROzfXkl9ndni8UNHY11P9A5KtvaB+mXniiyw3m9Mc8sIiT2I?=
 =?us-ascii?Q?o/Lxpq+U7OugrQGspV8snqUx3wpKHW9ibaOllwCaXHctqTLF31Y+a+oQIVkO?=
 =?us-ascii?Q?iZZ5yX9M2F4nbFducQcMGxoj5cv7vMT306NHH5Y2xmR170A8jgsIJO6nTF/C?=
 =?us-ascii?Q?8MdUCkLqDoNAP7LQaHI4agkNUwV3rXgkjhx147otDxxMgewonFuk6YSXRlab?=
 =?us-ascii?Q?ylC1yFV1juolTFk9tjqeTTJ4LyQ0PnLKEyvr5CPpaIzESYViZT0TGmgkuS/m?=
 =?us-ascii?Q?CNnUJ3Zmpu9EXFD671x+E77qY4XUH9E0+Dvf2RhTtChdBzPzQjCR9el3QOBf?=
 =?us-ascii?Q?RaWAthdU5PXwcQmpjKnXPMPmz12/3P6l0XoNhoMzhrz+kQ/8Tg7SbMrpDTW0?=
 =?us-ascii?Q?h8Wejyx+dvkJ199P85Ngk+RWm9eaQEL0s1XrnQEJQZXReK+FB2sgAhOrGxy3?=
 =?us-ascii?Q?Lm36yLZqvZC+J25+7evH2qpMBxKj4OAswOT+KdpCVehce7/Ha8c//09rEBy4?=
 =?us-ascii?Q?nB5dYQVAOs16vj0QfZutcBw3Kjt1nsrAylCoRELEMA/50gUDgcWonlQAN6DE?=
 =?us-ascii?Q?mvKsOAs6dWVq2B+JI+nVqF+t3lFMuRfJubT7EMNZr4lbEwbJ6M+2xzGUC1c9?=
 =?us-ascii?Q?XooEDUX0w1ZUmBQZwGAyty9lwYrwvAd7Rpz+Goyal+fmyyx6BIbEHo6uxqyr?=
 =?us-ascii?Q?QgtqiAs4qlewCr0Uksjvv512cd4Zdrr8hBPXvFe7U4cPOn5FIZDFg0GZd6Uf?=
 =?us-ascii?Q?jq1KYqLbnvJyVC5vIio6bBrXxJo/WB1B6De8kw+9B2GydAviWw95vggiOcNl?=
 =?us-ascii?Q?3SeJVzIQGvz5ysGB6CX8rNALrHPONr3PLn++AgE5mPwdi2sFu4Ucqt/0q+vP?=
 =?us-ascii?Q?R+WAo1Y5fPTWOAh5/C5zo5Ex+6br6toXA4+zQHP8N7Bx3AqOALvZroXs5x/9?=
 =?us-ascii?Q?/GqCS5emv1aH9exuSXBnRG3ePep4bDSOLvLf/qKzBTmVBvrDikFz0zvQlzFL?=
 =?us-ascii?Q?j5z37DiH6BOcJfGSfrBQFaIuiZUxgTGduMfujpcd2jN9b0GxAVlY4IoILvx8?=
 =?us-ascii?Q?ppP3PwoqahMJBnvjHkvWSwaGl340b88fwBn/5j+fDwGj8BKvSf1l86wbTpJR?=
 =?us-ascii?Q?J/1xRW0v8jV4oRTSdYxBp3uBtYIqNFnGVVQK9OT88eeqmMyWFoVo0rnGlRBH?=
 =?us-ascii?Q?OOuKZbmIRFP/smp32LI5eO8GdT6V7OtpbA3GfWs9Q/Y13FqUtNRWXm2Bs8ni?=
 =?us-ascii?Q?hJwRLT7++A18wofqK+ml4OX6ykhdMOVs0nTbkFztDEIMrjOgngR4E93HS/LP?=
 =?us-ascii?Q?uAqMZkToYtDNPgGQuV14kMeKXhdRzI5opia3Y+kz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203119cc-15b1-4f75-5403-08db2133c5d1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:50:45.2529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q0ck/xcFXaRje+KC1xWYIwFMs8gx5V3IcVYhhp2PWIritf1xxrCfwe5WtKAZkqjSAVMxDWvxR5DXfmyxXOYlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5327
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] erofs: convert to use i_blockmask()
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
Cc: linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

> I can pick the stuff in the areas that don't have active development.

Could you please consider helping to pick this
patch("ecryptfs: make splice write available again")?
ecryptfs seems to be unmaintained.

https://lore.kernel.org/lkml/20220831033505.23178-1-frank.li@vivo.com/

Thx,
Yangtao

