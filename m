Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E771821DBA0
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jul 2020 18:24:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-uY0tmpAVMBqlMknSuYE-Zg-1; Mon, 13 Jul 2020 12:23:59 -0400
X-MC-Unique: uY0tmpAVMBqlMknSuYE-Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE3B1085;
	Mon, 13 Jul 2020 16:23:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEF4B5C1D0;
	Mon, 13 Jul 2020 16:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C357180954D;
	Mon, 13 Jul 2020 16:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DGNnAp025620 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:23:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2685BEE373; Mon, 13 Jul 2020 16:23:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F2E5EC4D8
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 16:23:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 849DD805B9F
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 16:23:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-319-5O6-wH41Mm24WBAyuHDWbg-1;
	Mon, 13 Jul 2020 12:23:42 -0400
X-MC-Unique: 5O6-wH41Mm24WBAyuHDWbg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1FFF9B66C;
	Mon, 13 Jul 2020 16:10:21 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 4DADDDA809; Mon, 13 Jul 2020 18:09:57 +0200 (CEST)
Date: Mon, 13 Jul 2020 18:09:57 +0200
From: David Sterba <dsterba@suse.cz>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20200713160957.GM3703@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20200713074633.875946-1-hch@lst.de>
	<20200713074633.875946-3-hch@lst.de>
	<20200713122050.okus7qlampk5ysyb@fiona>
MIME-Version: 1.0
In-Reply-To: <20200713122050.okus7qlampk5ysyb@fiona>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 2/2] iomap: fall back to buffered writes
 for invalidation failures
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
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

On Mon, Jul 13, 2020 at 07:20:50AM -0500, Goldwyn Rodrigues wrote:
> On  9:46 13/07, Christoph Hellwig wrote:
> > Failing to invalid the page cache means data in incoherent, which is
> > a very bad state for the system.  Always fall back to buffered I/O
> > through the page cache if we can't invalidate mappings.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Thanks. This will help btrfs. The current next tree contains the iomap
> changes I recomended and would need to be reverted in order to
> incorporate this. Once this is in the next tree I will (re)format the
> btrfs iomap dio patches.

Patches in next don't need to be reverted, if you put together a branch
with any iomap or other prep patches + btrfs iomap-dio I'll replace it
in the for-next snapshot I push.

