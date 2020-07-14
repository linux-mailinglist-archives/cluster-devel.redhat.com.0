Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCAA21EE9C
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 13:01:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-WJCDOBEmPV6DMCvorxcG2Q-1; Tue, 14 Jul 2020 07:01:08 -0400
X-MC-Unique: WJCDOBEmPV6DMCvorxcG2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E248027EC;
	Tue, 14 Jul 2020 11:01:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A378710A0;
	Tue, 14 Jul 2020 11:01:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7E6994F01;
	Tue, 14 Jul 2020 11:01:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EB13ox004360 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 07:01:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 945262097D60; Tue, 14 Jul 2020 11:01:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F75F2026D5D
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 11:01:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 962218007C9
	for <cluster-devel@redhat.com>; Tue, 14 Jul 2020 11:01:00 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-6-nu6Pf4isM_ysQ9mBG7NxSA-1;
	Tue, 14 Jul 2020 07:00:58 -0400
X-MC-Unique: nu6Pf4isM_ysQ9mBG7NxSA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2343368CFC; Tue, 14 Jul 2020 13:00:56 +0200 (CEST)
Date: Tue, 14 Jul 2020 13:00:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200714110055.GC16178@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
	<20200713074633.875946-3-hch@lst.de>
	<20200713153920.GU7606@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200713153920.GU7606@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 08:39:20AM -0700, Darrick J. Wong wrote:
> -ENOTBLK is already being used as a "magic" return code that means
> "retry this direct write as a buffered write".  Shouldn't we use that
> instead?
> 
> -EREMCHG was a private hack we put in XFS for the one case where a
> direct write had to be done through the page cache (non block-aligned
> COW), but maybe it's time we put that to rest since the rest of the
> world apparently thinks the magic fallback code is -ENOTBLK.

Sure, I can switch the error code.

