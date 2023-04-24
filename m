Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D7C6EC62B
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=m2RVkRM/RRfziaaa7EwKPpi+1lzJHXGOtI0HTD/B43k=;
	b=DwpW5YgMM64OxO8cH6z0q7sQSGf09Xdxg//kDKteZzhnsa1azrBSbZdwVfIbBTJp83lseI
	Va3R6D9Q+fIXFUDkwqRGDBlgLJWHso0EEo2Ll0kMFhUJse3aU72QvdvI5vH01a2tSJTSZe
	ttkUkeo1zOtndkY0b1iqEcbYUU50hvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-oWxHIrpjM-OZcfRjAmbOBg-1; Mon, 24 Apr 2023 02:22:28 -0400
X-MC-Unique: oWxHIrpjM-OZcfRjAmbOBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18AC3185A790;
	Mon, 24 Apr 2023 06:22:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D7631121318;
	Mon, 24 Apr 2023 06:22:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D536F1946589;
	Mon, 24 Apr 2023 06:22:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A58861946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:22:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9879F49AF0; Mon, 24 Apr 2023 06:22:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90847440D3
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7774629ABA10
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:25 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-ziNLsEZNM7q0SAnErHnIsg-1; Mon, 24 Apr 2023 02:22:23 -0400
X-MC-Unique: ziNLsEZNM7q0SAnErHnIsg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 50A3B68B05; Mon, 24 Apr 2023 08:22:20 +0200 (CEST)
Date: Mon, 24 Apr 2023 08:22:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230424062220.GA10368@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-12-hch@lst.de>
 <20230424061825.GO360889@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230424061825.GO360889@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 11/17] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
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
 Miklos Szeredi <miklos@szeredi.hu>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 23, 2023 at 11:18:25PM -0700, Darrick J. Wong wrote:
> > @@ -876,8 +877,11 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
> >  	if (iocb->ki_flags & IOCB_NOWAIT)
> >  		iter.flags |= IOMAP_NOWAIT;
> >  
> > +	current->backing_dev_info = inode_to_bdi(iter.inode);
> 
> Dumb question from me late on a Sunday night, but does the iomap_unshare
> code need to set this too?  Since it works by dirtying pagecache folios
> without actually changing the contents?

A very good question that I have no answer for.  The
current->backing_dev_info mechanism confuses the heck out of me and
appears basically undocumented.

