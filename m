Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42371228405
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 17:41:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-j2zqg6SKM4ysY63CXL823Q-1; Tue, 21 Jul 2020 11:41:49 -0400
X-MC-Unique: j2zqg6SKM4ysY63CXL823Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8864780046E;
	Tue, 21 Jul 2020 15:41:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C2395C3F8;
	Tue, 21 Jul 2020 15:41:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4C5E1809554;
	Tue, 21 Jul 2020 15:41:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LFfgVq030178 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 11:41:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65C1510C150B; Tue, 21 Jul 2020 15:41:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DCB10C150A
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:41:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ECAD8007CD
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:41:39 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-333-b2QOhiRYPWKZs8qSXDF-Kw-1;
	Tue, 21 Jul 2020 11:41:37 -0400
X-MC-Unique: b2QOhiRYPWKZs8qSXDF-Kw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 85F1F68AFE; Tue, 21 Jul 2020 17:41:33 +0200 (CEST)
Date: Tue, 21 Jul 2020 17:41:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200721154132.GA11652@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de> <20200721152754.GD7597@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200721152754.GD7597@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, linux-man@vger.kernel.org,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Michael Kerrisk <mtk.manpages@gmail.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: iomap write invalidation
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

On Tue, Jul 21, 2020 at 08:27:54AM -0700, Darrick J. Wong wrote:
> On Tue, Jul 21, 2020 at 05:16:16PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 21, 2020 at 04:14:37PM +0100, Matthew Wilcox wrote:
> > > On Tue, Jul 21, 2020 at 05:06:15PM +0200, Christoph Hellwig wrote:
> > > > On Tue, Jul 21, 2020 at 04:04:32PM +0100, Matthew Wilcox wrote:
> > > > > I thought you were going to respin this with EREMCHG changed to ENOTBLK?
> > > > 
> > > > Oh, true.  I'll do that ASAP.
> > > 
> > > Michael, could we add this to manpages?
> > 
> > Umm, no.  -ENOTBLK is internal - the file systems will retry using
> > buffered I/O and the error shall never escape to userspace (or even the
> > VFS for that matter).
> 
> It's worth dropping a comment somewhere that ENOTBLK is the desired
> "fall back to buffered" errcode, seeing as Dave and I missed that in
> XFS...

Sounds like a good idea, but what would a good place be?

