Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CA0763D6635
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 20:01:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-ycJcfJigMA6NRWjQogJRsQ-1; Mon, 26 Jul 2021 14:01:20 -0400
X-MC-Unique: ycJcfJigMA6NRWjQogJRsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9AB800D55;
	Mon, 26 Jul 2021 18:01:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0E919D7C;
	Mon, 26 Jul 2021 18:01:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B7E118095C2;
	Mon, 26 Jul 2021 18:01:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QI16Ss030184 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 14:01:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3A5C2144B28; Mon, 26 Jul 2021 18:01:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB802144B25
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 18:01:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ECF2185A79C
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 18:01:01 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-561-bqJ2JSpbPKiyM7vKBZwJ9w-1; Mon, 26 Jul 2021 14:00:44 -0400
X-MC-Unique: bqJ2JSpbPKiyM7vKBZwJ9w-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id DB9711FECC;
	Mon, 26 Jul 2021 18:00:42 +0000 (UTC)
Received: from quack2.suse.cz (unknown [10.100.200.198])
	by relay2.suse.de (Postfix) with ESMTP id 9C371A3B84;
	Mon, 26 Jul 2021 18:00:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 67F161E3B13; Mon, 26 Jul 2021 20:00:42 +0200 (CEST)
Date: Mon, 26 Jul 2021 20:00:42 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20210726180042.GN20621@quack2.suse.cz>
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-8-agruenba@redhat.com>
	<20210726170250.GL20621@quack2.suse.cz>
	<CAHpGcMLOZhZ7tGrY7rcYWUwx12sY884T=eC-Ckna63PBmF=zwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMLOZhZ7tGrY7rcYWUwx12sY884T=eC-Ckna63PBmF=zwA@mail.gmail.com>
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16QI16Ss030184
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 7/7] gfs2: Fix mmap + page fault
 deadlocks for direct I/O
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon 26-07-21 19:50:23, Andreas Grünbacher wrote:
> Jan Kara <jack@suse.cz> schrieb am Mo., 26. Juli 2021, 19:10:
> 
> > On Fri 23-07-21 22:58:40, Andreas Gruenbacher wrote:
> > > Also disable page faults during direct I/O requests and implement the
> > same kind
> > > of retry logic as in the buffered I/O case.
> > >
> > > Direct I/O requests differ from buffered I/O requests in that they use
> > > bio_iov_iter_get_pages for grabbing page references and faulting in pages
> > > instead of triggering real page faults.  Those manual page faults can be
> > > disabled with the iocb->noio flag.
> > >
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > ---
> > >  fs/gfs2/file.c | 34 +++++++++++++++++++++++++++++++++-
> > >  1 file changed, 33 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > > index f66ac7f56f6d..7986f3be69d2 100644
> > > --- a/fs/gfs2/file.c
> > > +++ b/fs/gfs2/file.c
> > > @@ -782,21 +782,41 @@ static ssize_t gfs2_file_direct_read(struct kiocb
> > *iocb, struct iov_iter *to,
> > >       struct file *file = iocb->ki_filp;
> > >       struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
> > >       size_t count = iov_iter_count(to);
> > > +     size_t written = 0;
> > >       ssize_t ret;
> > >
> > > +     /*
> > > +      * In this function, we disable page faults when we're holding the
> > > +      * inode glock while doing I/O.  If a page fault occurs, we drop
> > the
> > > +      * inode glock, fault in the pages manually, and then we retry.
> > Other
> > > +      * than in gfs2_file_read_iter, iomap_dio_rw can trigger implicit
> > as
> > > +      * well as manual page faults, and we need to disable both kinds
> > > +      * separately.
> > > +      */
> > > +
> > >       if (!count)
> > >               return 0; /* skip atime */
> > >
> > >       gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
> > > +retry:
> > >       ret = gfs2_glock_nq(gh);
> > >       if (ret)
> > >               goto out_uninit;
> > >
> > > +     pagefault_disable();
> >
> > Is there any use in pagefault_disable() here? iomap_dio_rw() should not
> > trigger any page faults anyway, should it?
> >
> 
> It can trigger physical page faults when reading from holes.

Aha, good point. Maybe even worth a comment at this site? Thanks for
explanation!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


