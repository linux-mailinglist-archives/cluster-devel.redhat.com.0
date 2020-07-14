Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2521721EE94
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 13:00:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-4wIePERsONKXu_J_wZ3GgQ-1; Tue, 14 Jul 2020 07:00:29 -0400
X-MC-Unique: 4wIePERsONKXu_J_wZ3GgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E71CD8015F3;
	Tue, 14 Jul 2020 11:00:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7408D5C679;
	Tue, 14 Jul 2020 11:00:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA232180954D;
	Tue, 14 Jul 2020 11:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EB0MjT004232 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 07:00:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6F3C2166BA4; Tue, 14 Jul 2020 11:00:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A23702157F23
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 11:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 732EF185A797
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 11:00:17 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-309-wS-vGzxHO4-Rtrf1y8G6TA-1;
	Tue, 14 Jul 2020 07:00:15 -0400
X-MC-Unique: wS-vGzxHO4-Rtrf1y8G6TA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 28D5B68CFC; Tue, 14 Jul 2020 13:00:12 +0200 (CEST)
Date: Tue, 14 Jul 2020 13:00:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200714110011.GB16178@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
	<20200713074633.875946-3-hch@lst.de>
	<20200713115509.GW12769@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200713115509.GW12769@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 2/2] iomap: fall back to buffered writes
 for invalidation failures
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 12:55:09PM +0100, Matthew Wilcox wrote:
> On Mon, Jul 13, 2020 at 09:46:33AM +0200, Christoph Hellwig wrote:
> > Failing to invalid the page cache means data in incoherent, which is
> > a very bad state for the system.  Always fall back to buffered I/O
> > through the page cache if we can't invalidate mappings.
> 
> Is that the right approach though?  I don't have a full picture in my head,
> but wouldn't we be better off marking these pages as !Uptodate and doing
> the direct I/O?

Isn't that a problem if e.g. pages are mapped into userspace and mlocked?

