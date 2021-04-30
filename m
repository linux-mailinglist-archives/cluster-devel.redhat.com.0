Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 819C736FAE6
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Apr 2021 14:50:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-KwTZM9TyNt2_3k0RMHKhDQ-1; Fri, 30 Apr 2021 08:49:59 -0400
X-MC-Unique: KwTZM9TyNt2_3k0RMHKhDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B1A804B8B;
	Fri, 30 Apr 2021 12:49:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62A919C45;
	Fri, 30 Apr 2021 12:49:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C65C18095C2;
	Fri, 30 Apr 2021 12:49:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13UCm3cK017386 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Apr 2021 08:48:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECD527AD6; Fri, 30 Apr 2021 12:48:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E72127AD7
	for <cluster-devel@redhat.com>; Fri, 30 Apr 2021 12:48:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5A658CDDF1
	for <cluster-devel@redhat.com>; Fri, 30 Apr 2021 12:47:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-14-37sYShAuOt2lOAhwrrEzeg-1;
	Fri, 30 Apr 2021 08:47:57 -0400
X-MC-Unique: 37sYShAuOt2lOAhwrrEzeg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19ED2AF0C;
	Fri, 30 Apr 2021 12:47:56 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id D350A1E3029; Fri, 30 Apr 2021 14:47:56 +0200 (CEST)
Date: Fri, 30 Apr 2021 14:47:56 +0200
From: Jan Kara <jack@suse.cz>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <20210430124756.GA5315@quack2.suse.cz>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
	<3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
MIME-Version: 1.0
In-Reply-To: <3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 29-04-21 11:07:15, Junxiao Bi wrote:
> On 4/29/21 10:14 AM, Andreas Gruenbacher wrote:
> > On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
> > > When doing truncate/fallocate for some filesytem like ocfs2, it
> > > will zero some pages that are out of inode size and then later
> > > update the inode size, so it needs this api to writeback eof
> > > pages.
> > is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
> > cache filling races" patch set [*]? It doesn't look like the kind of
> > patch Christoph would be happy with.
> 
> Thank you for pointing the patch set. I think that is fixing a different
> issue.
> 
> The issue here is when extending file size with fallocate/truncate, if the
> original inode size
> 
> is in the middle of the last cluster block(1M), eof part will be zeroed with
> buffer write first,
> 
> and then new inode size is updated, so there is a window that dirty pages is
> out of inode size,
> 
> if writeback is kicked in, block_write_full_page will drop all those eof
> pages.

I agree that the buffers describing part of the cluster beyond i_size won't
be written. But page cache will remain zeroed out so that is fine. So you
only need to zero out the on disk contents. Since this is actually
physically contiguous range of blocks why don't you just use
sb_issue_zeroout() to zero out the tail of the cluster? It will be more
efficient than going through the page cache and you also won't have to
tweak block_write_full_page()...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

