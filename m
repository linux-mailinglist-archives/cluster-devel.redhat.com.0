Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43456203
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 08:06:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4022307D859;
	Wed, 26 Jun 2019 06:06:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0AF5D719;
	Wed, 26 Jun 2019 06:06:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C8BB1806B0F;
	Wed, 26 Jun 2019 06:06:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q64TaT028631 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 02:04:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8074A60C4E; Wed, 26 Jun 2019 06:04:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4131E60C4C;
	Wed, 26 Jun 2019 06:04:27 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E36D308425B;
	Wed, 26 Jun 2019 06:04:07 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 74653227A82; Wed, 26 Jun 2019 08:03:30 +0200 (CEST)
Date: Wed, 26 Jun 2019 08:03:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190626060329.GA23666@lst.de>
References: <20190618144716.8133-1-agruenba@redhat.com>
	<20190624065408.GA3565@lst.de>
	<20190624182243.22447-1-agruenba@redhat.com>
	<20190625095707.GA1462@lst.de> <20190625105011.GA2602@lst.de>
	<20190625181329.3160-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625181329.3160-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 26 Jun 2019 06:04:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 26 Jun 2019 06:04:18 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 26 Jun 2019 06:06:54 +0000 (UTC)

On Tue, Jun 25, 2019 at 08:13:29PM +0200, Andreas Gruenbacher wrote:
> On Tue, 25 Jun 2019 at 12:50, Christoph Hellwig <hch@lst.de> wrote:
> >
> > > That seems way more complicated.  I'd much rather go with something
> > > like may patch plus maybe a big fat comment explaining that persisting
> > > the size update is the file systems job.  Note that a lot of the modern
> > > file systems don't use the VFS inode tracking for that, besides XFS
> > > that includes at least btrfs and ocfs2 as well.
> >
> > I'd suggest something like this as the baseline:
> >
> > http://git.infradead.org/users/hch/xfs.git/shortlog/refs/heads/iomap-i_size
> 
> Alright, can we change this as follows?
> 
> [Also, I'm not really sure why we check for (pos + ret > inode->i_size)
> when we have already read inode->i_size into old_size.]

Yeah, you probably want to change that to old_size.  Your changes look
good to me,

Can you just take the patch over from here as you've clearly done more
work on it and resend the whole series?

