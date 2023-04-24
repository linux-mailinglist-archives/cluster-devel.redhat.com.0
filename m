Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9B6ECC39
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 14:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682340168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iYXieGe9fPqTUexJRiJtdF9YaRduizg0r9Rnrl9HpAE=;
	b=EEvhnv5U1/uYMHbZDrPPD2iOoN32ha0tSLHilIgXwu4a2ilgMPgtx84RWXrvC1t8HqQPkf
	deGEixZcgJdCfvipb73QfQowIo0OHO4BBV4fNv+Hy8qZMRrOqYeGT5t6uw0ceMMQmeXLO4
	UtTxXwfZ945SZORMzoP5AxVlhsvWgC4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-f2D-5NM-OkiM668S07rFdQ-1; Mon, 24 Apr 2023 08:42:45 -0400
X-MC-Unique: f2D-5NM-OkiM668S07rFdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C057C3C0F367;
	Mon, 24 Apr 2023 12:42:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4732492C13;
	Mon, 24 Apr 2023 12:42:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 74687194658F;
	Mon, 24 Apr 2023 12:42:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 635BB1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 12:42:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BBFC9492C14; Mon, 24 Apr 2023 12:42:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4769492C13
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 12:42:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D2BA811E7B
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 12:42:40 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-Ymtq8NoLPtudH5Yx36RLSg-1; Mon, 24 Apr 2023 08:42:38 -0400
X-MC-Unique: Ymtq8NoLPtudH5Yx36RLSg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 72FF26732D; Mon, 24 Apr 2023 14:42:34 +0200 (CEST)
Date: Mon, 24 Apr 2023 14:42:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230424124234.GA5786@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-4-hch@lst.de> <ZEZ2gCYFlurJfeDE@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZEZ2gCYFlurJfeDE@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2023 at 01:30:56PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig wrote:
> > block_page_mkwrite_return is neither block nor mkwrite specific, and
> > should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
> > errno_to_vmfault.
> 
> Could you move it about 300 lines down and put it near vmf_error()
> so we think about how to unify the two at some point?
> 
> Perhaps it should better be called vmf_fs_error() for now since the
> errnos it handles are the kind generated by filesystems.

I'll look into unifying them for the next version.

