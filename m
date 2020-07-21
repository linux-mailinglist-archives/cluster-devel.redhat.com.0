Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CDD1A228517
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 18:14:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-1YM0X0RxMXWOm5LVrS-MgA-1; Tue, 21 Jul 2020 12:14:22 -0400
X-MC-Unique: 1YM0X0RxMXWOm5LVrS-MgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D851DE1;
	Tue, 21 Jul 2020 16:14:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F8E5C662;
	Tue, 21 Jul 2020 16:14:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 552C21800FDD;
	Tue, 21 Jul 2020 16:14:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LG1qaA032028 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 12:01:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAA2F2022AA8; Tue, 21 Jul 2020 16:01:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67C62026D69
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:01:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C894380CC38
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:01:49 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-485-fJh1xA5mMs6I6gj__J480Q-1;
	Tue, 21 Jul 2020 12:01:46 -0400
X-MC-Unique: fJh1xA5mMs6I6gj__J480Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id E5A9068AFE; Tue, 21 Jul 2020 18:01:43 +0200 (CEST)
Date: Tue, 21 Jul 2020 18:01:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200721160143.GA12046@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de> <20200721152754.GD7597@magnolia>
	<20200721154132.GA11652@lst.de> <20200721155925.GB3151642@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200721155925.GB3151642@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Tue, Jul 21, 2020 at 08:59:25AM -0700, Darrick J. Wong wrote:
> In the comment that precedes iomap_dio_rw() for the iomap version,

maybe let's just do that..

> ``direct_IO``
> 	called by the generic read/write routines to perform direct_IO -
> 	that is IO requests which bypass the page cache and transfer
> 	data directly between the storage and the application's address
> 	space.  This function can return -ENOTBLK to signal that it is
> 	necessary to fallback to buffered IO.  Note that
> 	blockdev_direct_IO and variants can also return -ENOTBLK.

->direct_IO is not used for iomap and various other implementations.
In fact it is a horrible hack that I've been trying to get rid of
for a while.

