Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D56083727B4
	for <lists+cluster-devel@lfdr.de>; Tue,  4 May 2021 11:02:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-SyJjzp-ZOL-Wa6gpFNhR9Q-1; Tue, 04 May 2021 05:02:56 -0400
X-MC-Unique: SyJjzp-ZOL-Wa6gpFNhR9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447EA801817;
	Tue,  4 May 2021 09:02:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2FA41037E86;
	Tue,  4 May 2021 09:02:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EC421800BB8;
	Tue,  4 May 2021 09:02:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14492jo1020287 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 May 2021 05:02:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D2F1215744A; Tue,  4 May 2021 09:02:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2851C215744C
	for <cluster-devel@redhat.com>; Tue,  4 May 2021 09:02:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AEA185828E
	for <cluster-devel@redhat.com>; Tue,  4 May 2021 09:02:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-563-h_VdRooMMa-zeC7EgZ-AzA-1;
	Tue, 04 May 2021 05:02:39 -0400
X-MC-Unique: h_VdRooMMa-zeC7EgZ-AzA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 35AF0AC1A;
	Tue,  4 May 2021 09:02:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 007201F2B62; Tue,  4 May 2021 11:02:37 +0200 (CEST)
Date: Tue, 4 May 2021 11:02:37 +0200
From: Jan Kara <jack@suse.cz>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <20210504090237.GC1355@quack2.suse.cz>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
	<3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
	<20210430124756.GA5315@quack2.suse.cz>
	<a69fa4bc-ffe7-204b-6a1f-6a166c6971a4@oracle.com>
	<20210503102904.GC2994@quack2.suse.cz>
	<72cde802-bd8a-9ce5-84d7-57b34a6a8b03@oracle.com>
MIME-Version: 1.0
In-Reply-To: <72cde802-bd8a-9ce5-84d7-57b34a6a8b03@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 1/3] fs/buffer.c: add new api to allow
 eof writeback
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon 03-05-21 10:25:31, Junxiao Bi wrote:
> 
> On 5/3/21 3:29 AM, Jan Kara wrote:
> > On Fri 30-04-21 14:18:15, Junxiao Bi wrote:
> > > On 4/30/21 5:47 AM, Jan Kara wrote:
> > > 
> > > > On Thu 29-04-21 11:07:15, Junxiao Bi wrote:
> > > > > On 4/29/21 10:14 AM, Andreas Gruenbacher wrote:
> > > > > > On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
> > > > > > > When doing truncate/fallocate for some filesytem like ocfs2, it
> > > > > > > will zero some pages that are out of inode size and then later
> > > > > > > update the inode size, so it needs this api to writeback eof
> > > > > > > pages.
> > > > > > is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
> > > > > > cache filling races" patch set [*]? It doesn't look like the kind of
> > > > > > patch Christoph would be happy with.
> > > > > Thank you for pointing the patch set. I think that is fixing a different
> > > > > issue.
> > > > > 
> > > > > The issue here is when extending file size with fallocate/truncate, if the
> > > > > original inode size
> > > > > 
> > > > > is in the middle of the last cluster block(1M), eof part will be zeroed with
> > > > > buffer write first,
> > > > > 
> > > > > and then new inode size is updated, so there is a window that dirty pages is
> > > > > out of inode size,
> > > > > 
> > > > > if writeback is kicked in, block_write_full_page will drop all those eof
> > > > > pages.
> > > > I agree that the buffers describing part of the cluster beyond i_size won't
> > > > be written. But page cache will remain zeroed out so that is fine. So you
> > > > only need to zero out the on disk contents. Since this is actually
> > > > physically contiguous range of blocks why don't you just use
> > > > sb_issue_zeroout() to zero out the tail of the cluster? It will be more
> > > > efficient than going through the page cache and you also won't have to
> > > > tweak block_write_full_page()...
> > > Thanks for the review.
> > > 
> > > The physical blocks to be zeroed were continuous only when sparse mode is
> > > enabled, if sparse mode is disabled, unwritten extent was not supported for
> > > ocfs2, then all the blocks to the new size will be zeroed by the buffer
> > > write, since sb_issue_zeroout() will need waiting io done, there will be a
> > > lot of delay when extending file size. Use writeback to flush async seemed
> > > more efficient?
> > It depends. Higher end storage (e.g. NVME or NAS, maybe some better SATA
> > flash disks as well) do support WRITE_ZERO command so you don't actually
> > have to write all those zeros. The storage will just internally mark all
> > those blocks as having zeros. This is rather fast so I'd expect the overall
> > result to be faster that zeroing page cache and then writing all those
> > pages with zeroes on transaction commit. But I agree that for lower end
> > storage this may be slower because of synchronous writing of zeroes. That
> > being said your transaction commit has to write those zeroes anyway so the
> > cost is only mostly shifted but it could still make a difference for some
> > workloads. Not sure if that matters, that is your call I'd say.
> 
> Ocfs2 is mostly used with SAN, i don't think it's common for SAN storage to
> support WRITE_ZERO command.
> 
> Anything bad to add a new api to support eof writeback?

OK, now that I reread the whole series you've posted I think I somewhat
misunderstood your original problem and intention. So let's first settle
on that. As far as I understand the problem happens when extending a file
(either through truncate or through write beyond i_size). When that
happens, we need to make sure that blocks (or their parts) that used to be
above i_size and are not going to be after extension are zeroed out.
Usually, for simple filesystems such as ext2, there is only one such block
- the one straddling i_size - where we need to make sure this happens. And
we achieve that by zeroing out tail of this block on writeout (in
->writepage() handler) and also by zeroing out tail of the block when
reducing i_size (block_truncate_page() takes care of this for ext2). So the
tail of this block is zeroed out on disk at all times and thus we have no
problem when extending i_size.

Now what I described doesn't work for OCFS2. As far as I understand the
reason is that when block size is smaller than page size and OCFS2 uses
cluster size larger than block size, the page straddling i_size can have
also some buffers mapped (with underlying blocks allocated) that are fully
outside of i_size. These blocks are never written because of how
__block_write_full_page() currently behaves (never writes buffers fully
beyond i_size) so even if you zero out page cache and dirty the page,
racing writeback can clear dirty bits without writing those blocks and so
they are not zeroed out on disk although we are about to expand i_size.

Did I understand the problem correctly? But what confuses me is that
ocfs2_zero_extend_range() (ocfs2_write_zero_page() in fact) actually does
extend i_size to contain the range it zeroes out while still holding the
page lock so it should be protected against the race with writeback I
outlined above. What am I missing?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

