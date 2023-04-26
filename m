Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA86EF521
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Apr 2023 15:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682514573;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hC8Egsn//5pKfzQNXUjSLdNqRLwtnUlIQyrXHxctICQ=;
	b=jSThLCA0JafLPVy3e7JVUfYCGZRWCaaILQSBTcdaQX+gyg41D8M79ah2R50s3XBMK1SSR+
	39+yntwZdjTAH0l+m9PK16nYrq5Mkjwjpe6FslUILGAPZq/mZ+x/hachtLWgLMzH5WDZJc
	bjMtj8QICzOIRMkBWazETt2a1EU9Vmg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-KXzoj2s-OFGlq_MVr9bFmw-1; Wed, 26 Apr 2023 09:09:28 -0400
X-MC-Unique: KXzoj2s-OFGlq_MVr9bFmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7520A0F391;
	Wed, 26 Apr 2023 13:09:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E51C40C6E68;
	Wed, 26 Apr 2023 13:09:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 209D21946A43;
	Wed, 26 Apr 2023 13:09:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 36B3319465BD for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Apr 2023 13:09:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1939A492B0F; Wed, 26 Apr 2023 13:09:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11264492B03
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 13:09:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E883CA0F38B
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 13:09:24 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-XiF6BUP4PMmvin9ITkLGxw-1; Wed, 26 Apr 2023 09:09:23 -0400
X-MC-Unique: XiF6BUP4PMmvin9ITkLGxw-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230426130921euoutp02fc595e6394a6f9394e186dc6ec819c3e~ZfhRtP5k61270512705euoutp025
 for <cluster-devel@redhat.com>; Wed, 26 Apr 2023 13:09:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230426130921euoutp02fc595e6394a6f9394e186dc6ec819c3e~ZfhRtP5k61270512705euoutp025
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230426130921eucas1p208bd40a0cac655a2b20580b52f54fdeb~ZfhRbsNVx1807918079eucas1p2-;
 Wed, 26 Apr 2023 13:09:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5F.D7.35386.18229446; Wed, 26
 Apr 2023 14:09:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230426130921eucas1p279078812be7e8d50c1305e47cea53661~ZfhREv2kN1808518085eucas1p2j;
 Wed, 26 Apr 2023 13:09:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230426130921eusmtrp166b0a11733c8dfdc952a32ae2728776d~ZfhRDcP_d0593705937eusmtrp1m;
 Wed, 26 Apr 2023 13:09:21 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-1f-6449228132ec
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FC.EA.14344.18229446; Wed, 26
 Apr 2023 14:09:21 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230426130921eusmtip1aa55278beda33ec5aa586b1123e22dda~ZfhQ40EO-0298802988eusmtip1x;
 Wed, 26 Apr 2023 13:09:21 +0000 (GMT)
