Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E533D3D638B
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 18:41:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-Wh0Vpw1HMee5uro3gWUEjQ-1; Mon, 26 Jul 2021 12:41:51 -0400
X-MC-Unique: Wh0Vpw1HMee5uro3gWUEjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7343418C89CC;
	Mon, 26 Jul 2021 16:41:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3968B60C0F;
	Mon, 26 Jul 2021 16:41:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25FCA4BB7C;
	Mon, 26 Jul 2021 16:41:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QGfltH017943 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 12:41:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA30821602B6; Mon, 26 Jul 2021 16:41:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E429221602BA
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:41:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 582A0800BED
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 16:41:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-581-xdXf0PeRNRWSDVQiOUTdSA-1;
	Mon, 26 Jul 2021 12:41:41 -0400
X-MC-Unique: xdXf0PeRNRWSDVQiOUTdSA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A078F6044F;
	Mon, 26 Jul 2021 16:41:39 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:41:39 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210726164139.GS559212@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-18-hch@lst.de>
	<20210719172247.GG22402@magnolia> <20210726082236.GE14853@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210726082236.GE14853@lst.de>
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

On Mon, Jul 26, 2021 at 10:22:36AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 19, 2021 at 10:22:47AM -0700, Darrick J. Wong wrote:
> > > -static loff_t
> > > -iomap_seek_hole_actor(struct inode *inode, loff_t start, loff_t length,
> > > -		      void *data, struct iomap *iomap, struct iomap *srcmap)
> > > +static loff_t iomap_seek_hole_iter(const struct iomap_iter *iter, loff_t *pos)
> > 
> > /me wonders if @pos should be named hole_pos (here and in the caller) to
> > make it a little easier to read...
> 
> Sure.
> 
> > ...because what we're really saying here is that if seek_hole_iter found
> > a hole (and returned zero, thereby terminating the loop before iter.len
> > could reach zero), we want to return the position of the hole.
> 
> Yes.
> 
> > > +	return size;
> > 
> > Not sure why we return size here...?  Oh, because there's an implicit
> > hole at EOF, so we return i_size.  Uh, does this do the right thing if
> > ->iomap_begin returns posteof mappings?  I don't see anything in
> > iomap_iter_advance that would stop iteration at EOF.
> 
> Nothing in ->iomap_begin checks that, iomap_seek_hole initializes
> iter.len so that it stops at EOF.

Oh, right.  Sorry, I forgot that. :(

--D

