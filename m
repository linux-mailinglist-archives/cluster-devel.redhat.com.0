Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 100056B350D
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 04:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678420308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gzwHioIJAVV3WacEcsghS6dsSuzSpUSu2Ymkri6GPsA=;
	b=EDwcqVMNFeyKSVr3h9FX4bgTx8O8lnnvM3yK869pNJt3e+FHeRyzOLSVOBGI6eqYCXVomc
	rHsR8zP0NxGbWQLmBq2TS68ajXq/doG4x17aPn+uiJDgq25uKvvz05ZRR4eQFTDo9I1CuC
	Uhn4ExyEnT9NGgefVAVvyY1OqIUzYxI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-XoMELNVlOMinZ_oeHoBESA-1; Thu, 09 Mar 2023 22:51:44 -0500
X-MC-Unique: XoMELNVlOMinZ_oeHoBESA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAB9185A588;
	Fri, 10 Mar 2023 03:51:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86B00112132D;
	Fri, 10 Mar 2023 03:51:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C8001946A49;
	Fri, 10 Mar 2023 03:51:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8F131946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 03:51:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B84552026D68; Fri, 10 Mar 2023 03:51:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFFFD2026D4B
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:51:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C6A1C04359
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:51:42 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2106.outbound.protection.outlook.com [40.107.255.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-eDOpg8FtMNydUvTYkaPM7A-2; Thu, 09 Mar 2023 22:51:38 -0500
X-MC-Unique: eDOpg8FtMNydUvTYkaPM7A-2
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4212.apcprd06.prod.outlook.com (2603:1096:820:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 03:51:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 03:51:30 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 11:51:21 +0800
Message-ID: <20230310035121.56591-1-frank.li@vivo.com>
In-Reply-To: <20230310031547.GD3390869@ZenIV>
References: <20230310031547.GD3390869@ZenIV>
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: d3135a3c-96d4-47cc-e172-08db211abbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: yg8BVGjUFyhqms0sYq1Gh3qCmNMQSqDIwCypoMkqptYOpLlqfAMc0pD6yfYtzN9W8eCsSh1Y9sTHhlLXkP2vfGzcBGruHHQQMM4wS4APwkJd7qcGKtXgBwR5RsYT3ZQbvt66FEk6PF7+5RiL9VbjMQApbQg1PhPWzM4FC5ZfSX4w6KjUDZcEZ6cSZ4GLf7bKW/zMwZOG4mfD2lbqx/b7J3lT0o0wsiS0dHFXSzklFfALCbigFIDSLAvGjSButoKTAZMJwyijqFm8caAeHiIyzE5/YxehnEzKgLWcNiG8ejDIvRyFQ3E/5jpNRC0p9Q6KYrw471Qj/HR9PJAVtQ+BohQXe4Md7oc5EXPdirWLVpNJF7lSI+nSvJWB2oiq7bzNp8OcHHeVJnmlbsl2tby0um/BBtwnTAGM8XX3sCsD5M/UST0ACr/jgY9ugsU9lDCJxJF496KOLXXZtemMf9wm54T209AI5+Knr9mH4uh4OBkOZIq1wzrFwWkua/8tcLEOFstRugGPzQjDT69DJy9WAtDWm4udbnHYFYx+Y6s9ypZU175BmSaPAHtJT81A28xyKCDj+LE+RbkLvL6X94og6ggL6HXWodxfT41KQvKovOpw4OYiGbh33t+xAaRtVuYm97Q52/tsK+sm8gumkpmCqBJCZfHuQFE5Jl2YIwHhLttaBJRc7/C0w+lTb+BIsifNUinyx/svzFZBNkWNURDpGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199018)(7416002)(36756003)(5660300002)(83380400001)(966005)(186003)(6666004)(26005)(52116002)(6486002)(1076003)(6512007)(2616005)(6506007)(921005)(86362001)(478600001)(316002)(4326008)(8676002)(66946007)(8936002)(66556008)(41300700001)(66476007)(38350700002)(38100700002)(2906002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WADcUw11cEVwQB7tlEvN01FwCe8pz+KkR1nG5rG39gepYUDdPMgH6337Nqi?=
 =?us-ascii?Q?ShySlqfWOPjzOnU+OzxKBugEl/tGwUNqIaTPqujBXPA4f4I2qPh99WddX26D?=
 =?us-ascii?Q?iUD2f2/N9irt6RUmDBw7HEy/3YOmYy8qFCPGu1FVGzazMdFmMmDRxPYibk+s?=
 =?us-ascii?Q?D6Qo9fll10rHI8bvQ8nh80SYpE99I1doW7LuaEW8WVIyPViCAF3zu5vFeq7m?=
 =?us-ascii?Q?ypecLQKX4BHx3tSTfeTRnV6c3MC0u8Dyii2+FubC7UWcAub36E+dqhz1p+Eo?=
 =?us-ascii?Q?n1Ag3FO4AbH30c/Bqbg+xLlr7hJOw2CuWKK0++T+7Vy5hxrlR1zeB2t6X4LI?=
 =?us-ascii?Q?DLjoPW5n9X12o4OzYjNjmBiXU/kJMNOkNo5NWPgoRdaFC/UWFgUvacpX412E?=
 =?us-ascii?Q?ERHjpS+L2veaTGxnioK4/TtDQ4AAXWZPIYIrvgDRBdqUNwVpt39yp2EaQSvC?=
 =?us-ascii?Q?Xel6P1SFocKvmDDlF1ZWt1bogXm1bEHx2diytGg49kW/SLTNzSAGjct9pHS7?=
 =?us-ascii?Q?wZn3L3vJesvYgrjYueYtBgI7jsO2JFLQgIffKAEP/tfJUElUj3t4i5jUATvc?=
 =?us-ascii?Q?vKVb5bEWVx8jWXzCn+zIPpZRqxvcRll7iBsEaL+aFtzvP/IcjFLcIyiz6tjU?=
 =?us-ascii?Q?wgekBmc6urFZCUi6+b+u86zxaFLSKBovUJQDdbGi0WaDMr/k9kiKyRQ5bG2Z?=
 =?us-ascii?Q?exs6NtrTtqfY6nTN+/3Vevhxt8HvpG1HtIA7Y3Gpz+xRUvOvgeQIqjbaaR1S?=
 =?us-ascii?Q?77pTiIHBA3lzxWtOoOJRkLwcosPNEdacgFmOKLNRdBOU3sQcD2qx68V3kFCA?=
 =?us-ascii?Q?5ceePphUmbDLdMaTDxIBe0yvqOezHJSl65euNCn8saIhUttSom/88r6AXsdj?=
 =?us-ascii?Q?g5GKVRMApUxETrEKg9IZVFUaH8t8Rb/NrrkhAwWuNO6/Pcufa3NPWd2x/Ae5?=
 =?us-ascii?Q?VGQyBGpqBLG6/e0zMICXNDz/NptPOdG9BPwsvHVKbwj71/DjVVTN1WLn0wxp?=
 =?us-ascii?Q?hGTywryF+Sz1jtZZuaVj655dT+S4hHMl8nbOBP5pg8/nJrYWxt0GBtLx3nb0?=
 =?us-ascii?Q?mqMNrpmsjUTBW/cs0L07gL2L+5Lp+Ga5pXm8WxpTXND4X1rwBiQ6pPu2cfaV?=
 =?us-ascii?Q?+GtlHYxEa8CLcbugtXtZkoyjWa1AVHjg05QRgARgy98CFRBkKrCagK+wo+s9?=
 =?us-ascii?Q?5sAcOnVtE0VHXwcvrSskr5XWQ6gjlUFMsUc9zPczqSghcPl3Zqa4Lqhy73v1?=
 =?us-ascii?Q?lfO4K3WbBb0iMWy+EKvHCXNCTvDfuXfXiUp0FxslVW3WemmxVuTEDPGjgTfu?=
 =?us-ascii?Q?GIpRlHGtlWyd+91xcaOuhWtf3OMWFcwkDdrKJPHatrx3HOuyclWVBoOYWH6A?=
 =?us-ascii?Q?uxAt1gkXL0Tt4GeF+G+bRyDxzLSHSu3LgGe0AhBGrB02AU8t9jkL8h036/Wr?=
 =?us-ascii?Q?xmx/m+SYQJpuW76DobC8Rye7QBSfyzI9eqdz7yMBCdmFN+dgbKK7+TQ+IIBl?=
 =?us-ascii?Q?q457BkG7CVIq9D0zD9TwqrBwdhE/4vFmeUXvS2TNim08oj+nHPYQw1y+ke/x?=
 =?us-ascii?Q?uKbQ0MwO72EfRJJoNYS1ohc5liFX/zsrQgUe4p0H?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3135a3c-96d4-47cc-e172-08db211abbaa
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 03:51:30.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD7LNWD1QfbA57WzobeXYoht1JD7BJL8fvC29uV4mt8louNa/xM9HOgM0FEH+284m6ANSYRGC/4NV3zf7eZ/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4212
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Hi AI,

> Umm...  What's the branchpoint for that series?
> Not the mainline - there we have i_blocksize() open-coded...

Sorry, I'm based on the latest branch of the erofs repository.

https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/log/?h=3Dde=
v-test

I think I can resend based on mainline.

> Umm...  That actually asks for DIV_ROUND_UP(i_size_read_inode(), i_blocks=
ize(inode))
> - compiler should bloody well be able to figure out that division by (1 <=
< n)
> is shift down by n and it's easier to follow that way...

So it seems better to change to DIV_ROUND_UP(i_size_read_inode(), i_blocksi=
ze(inode))?

> And the fact that the value will be the same (i.e. that ->i_blkbits is ne=
ver changed by ocfs2)
> is worth mentioning in commit message...

How about the following msg?

Use i_blockmask() to simplify code. BTW convert ocfs2_is_io_unaligned
to return bool type and the fact that the value will be the same
(i.e. that ->i_blkbits is never changed by ocfs2).



A small question, whether this series of changes will be merged
into each fs branch or all merged into vfs?

Thx,
Yangtao

