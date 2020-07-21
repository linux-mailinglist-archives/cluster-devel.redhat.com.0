Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2EF228326
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 17:06:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-HZAFqU0cPHuF4vcCuBqrEA-1; Tue, 21 Jul 2020 11:06:35 -0400
X-MC-Unique: HZAFqU0cPHuF4vcCuBqrEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E98100A62E;
	Tue, 21 Jul 2020 15:06:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262185D9CA;
	Tue, 21 Jul 2020 15:06:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2006B730C6;
	Tue, 21 Jul 2020 15:06:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LF20OU024585 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 11:02:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35DF0102EA6A; Tue, 21 Jul 2020 15:02:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A5D103E347
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:01:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C055856A5B
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:01:57 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-HK5BtXLTNsOQyuZSxc8mzA-1;
	Tue, 21 Jul 2020 11:01:55 -0400
X-MC-Unique: HK5BtXLTNsOQyuZSxc8mzA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2E0DE68AFE; Tue, 21 Jul 2020 16:53:14 +0200 (CEST)
Date: Tue, 21 Jul 2020 16:53:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20200721145313.GA9217@lst.de>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
MIME-Version: 1.0
In-Reply-To: <20200720215125.bfz7geaftocy4r5l@fiona>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2020 at 04:51:25PM -0500, Goldwyn Rodrigues wrote:
> Hi Christoph,
> 
> On  9:46 13/07, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series has two parts:  the first one picks up Dave's patch to avoid
> > invalidation entierly for reads, picked up deep down from the btrfs iomap
> > thread.  The second one falls back to buffered writes if invalidation fails
> > instead of leaving a stale cache around.  Let me know what you think about
> > this approch.
> 
> Which kernel version are these changes expected?
> btrfs dio switch to iomap depends on this.

No idea.  Darrick, are you ok with picking this up soon so that
Goldwyn can pull it in?