Received: from localhost (106.110.32.140) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Apr 2023 14:09:20 +0100
Date: Wed, 26 Apr 2023 15:00:33 +0200
From: Pankaj Raghav <p.raghav@samsung.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230426130033.ps363bz472jwlgl6@localhost>
MIME-Version: 1.0
In-Reply-To: <20230424054926.26927-17-hch@lst.de>
X-Originating-IP: [106.110.32.140]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7djPc7qNSp4pBp++qVnMWb+GzWL13X42
 iw83JzFZnFz9mM3iXdNvFovLT/gsVq4+ymSx95a2xcx5d9gsLi1yt9iz9yRQatccNot7a/6z
 Wlw4cJrVYtefHewWz3ZvZLb4/WMOm4Ogx+YVWh6Xz5Z6bFrVyeax6dMkdo8TM36zeOxe8JnJ
 Y/fNBjaP9/uusnmsmHaRyePzJrkArigum5TUnMyy1CJ9uwSujJenLrMUzOOo+DntMlsD4wW2
 LkZODgkBE4nl01aydzFycQgJrGCUOHdvIzNIQkjgC6PEi2tcEInPjBKzLk5hhuk4vXUrK0Ri
 OaPE/y2TWOGqjly+wgbhbGGUmHR2NQtIC4uAqsTft5eBEhwcbAJaEo2d7CBhEQEliaevzjKC
 1DML7GaRaDh9ECwhLBAi0bN9Flg9r4C5REt3FUiYV0BQ4uTMJ2AjOQUMJWatewN1kZJEw+Yz
 LBB2rcTe5gNg/0gInOOUmPdjP9SjLhKt75tZIWxhiVfHt7BD2DISpyf3QDVXSzy98ZsZormF
 UaJ/53qwIyQErCX6zuSA1DALZEj8vDsTao6jxKJjTcwQJXwSN94KQpTwSUzaNh0qzCvR0SYE
 Ua0msfreGxaIsIzEuU98ExiVZiF5bBaS+RC2jsSC3Z/YZgF1MAtISyz/xwFhakqs36W/gJF1
 FaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmCKPP3v+JcdjMtffdQ7xMjEwXiIUYKDWUmE
 l7fSPUWINyWxsiq1KD++qDQntfgQozQHi5I4r7btyWQhgfTEktTs1NSC1CKYLBMHp1QD05zy
 FeGfFk7Z2PNfZ3GLZ/yqt91S15PYD263eK2fVKDim7UpI07dfb+U5b1fSm+830svCT62z/fy
 aifJhfP2LHaU2ss6pU0y7Zo/x49yxx1ayzT6DTcVa36cFxXU8Cll06OOy45p1+yPTE3Nfzfz
 569vexI3bYl807uk2Tvx1STNPVO2Ptmoe/alyUuVmGCdRVHpiqtFCo06FthUmleJ28jN0dWO
 V7HLCjg63exGndcJy9jsiT6TYq6cuxe/Osep43Lz46lF+ptSf1tZ+nysKL7FmWj4YiVb67Zl
 DnoOnHdYCv/f5ZV6IH30wVNlh9kRJXelvs1onfb2xKu6d7zPeM1Vv/VNzzJJXKvwk/1srhJL
 cUaioRZzUXEiAHGPVigABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7qNSp4pBmee8VnMWb+GzWL13X42
 iw83JzFZnFz9mM3iXdNvFovLT/gsVq4+ymSx95a2xcx5d9gsLi1yt9iz9yRQatccNot7a/6z
 Wlw4cJrVYtefHewWz3ZvZLb4/WMOm4Ogx+YVWh6Xz5Z6bFrVyeax6dMkdo8TM36zeOxe8JnJ
 Y/fNBjaP9/uusnmsmHaRyePzJrkArig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NY
 KyNTJX07m5TUnMyy1CJ9uwS9jLn9DSwF91grLp08w9bAuJKli5GTQ0LAROL01q2sXYxcHEIC
 SxklNv/7xwaRkJHY+OUqK4QtLPHnWhcbRNFHRokndxYwQjhbGCWezrwO1sEioCrx9+1lIJuD
 g01AS6Kxkx0kLCKgJPH01VmwemaB3SwSK2c0MYMkhAVCJHq2zwKr5xUwl2jprgIJCwmESdzp
 3ga2mFdAUOLkzCdglzIL6Egs2P0JrJxZQFpi+T8OkDCngKHErHVvmCHuVJJo2HwG6rFaic5X
 p9kmMArPQjJpFpJJsxAmLWBkXsUoklpanJueW2ykV5yYW1yal66XnJ+7iREY/duO/dyyg3Hl
 q496hxiZOBgPMUpwMCuJ8PJWuqcI8aYkVlalFuXHF5XmpBYfYjQFBsREZinR5Hxg+skriTc0
 MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamDaXttiKlzVfHqHju2S6Rrv
 bx2IusPDuPFD0hOBklvLd31/wNQdKtfzlN26OtVsb+DbOaqnu3r+vl6XuKoq+2S1/wIN/Yzu
 rfPOW3Z4yYXqmLvf2RoQMH3xyYaOpbnTUvsfBkalJejJ2UfeTP9dpunZFx454VGZVe75/cFM
 UgozeypmSbXeWfX/TafXztOplyOXPN9bfyXBJMN1nUvu89T2Z/a6fem9t/LOT5A9PIU/au/8
 001GUY8ze+sCfotHyrLceXKrzpZ3g88UsdtPz/z7bfx69hyJQxe/CPLPWhzS7D11xeFsW+V3
 ttv/54ukFvVLFcSwKvwM8jdZs1XkNrfBylTbhH5PRZ/TUpf4jyqxFGckGmoxFxUnAgAAg+8w
 hwMAAA==
X-CMS-MailID: 20230426130921eucas1p279078812be7e8d50c1305e47cea53661
X-Msg-Generator: CA
X-RootMTR: 20230426130921eucas1p279078812be7e8d50c1305e47cea53661
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230426130921eucas1p279078812be7e8d50c1305e47cea53661
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <CGME20230426130921eucas1p279078812be7e8d50c1305e47cea53661@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH 16/17] block: use iomap for
 writes to block devices
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
Cc: Jens Axboe <axboe@kernel.dk>, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, "Darrick J.
 Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, p.raghav@samsung.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: multipart/mixed;
 boundary="----0IIwcNA8CeD.s59tlljyDEq3yyVAinti4bQgYoqzE0B37Kwt=_fbc0e_"

------0IIwcNA8CeD.s59tlljyDEq3yyVAinti4bQgYoqzE0B37Kwt=_fbc0e_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 24, 2023 at 07:49:25AM +0200, Christoph Hellwig wrote:
> Use iomap in buffer_head compat mode to write to block devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/Kconfig |  1 +
>  block/fops.c  | 33 +++++++++++++++++++++++++++++----
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 941b2dca70db73..672b08f0096ab4 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -5,6 +5,7 @@
>  menuconfig BLOCK
>         bool "Enable the block layer" if EXPERT
>         default y
> +       select IOMAP

This needs to be FS_IOMAP.

>         select SBITMAP
>         help
>  	 Provide block layer support for the kernel.

------0IIwcNA8CeD.s59tlljyDEq3yyVAinti4bQgYoqzE0B37Kwt=_fbc0e_
Content-Type: text/plain; charset="utf-8"


------0IIwcNA8CeD.s59tlljyDEq3yyVAinti4bQgYoqzE0B37Kwt=_fbc0e_--

