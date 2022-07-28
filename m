Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC1584899
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Jul 2022 01:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659050156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PBuDLt5egCmAM7qnmMTRlyhGdjm3qKLZe8rdTJKb4W0=;
	b=cVL0pDgcpAhBdbHqLcgN9pa6nDN15+qz2/UI8rRVM4cs2nog7UXHChtpDR9rhY6mK3Z75g
	ltO3ker6WNK9Aoqq9VyYrjFxuWpgf2UE3hm0OoE9nyWLBV6Q9ahUbgtrVPNbM5q1swSCJY
	H58MtCi4/pGoBOfaozQvDAVC8uRtaww=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-b7lORjVxPqqhBrVw_OhaVw-1; Thu, 28 Jul 2022 19:15:53 -0400
X-MC-Unique: b7lORjVxPqqhBrVw_OhaVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 224CE380115C;
	Thu, 28 Jul 2022 23:15:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49FB5C04482;
	Thu, 28 Jul 2022 23:15:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF6871945DAD;
	Thu, 28 Jul 2022 23:15:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0429A1945D85 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Jul 2022 23:15:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5D4440CFD0A; Thu, 28 Jul 2022 23:15:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E5F40CF8EB
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 23:15:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8830101A54E
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 23:15:47 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
 [211.29.132.246]) by relay.mimecast.com with ESMTP id
 us-mta-519-VvqHqQavNka9G26JaehBEQ-1; Thu, 28 Jul 2022 19:15:44 -0400
X-MC-Unique: VvqHqQavNka9G26JaehBEQ-1
Received: from dread.disaster.area (pa49-195-20-138.pa.nsw.optusnet.com.au
 [49.195.20.138])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id BDCD662CC74;
 Fri, 29 Jul 2022 08:48:06 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oHCIV-006TpR-LO; Fri, 29 Jul 2022 08:48:03 +1000
Date: Fri, 29 Jul 2022 08:48:03 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20220728224803.GZ3861211@dread.disaster.area>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3>
 <YuKam52dkTGycay2@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YuKam52dkTGycay2@casper.infradead.org>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=OJNEYQWB c=1 sm=1 tr=0 ts=62e3122a
 a=cxZHBGNDieHvTKNp/pucQQ==:117 a=cxZHBGNDieHvTKNp/pucQQ==:17
 a=kj9zAlcOel0A:10 a=RgO8CyIxsXoA:10 a=7-415B0cAAAA:8
 a=daDVLCEH9rD64MzAnTUA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] remove iomap_writepage v2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 28, 2022 at 03:18:03PM +0100, Matthew Wilcox wrote:
> On Thu, Jul 28, 2022 at 01:10:16PM +0200, Jan Kara wrote:
> > Hi Christoph!
> > 
> > On Tue 19-07-22 06:13:07, Christoph Hellwig wrote:
> > > this series removes iomap_writepage and it's callers, following what xfs
> > > has been doing for a long time.
> > 
> > So this effectively means "no writeback from page reclaim for these
> > filesystems" AFAICT (page migration of dirty pages seems to be handled by
> > iomap_migrate_page()) which is going to make life somewhat harder for
> > memory reclaim when memory pressure is high enough that dirty pages are
> > reaching end of the LRU list. I don't expect this to be a problem on big
> > machines but it could have some undesirable effects for small ones
> > (embedded, small VMs). I agree per-page writeback has been a bad idea for
> > efficiency reasons for at least last 10-15 years and most filesystems
> > stopped dealing with more complex situations (like block allocation) from
> > ->writepage() already quite a few years ago without any bug reports AFAIK.
> > So it all seems like a sensible idea from FS POV but are MM people on board
> > or at least aware of this movement in the fs land?
> 
> I mentioned it during my folio session at LSFMM, but didn't put a huge
> emphasis on it.
> 
> For XFS, writeback should already be in progress on other pages if
> we're getting to the point of trying to call ->writepage() in vmscan.
> Surely this is also true for other filesystems?

Yes.

It's definitely true for btrfs, too, because btrfs_writepage does:

static int btrfs_writepage(struct page *page, struct writeback_control *wbc)
{
        struct inode *inode = page->mapping->host;
        int ret;

        if (current->flags & PF_MEMALLOC) {
                redirty_page_for_writepage(wbc, page);
                unlock_page(page);
                return 0;
        }
....

It also rejects all calls to write dirty pages from memory reclaim
contexts.

ext4 will also reject writepage calls from memory allocation if
block allocation is required (due to delayed allocation) or
unwritten extents need converting to written. i.e. if it has to run
blocking transactions.

So all three major filesystems will either partially or wholly
reject ->writepage calls from memory reclaim context.

IOWs, if memory reclaim is depending on ->writepage() to make
reclaim progress, it's not working as advertised on the vast
majority of production Linux systems....

The reality is that ->writepage is a relic of a bygone era of OS and
filesystem design. It was useful in the days where writing a dirty
page just involved looking up the bufferhead attached to the page to
get the disk mapping and then submitting it for IO.

Those days are long gone - filesystems have complex IO submission
paths now that have to handle delayed allocation, copy-on-write,
unwritten extents, have unbound memory demand, etc. All the
filesystems that support these 1990s era filesystem technologies
simply turn off ->writepage in memory reclaim contexts.

Hence for the vast majority of linux users (i.e. everyone using
ext4, btrfs and XFS), ->writepage no longer plays any part in memory
reclaim on their systems.

So why should we try to maintain the fiction that ->writepage is
required functionality in a filesystem when it clearly isn't?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

