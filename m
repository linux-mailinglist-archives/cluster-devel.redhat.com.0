Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E070F7F9
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 15:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684936011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PlI3NINuTp5y2t5Z+4wg7vfiTt8lvB4SyLbHC5tKASU=;
	b=KvhjEa/yB9gyJZDFy4pZl/788kWS7uENktpnHRCjeZr9Ed1iC0sKrtefyIznRyqcY4RB/t
	NC8RdE+tG5xVkFP5SHz+bFycWRNh6VEFrWdYCbufBcMqKklt3ECzSsstvCk8yYJxh+hQ0C
	xYvN13sjYGtJydrLg20dC1u/oGpGyYw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-hMuh4uXwMWCdrT-HJAPrig-1; Wed, 24 May 2023 09:46:47 -0400
X-MC-Unique: hMuh4uXwMWCdrT-HJAPrig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F92185A79B;
	Wed, 24 May 2023 13:46:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BFD1482062;
	Wed, 24 May 2023 13:46:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C94F19451C2;
	Wed, 24 May 2023 13:46:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0899C19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 13:33:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9AACC090D9; Wed, 24 May 2023 13:33:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B208BC1ED99
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 13:33:24 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93F81800B35
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 13:33:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-7VT6AMzrOcuVoaCTAZN5vA-1; Wed,
 24 May 2023 09:33:20 -0400
X-MC-Unique: 7VT6AMzrOcuVoaCTAZN5vA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q1oc5-00BF3M-Tz; Wed, 24 May 2023 13:33:13 +0000
Date: Wed, 24 May 2023 14:33:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZG4SGYOogQtEZrll@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
 <ZG09wR4WOI8zDxJK@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <ZG09wR4WOI8zDxJK@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 16/17] block: use iomap for writes to
 block devices
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
 linux-mm@kvack.org, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 08:27:13AM +1000, Dave Chinner wrote:
> On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
> > I'm hitting this during booting:
> > [    5.016324]  <TASK>
> > [    5.030256]  iomap_iter+0x11a/0x350
> > [    5.030264]  iomap_readahead+0x1eb/0x2c0
> > [    5.030272]  read_pages+0x5d/0x220
> > [    5.030279]  page_cache_ra_unbounded+0x131/0x180
> > [    5.030284]  filemap_get_pages+0xff/0x5a0
> 
> Why is filemap_get_pages() using unbounded readahead? Surely
> readahead should be limited to reading within EOF....

It isn't using unbounded readahead; that's an artifact of this
incomplete stack trace.  Actual call stack:

page_cache_ra_unbounded
do_page_cache_ra
ondemand_readahead
page_cache_sync_ra
page_cache_sync_readahead
filemap_get_pages

As you can see, do_page_cache_ra() does limit readahead to i_size.
Is ractl->mapping->host the correct way to find the inode?  I always
get confused.

> I think Christoph's code is correct. IMO, any attempt to read beyond
> the end of the device should throw out a warning and return an
> error, not silently return zeros.
> 
> If readahead is trying to read beyond the end of the device, then it
> really seems to me like the problem here is readahead, not the iomap
> code detecting the OOB read request....
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

