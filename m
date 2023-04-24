Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16D6ED616
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 22:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682367889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DknphQW7x+0bWNmQfJrKAi+J0Jdik1T8XR/fg0Woug8=;
	b=b/gUhtkXxqzHkZ27sjV0QWIoqCHI5EZEk0lK6JTOpracoYtJuS/VJx5ZqRabcr3iMi5V5K
	J6pkmAwSJK2huKrqAoILCAwX//V8FppBISVwI8LNUKluqfaXKLBu0Q+/kx7SeGIDLZyRif
	1FeNovqaOKSGU10aymxuYo+5/xa8dAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-XzL-5RWuOp6OFNYUdWlI9w-1; Mon, 24 Apr 2023 16:24:46 -0400
X-MC-Unique: XzL-5RWuOp6OFNYUdWlI9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC84280A325;
	Mon, 24 Apr 2023 20:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 819E01427AE4;
	Mon, 24 Apr 2023 20:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 167E719465A0;
	Mon, 24 Apr 2023 20:24:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 42CE5194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 19:42:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5F0C540C6E67; Mon, 24 Apr 2023 19:42:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5826640C6E68
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 19:42:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B35C1C06ED5
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 19:42:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-fH6uPZjGMpKCdz_BNIP07g-1; Mon, 24 Apr 2023 15:42:44 -0400
X-MC-Unique: fH6uPZjGMpKCdz_BNIP07g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E6F961EAB;
 Mon, 24 Apr 2023 19:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566D4C433B3;
 Mon, 24 Apr 2023 19:37:20 +0000 (UTC)
Date: Mon, 24 Apr 2023 13:37:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ZEbabjCZhl6j1Pk+@kbusch-mbp.dhcp.thefacebook.com>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-3-hch@lst.de>
 <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
MIME-Version: 1.0
In-Reply-To: <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 02/17] fs: remove the special
 !CONFIG_BLOCK def_blk_fops
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 12:22:30PM -0700, Randy Dunlap wrote:
> On 4/23/23 22:49, Christoph Hellwig wrote:
> > +		if (IS_ENABLED(CONFIG_BLOCK))
> > +			inode->i_fop = &def_blk_fops;
> 
> It looks like def_blk_fops is being removed (commit message and patch
> fragment below), but here (above line) it is being used.
> 
> Am I just confused?

The def_blk_fops is removed only for the !CONFIG_BLOCK case. Its usage is under
a branch known at compile time, so it's optimized out for that case before
trying to resolve the symbol.

