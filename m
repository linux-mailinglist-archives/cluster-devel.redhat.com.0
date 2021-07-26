Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E879D3D5951
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 14:18:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-fjdYHNF_NqCvoG5bMl6CNw-1; Mon, 26 Jul 2021 08:18:55 -0400
X-MC-Unique: fjdYHNF_NqCvoG5bMl6CNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C111008061;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9952760C4A;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8735D181A2A6;
	Mon, 26 Jul 2021 12:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16Q8MpuM026659 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 04:22:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 055CA63F50; Mon, 26 Jul 2021 08:22:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005E1568DB
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:22:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0FC180018D
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 08:22:47 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-584-gnL63fFHMpuM-AnS4AdJmg-1;
	Mon, 26 Jul 2021 04:22:43 -0400
X-MC-Unique: gnL63fFHMpuM-AnS4AdJmg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1A49667373; Mon, 26 Jul 2021 10:22:38 +0200 (CEST)
Date: Mon, 26 Jul 2021 10:22:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210726082236.GE14853@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-18-hch@lst.de>
	<20210719172247.GG22402@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210719172247.GG22402@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 17/27] iomap: switch iomap_seek_hole to
	use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 10:22:47AM -0700, Darrick J. Wong wrote:
> > -static loff_t
> > -iomap_seek_hole_actor(struct inode *inode, loff_t start, loff_t length,
> > -		      void *data, struct iomap *iomap, struct iomap *srcmap)
> > +static loff_t iomap_seek_hole_iter(const struct iomap_iter *iter, loff_t *pos)
> 
> /me wonders if @pos should be named hole_pos (here and in the caller) to
> make it a little easier to read...

Sure.

> ...because what we're really saying here is that if seek_hole_iter found
> a hole (and returned zero, thereby terminating the loop before iter.len
> could reach zero), we want to return the position of the hole.

Yes.

> > +	return size;
> 
> Not sure why we return size here...?  Oh, because there's an implicit
> hole at EOF, so we return i_size.  Uh, does this do the right thing if
> ->iomap_begin returns posteof mappings?  I don't see anything in
> iomap_iter_advance that would stop iteration at EOF.

Nothing in ->iomap_begin checks that, iomap_seek_hole initializes
iter.len so that it stops at EOF.

