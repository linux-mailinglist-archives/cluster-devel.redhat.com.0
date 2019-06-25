Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B6528E5
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 12:01:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF1658831F;
	Tue, 25 Jun 2019 10:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DCD75D717;
	Tue, 25 Jun 2019 10:01:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D79D31806B16;
	Tue, 25 Jun 2019 10:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5P9vpMx011446 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 05:57:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E6F45D9D6; Tue, 25 Jun 2019 09:57:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E55735D9D3;
	Tue, 25 Jun 2019 09:57:48 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5015C81DEC;
	Tue, 25 Jun 2019 09:57:39 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id F14BB68B02; Tue, 25 Jun 2019 11:57:07 +0200 (CEST)
Date: Tue, 25 Jun 2019 11:57:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190625095707.GA1462@lst.de>
References: <20190618144716.8133-1-agruenba@redhat.com>
	<20190624065408.GA3565@lst.de>
	<20190624182243.22447-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624182243.22447-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Tue, 25 Jun 2019 09:57:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 25 Jun 2019 09:57:39 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: -0.008  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH] fs: Move mark_inode_dirty out of
	__generic_write_end
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 25 Jun 2019 10:01:41 +0000 (UTC)

On Mon, Jun 24, 2019 at 08:22:43PM +0200, Andreas Gruenbacher wrote:
> That would work, but I don't like how this leaves us with a vfs function
> that updates i_size without bothering to dirty the inode very much.

This isn't a VFS function, it is a helper library.

> 
> How about if we move the __generic_write_end call into the page_done
> callback and leave special handling to the filesystem code if needed
> instead?  The below patch seems to work for gfs2.

That seems way more complicated.  I'd much rather go with something
like may patch plus maybe a big fat comment explaining that persisting
the size update is the file systems job.  Note that a lot of the modern
file systems don't use the VFS inode tracking for that, besides XFS
that includes at least btrfs and ocfs2 as well.

