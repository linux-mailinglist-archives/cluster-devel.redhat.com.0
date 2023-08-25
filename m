Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025C788B9B
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 16:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692973370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EU4c+QvmUrzx56YT6HV/cCIR2Pjqx+IXpn7k2GV7Q+c=;
	b=hquiX1wfS7CEgmkqh/TEA6nnWJ7lzeg3cm+W6mkrCGdX8Mn2UtHPOprTh4X4+7i6W6eLeO
	0hmnov3nLbEZyXcGSHpmGEqpxBIWLBUBW0GH7mITlCrBRX1591fg4JOHy5qOHDiODbciPM
	yZpy7Vl3OvjwMlVck6ywcT7+0osA6J0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-5fmJnmEwMSWHDFijAuC0HA-1; Fri, 25 Aug 2023 10:22:46 -0400
X-MC-Unique: 5fmJnmEwMSWHDFijAuC0HA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFEC0857A84;
	Fri, 25 Aug 2023 14:22:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5285492C14;
	Fri, 25 Aug 2023 14:22:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A46A619465B3;
	Fri, 25 Aug 2023 14:22:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FE6519465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:22:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E275040C207A; Fri, 25 Aug 2023 14:22:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA23740C2073
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:22:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F7A7800C78
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:22:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-J44dYLWzP1CfA9Y3MB_LJw-1; Fri,
 25 Aug 2023 10:22:40 -0400
X-MC-Unique: J44dYLWzP1CfA9Y3MB_LJw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qZXUl-00HWBm-5H; Fri, 25 Aug 2023 14:09:03 +0000
Date: Fri, 25 Aug 2023 15:09:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOi1/yafn3HQFWnW@casper.infradead.org>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-23-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-23-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 22/29] xfs: comment page allocation for
 nowait case in xfs_buf_find_insert()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:24PM +0800, Hao Xu wrote:
> @@ -633,6 +633,8 @@ xfs_buf_find_insert(
>  	 * allocate the memory from the heap to minimise memory usage. If we
>  	 * can't get heap memory for these small buffers, we fall back to using
>  	 * the page allocator.
> +	 * xfs_buf_alloc_kmem may return -EAGAIN, let's not return it but turn
> +	 * to page allocator as well.

This new sentence seems like it says exactly the same thing as the
previous sentence.  What am I missing?

