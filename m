Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4A6B3673
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 07:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678428976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JyG/0FIT5ou2HvJtdJFdH55ADBb0nQO9zf3W5K/ZFNw=;
	b=QkwSG4vWIUYGdDPgcMJhma2+KSPqy4n0nckiV5B6KmB0kwztJNefqvO5uibeDFP12J2EFo
	CDEDe29d5zAdvg6y3a7F/5xBufcrMGuFjYLNj96Uc899K8Ptl6ZBAKCc7oNYWIyYqhqRoS
	CHgmQ11EaukzUSIUp3L6JfrDuSSLs+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-0sYSwjF2N6y1UI3T9yytWw-1; Fri, 10 Mar 2023 01:16:11 -0500
X-MC-Unique: 0sYSwjF2N6y1UI3T9yytWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC70785A5B1;
	Fri, 10 Mar 2023 06:16:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E8A2C15BA0;
	Fri, 10 Mar 2023 06:16:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED3DD1946A49;
	Fri, 10 Mar 2023 06:16:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FE7419466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 06:16:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEB0D492B05; Fri, 10 Mar 2023 06:16:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6439492B04
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 06:16:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA6D4101A55E
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 06:16:06 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2098.outbound.protection.outlook.com [40.107.117.98]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-SfpW2z5RMvOoznXMS-FNRQ-1; Fri, 10 Mar 2023 01:16:03 -0500
X-MC-Unique: SfpW2z5RMvOoznXMS-FNRQ-1
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6129.apcprd06.prod.outlook.com (2603:1096:101:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:15:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:15:58 +0000
From: Yangtao Li <frank.li@vivo.com>
To: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 rpeterso@redhat.com, agruenba@redhat.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org
Date: Fri, 10 Mar 2023 14:15:49 +0800
Message-ID: <20230310061549.11254-1-frank.li@vivo.com>
In-Reply-To: <e8054874-88d8-e539-8fd4-6123821aa3a8@linux.alibaba.com>
References: <e8054874-88d8-e539-8fd4-6123821aa3a8@linux.alibaba.com>
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 021e69c6-fabb-49a9-1d1c-08db212eea13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: HHGjy8qDOIgtgI2uRNhgVpdKnZkv1uEPcVRtwmpND1njfNAPZSkIl/uhjsDufCAzirVOSePxbWJYYusBHegjXqIdGKU3Xzy4Evw6dxV7LYWa+MKDi2ee/ehSm8Iz9FPwMxLrUsj2tuLrekL2GJegTu0ooFWZkGwv4VopTbO5HPb7yn0seG45oSmkTodmgafXmmIIOR4R3xd1fNgtpT/j4bdlNTpixcG9SF83q1wafdYlMIUZ9GO4Cfyk2nCgZgfDZ3QeOa0RlPPLOp2Qu4gwih3bzMS4hQ15e35XgLPsotOMURf7vPTCj3sZItR584fqg+kfOCbccV0TarEi9HMm9Y6B6tRRiZ/pn82XrSQ7HcU8wpttmJR3UKDfAkh+aio+Iiz1HHCjP0Pt7JxOOkn/t7aHUekkDWtmSar4wF08kbPzigNKiYAc09Ijjh7p4ZqA6RDgEC2ITZXv2A1wKHY7UsrPUkIOJhLKbJg1fpWGOYEDU5rn5Jrw7t5LKYgEChxzcCiV4Wi5q2JRTQUgc5TnqERTFyLhLPpMbs+rGVMeSuLKcNjUAzCPNvYMds/BTRzeYRtORW1oqL71xAREg55xhJahSQe9d8fXmVbhc5jQxngAkfC68JOxMjf2EQBJEUcxUikg3vLon3XBL3ESyykHeYa+hfBCRs2/PVj882H1pJlbSeXLtPSUthEJS0VmvQNIRSxGL5zyqXP13XnEwevCB8iUht62V7URrqcYVMe2vE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199018)(86362001)(558084003)(36756003)(921005)(38350700002)(38100700002)(83380400001)(478600001)(8936002)(2906002)(5660300002)(52116002)(7416002)(4326008)(8676002)(66946007)(66476007)(66556008)(316002)(6486002)(2616005)(26005)(186003)(41300700001)(6506007)(6666004)(6512007)(1076003);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQctHQSLyFiIBUOKPS5mfINF9wc9Jh/1kUspOGDjI3HDtZv1Cantx0mSzW/T?=
 =?us-ascii?Q?uG0c85b2AsSeLRz5p3Na+/vmaV1inMaybwvezUNHh0q0Vv5WE9SqgXXYXg9i?=
 =?us-ascii?Q?/dKHNz4dMuTKjZult59beYlcheYYdHpYWMJPr/pya/N6xrwvoOahCb+jqkXK?=
 =?us-ascii?Q?42Yl57dnG10kWAxKM4oBy0PjPfdPpePl9Q+S2RXAUoUmzZxkPWZegefboM5I?=
 =?us-ascii?Q?4N1nfyFSoZWUE6T4aW48Z8v5Om1ZScRJSrgG2MeIRNB9onWpnmHDQLkyMvyu?=
 =?us-ascii?Q?QSV0TNsmbH3tzy4mEDFI1WFL5bfol+bhBILeOezYOFgfCgDMDVN0fRl1bL9o?=
 =?us-ascii?Q?0NY9vZ2MaA/a1jynudHBjq9pG3M3ddKpU5e/7NJRznhIm4giCp9Btl+ej73t?=
 =?us-ascii?Q?yBM3nnnwBa2xDscrdri/kIcgoQPwcfWIw44RTtyf130OpSTq1CmnpO5wqEEk?=
 =?us-ascii?Q?yuxp6aEo876PMRG5VK0JziEWZnvGwIAOaD/ZaD0Ds9SlMD4JsYPxG95mZQj3?=
 =?us-ascii?Q?7Pfoj8aPbt53VRDJMooN9JsBVz48cjWOaDa58qJIfoXDuxbGMcrv2ozmEMj0?=
 =?us-ascii?Q?BhN9xY8FmRHanH7QH1fZcBXlzbVQlWad8rrc/lJoSKbAkWG0u2WGtpd0dCHG?=
 =?us-ascii?Q?fmps0wVbnQF0lyDFx4lfm/SyiBcC8LUCIX/qL+nPepGcpZzJQBQn5adxo5EX?=
 =?us-ascii?Q?wg6qaB3qjRt0B9QZ0wrNPumxGtigNbgEaX84aV8k+Yg6j1QaYd18K+xEObSf?=
 =?us-ascii?Q?hz9JyZnaMO69b4TXdQzJ30vuKoZ9iVRnbDbx/qeUFSaB6hPT9xxnPM2trxlK?=
 =?us-ascii?Q?3Z64N3Zdq1m1HH6D3gTCDlNnA4VCHMpTON8dO9sZIhYFj4tO5hQHLm2l3cbT?=
 =?us-ascii?Q?+LYj7soNyf/Wx5K5mLC7Nv5xQCQ9vs9Wo8JKQKtC1+RE8m7L278CAZJrIjw4?=
 =?us-ascii?Q?sum0aZ7Ei4EzYN21tnIuKs87+S01SrXz9owvUu/45Ch0t9usH9J2jLgOrrI3?=
 =?us-ascii?Q?JqUdBLhaY2HGSsftcLqgMNq3868iIuHHhhRtsjShJfz2FXmtPLg3XCNgcRFt?=
 =?us-ascii?Q?mgOt+1ljuBxhRNrxDElTtwiK0QqM3mAKczHYoFXAnP+4tsJl0pne3XEoLZJS?=
 =?us-ascii?Q?vqzU0FCBnDsCSBsTcS0yKAq3Ui0+wHrCfwuS6xRnbU6iDek7c2p42Qf+mSKh?=
 =?us-ascii?Q?z12c3dzSYgN4BpjQ9cIUFogopVWzOhDyS5XCx3qiIIN3VNt1s53M8kp4ReQE?=
 =?us-ascii?Q?S3UEIiWM2urdD1akbiHEIWLtdNfDrztsJqMFpjz3xg5lHT5odgbzn7DjVDch?=
 =?us-ascii?Q?TAM5jmoTEEGAm+WToYXM0+3a2aP1UPpAQ/mu86NaHXTBkuGXM77Ue59w6jqe?=
 =?us-ascii?Q?Q5jBhgXDFjMGNMhQJJo33EDUacMat56rt+Mj+qmh5GFoq+0QGp+8XtNMn5u6?=
 =?us-ascii?Q?xDxZaIGXAALvWN4Xqn4nVLkHAuVOfph3XnDyW+iaYTNX/Q4u+SVj/kKRIMCY?=
 =?us-ascii?Q?8uW8dU3kA/CxDsHh8TXgCXIZFVP88pQH4hDKOYGknyBKLqgqHCqfTeMjvQnw?=
 =?us-ascii?Q?qyaJdfcIWauu94WCqD7hvAGbC6Y5UxsAst7CNhb0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021e69c6-fabb-49a9-1d1c-08db212eea13
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:15:58.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIvaICdj3u/sccP3mUuwvYY3U2FfzOeFlUbBI2GqhB2KM2VEZXNa+jUGDMN7seaOq4CtkE4iRu2uRxZYUwwIkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6129
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v4 2/5] erofs: convert to use
 i_blockmask()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Hi Gao Xiang,

> Please help drop this one since we'd like to use it until i_blockmask() l=
ands to upstream.

I'm OK. Not sure if I need to resend v5?

Thx,
Yangtao

