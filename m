Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 964973D6386
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 18:39:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-4jM0YwmNMK-niLI9tsYIxA-1; Mon, 26 Jul 2021 12:39:39 -0400
X-MC-Unique: 4jM0YwmNMK-niLI9tsYIxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BC5CC622;
	Mon, 26 Jul 2021 16:39:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32BC910016F8;
	Mon, 26 Jul 2021 16:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5E8F4BB7C;
	Mon, 26 Jul 2021 16:39:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QGdV7R017072 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 12:39:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D3512156603; Mon, 26 Jul 2021 16:39:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78B56215CDC1
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:39:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24577857AAA
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:39:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-278-ZE1ezgZEOLmIdouiGrZgiQ-1;
	Mon, 26 Jul 2021 12:39:24 -0400
X-MC-Unique: ZE1ezgZEOLmIdouiGrZgiQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B84460F11;
	Mon, 26 Jul 2021 16:39:22 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:39:22 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210726163922.GA559142@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-17-hch@lst.de>
	<20210719170545.GF22402@magnolia> <20210726081942.GD14853@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210726081942.GD14853@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 16/27] iomap: switch iomap_bmap to use
	iomap_iter
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2021 at 10:19:42AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 19, 2021 at 10:05:45AM -0700, Darrick J. Wong wrote:
> > >  	bno = 0;
> > > -	ret = iomap_apply(inode, pos, blocksize, 0, ops, &bno,
> > > -			  iomap_bmap_actor);
> > > +	while ((ret = iomap_iter(&iter, ops)) > 0) {
> > > +		if (iter.iomap.type != IOMAP_MAPPED)
> > > +			continue;
> > 
> > There isn't a mapped extent, so return 0 here, right?
> 
> We can't just return 0, we always need the final iomap_iter() call
> to clean up in case a ->iomap_end method is supplied.  No for bmap
> having and needing one is rather theoretical, but people will copy
> and paste that once we start breaking the rules.

Oh, right, I forgot that someone might want to ->iomap_end.  The
"continue" works because we only asked for one block, therefore we know
that we'll never get to the loop body a second time; and we ignore
iter.processed, which also means we never revisit the loop body.

This "continue without setting iter.processed to break out of loop"
pattern is a rather indirect subtlety, since C programmers are taught
that they can break out of a loop using break;.  This new iomap_iter
pattern fubars that longstanding language feature, and the language
around it is soft:

> /**
>  * iomap_iter - iterate over a ranges in a file
>  * @iter: iteration structue
>  * @ops: iomap ops provided by the file system
>  *
>  * Iterate over file system provided contiguous ranges of blocks with the same
>  * state.  Should be called in a loop that continues as long as this function
>  * returns a positive value.  If 0 or a negative value is returned the caller
>  * should break out of the loop - a negative value is an error either from the
>  * file system or from the last iteration stored in @iter.copied.
>  */

The documentation needs to be much more explicit about the fact that you
cannot "break;" your way out of an iomap_iter loop.  I think the comment
should be rewritten along these lines:

"Iterate over filesystem-provided space mappings for the provided file
range.  This function handles cleanup of resources acquired for
iteration when the filesystem indicates there are no more space
mappings, which means that this function must be called in a loop that
continues as long it returns a positive value.  If 0 or a negative value
is returned, the caller must not return to the loop body.  Within a loop
body, there are two ways to break out of the loop body: leave
@iter.processed unchanged, or set it to the usual negative errno."

Hm.

What if we provide an explicit loop break function?  That would be clear
overkill for bmap, but somebody else wanting to break out of a more
complex loop body ought to be able to say "break" to do that, not
"continue with subtleties".

static inline int
iomap_iter_break(struct iomap_iter *iter, int ret)
{
	int ret2;

	if (!iter->iomap.length || !ops->iomap_end)
		return ret;

	ret2 = ops->iomap_end(iter->inode, iter->pos, iomap_length(iter),
			0, iter->flags, &iter->iomap);
	return ret ? ret : ret2;
}

And then then theoretical loop body becomes:

	while ((ret = iomap_iter(&iter, ops)) > 0) {
		if (iter.iomap.type != WHAT_I_WANT) {
			ret = iomap_iter_break(&iter, 0);
			break;
		}

		<large blob of code here>

		ret = vfs_do_some_risky_thing(...);
		if (ret) {
			ret = iomap_iter_break(&iter, ret);
			break;
		}

		<more loop body here>

		iter.processed = iter.iomap.length;
	}
	return ret;

Clunky, for sure, but at least we still get to use break as the language
designers intended.

--D

