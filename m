Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD2433F4C
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Oct 2021 21:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634671889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IpjZLH210UbCFdcb6g5P1douHB4oJMtMFw+YH3KvSt4=;
	b=e8odKYbh1Pz/T3/R6C978FESQJ4gDBFYz6VPxzjyi+ru+W/227E2+wBSnK/a2cbg1O8v0q
	HjxJcPXabEzWAPF+CB4L6cdTX+SddTGJME6qN/u70YcpPC/KxI4lZNliF+gKB2Ad8HKxSJ
	dkxCUe/UFG9KuftVE2S78bw/wuVDC1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-eMj25VHyOKGOeQ7bXxSfKA-1; Tue, 19 Oct 2021 15:31:26 -0400
X-MC-Unique: eMj25VHyOKGOeQ7bXxSfKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBFE71922025;
	Tue, 19 Oct 2021 19:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DB45DD68;
	Tue, 19 Oct 2021 19:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFAE21806D04;
	Tue, 19 Oct 2021 19:31:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JJVC1C025115 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 15:31:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A84BC40D1B9F; Tue, 19 Oct 2021 19:31:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A482540D1B9E
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 19:31:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87531811E93
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 19:31:12 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-401-HriWpAQyMt2peJwIPDqCVQ-1; Tue, 19 Oct 2021 15:31:11 -0400
X-MC-Unique: HriWpAQyMt2peJwIPDqCVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
	y142-20020a1c7d94000000b00322f2e380f2so1231992wmc.6
	for <cluster-devel@redhat.com>; Tue, 19 Oct 2021 12:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IpjZLH210UbCFdcb6g5P1douHB4oJMtMFw+YH3KvSt4=;
	b=ZZnh3LzNUgRVtvH1bKQmFrJUiPszAqc1exseQW/TOl49O3iYVzyru3h+K/Uo/dTpqU
	BTgFg/+f3sVrKLvuo0rC+Xzpi+EpvyzOc9gF7USYAZkUSOvUddTOD5ADssblyC/cqmuU
	n9qmS/oF0VBHLENrvtk9x76G4+5UZmy4B0JPTFFGFZm2y5MUK9NOrRnn9fQa3Rf8u6Pf
	tb58L26x0/1YhN+CrmDtb7idJXEjU+RuetlxujUPSPBZ+90nbqfBrWFzlHyz9OYCobKP
	Dw/x3KYQ559lwzxYZhBVu6mJSvnZfKHJB1r87QQnuB9Ts+R/sQ4/BtKpyR+4A5gTT8wq
	OHuA==
X-Gm-Message-State: AOAM531ms47J+QbKlfdk7tHldZmoA16NBwRDDHaT6/33wDMstNw+iPQU
	dm7lymqT790dmlHVMdxmfvVqI7SzaajOX4W9+OAVOwHfKtKL3Xiv0khvjvw1yQ0vks6MN+k0Udi
	8JF2O7Km5bTe7/3WJs45krch5IytU5n2rc383nA==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr8482639wme.138.1634671869903; 
	Tue, 19 Oct 2021 12:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZAOG18urGZA+dsEvtuWH/BFDx551A36q+SqZcTXXqsnpiEjKeK89BTSSuXKXAYh63aDfv00Wkyf1ru1HmrHE=
X-Received: by 2002:a1c:7911:: with SMTP id l17mr8482616wme.138.1634671869594; 
	Tue, 19 Oct 2021 12:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<20211019134204.3382645-15-agruenba@redhat.com>
	<20211019155105.GA24248@magnolia>
In-Reply-To: <20211019155105.GA24248@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 19 Oct 2021 21:30:58 +0200
Message-ID: <CAHc6FU5KGJKxO=OPbiQS915K7nb-kjwxcdABacMcJ6UAtbybVQ@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-btrfs@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 14/17] iomap: Add done_before
	argument to iomap_dio_rw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 19, 2021 at 5:51 PM Darrick J. Wong <djwong@kernel.org> wrote:
> On Tue, Oct 19, 2021 at 03:42:01PM +0200, Andreas Gruenbacher wrote:
> > Add a done_before argument to iomap_dio_rw that indicates how much of
> > the request has already been transferred.  When the request succeeds, we
> > report that done_before additional bytes were tranferred.  This is
> > useful for finishing a request asynchronously when part of the request
> > has already been completed synchronously.
> >
> > We'll use that to allow iomap_dio_rw to be used with page faults
> > disabled: when a page fault occurs while submitting a request, we
> > synchronously complete the part of the request that has already been
> > submitted.  The caller can then take care of the page fault and call
> > iomap_dio_rw again for the rest of the request, passing in the number of
> > bytes already tranferred.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/btrfs/file.c       |  5 +++--
> >  fs/erofs/data.c       |  2 +-
> >  fs/ext4/file.c        |  5 +++--
> >  fs/gfs2/file.c        |  4 ++--
> >  fs/iomap/direct-io.c  | 11 ++++++++---
> >  fs/xfs/xfs_file.c     |  6 +++---
> >  fs/zonefs/super.c     |  4 ++--
> >  include/linux/iomap.h |  4 ++--
> >  8 files changed, 24 insertions(+), 17 deletions(-)
> >
> > diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> > index f37211d3bb69..9d41b28c67ba 100644
> > --- a/fs/btrfs/file.c
> > +++ b/fs/btrfs/file.c
> > @@ -1957,7 +1957,7 @@ static ssize_t btrfs_direct_write(struct kiocb *iocb, struct iov_iter *from)
> >       }
> >
> >       dio = __iomap_dio_rw(iocb, from, &btrfs_dio_iomap_ops, &btrfs_dio_ops,
> > -                          0);
> > +                          0, 0);
> >
> >       btrfs_inode_unlock(inode, ilock_flags);
> >
> > @@ -3658,7 +3658,8 @@ static ssize_t btrfs_direct_read(struct kiocb *iocb, struct iov_iter *to)
> >               return 0;
> >
> >       btrfs_inode_lock(inode, BTRFS_ILOCK_SHARED);
> > -     ret = iomap_dio_rw(iocb, to, &btrfs_dio_iomap_ops, &btrfs_dio_ops, 0);
> > +     ret = iomap_dio_rw(iocb, to, &btrfs_dio_iomap_ops, &btrfs_dio_ops,
> > +                        0, 0);
> >       btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
> >       return ret;
> >  }
> > diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> > index 9db829715652..16a41d0db55a 100644
> > --- a/fs/erofs/data.c
> > +++ b/fs/erofs/data.c
> > @@ -287,7 +287,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >
> >               if (!err)
> >                       return iomap_dio_rw(iocb, to, &erofs_iomap_ops,
> > -                                         NULL, 0);
> > +                                         NULL, 0, 0);
> >               if (err < 0)
> >                       return err;
> >       }
> > diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> > index ac0e11bbb445..b25c1f8f7c4f 100644
> > --- a/fs/ext4/file.c
> > +++ b/fs/ext4/file.c
> > @@ -74,7 +74,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >               return generic_file_read_iter(iocb, to);
> >       }
> >
> > -     ret = iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0);
> > +     ret = iomap_dio_rw(iocb, to, &ext4_iomap_ops, NULL, 0, 0);
> >       inode_unlock_shared(inode);
> >
> >       file_accessed(iocb->ki_filp);
> > @@ -566,7 +566,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >       if (ilock_shared)
> >               iomap_ops = &ext4_iomap_overwrite_ops;
> >       ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
> > -                        (unaligned_io || extend) ? IOMAP_DIO_FORCE_WAIT : 0);
> > +                        (unaligned_io || extend) ? IOMAP_DIO_FORCE_WAIT : 0,
> > +                        0);
> >       if (ret == -ENOTBLK)
> >               ret = 0;
> >
> > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > index b07b9c2d0446..ae06defcf369 100644
> > --- a/fs/gfs2/file.c
> > +++ b/fs/gfs2/file.c
> > @@ -822,7 +822,7 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
> >       if (ret)
> >               goto out_uninit;
> >
> > -     ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0);
> > +     ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0, 0);
> >       gfs2_glock_dq(gh);
> >  out_uninit:
> >       gfs2_holder_uninit(gh);
> > @@ -856,7 +856,7 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from,
> >       if (offset + len > i_size_read(&ip->i_inode))
> >               goto out;
> >
> > -     ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0);
> > +     ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL, 0, 0);
> >       if (ret == -ENOTBLK)
> >               ret = 0;
> >  out:
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index a434fb7887b2..fdf68339bc8b 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -31,6 +31,7 @@ struct iomap_dio {
> >       atomic_t                ref;
> >       unsigned                flags;
> >       int                     error;
> > +     size_t                  done_before;
>
> I have basically the same comment as last time[1]:
>
> "So, now that I actually understand the reason why the count of
> previously transferred bytes has to be passed into the iomap_dio, I
> would like this field to have a comment so that stupid maintainers like
> me don't forget the subtleties again:
>
>         /*
>          * For asynchronous IO, we have one chance to call the iocb
>          * completion method with the results of the directio operation.
>          * If this operation is a resubmission after a previous partial
>          * completion (e.g. page fault), we need to know about that
>          * progress so that we can report both the results of the prior
>          * completion and the result of the resubmission to the iocb
>          * submitter.
>          */
>         size_t                  done_before;
>
> With that added, I think I can live with this enough to:
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Indeed, sorry for missing that. How about the below change instead
though; I think that better sums up what's going on?

--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -454,6 +454,14 @@ static loff_t iomap_dio_iter(const struct iomap_iter *iter,
  * may be pure data writes. In that case, we still need to do a full data sync
  * completion.
  *
+ * When page faults are disabled, __iomap_dio_rw has already prepared some data
+ * to be transferred, @iter references a non-resident page, and @dio_flags
+ * includes IOMAP_DIO_PARTIAL, __iomap_dio_rw will return a partial result.  In
+ * that case, the page or pages can be faulted in and the request resumed with
+ * @done_before set to the number of bytes previously transferred.  The request
+ * will then complete with the correct total number of bytes transferred; this
+ * is essential for completing partial requests asynchronously.
+ *
  * Returns -ENOTBLK In case of a page invalidation invalidation failure for
  * writes.  The callers needs to fall back to buffered I/O in this case.
  */

Thanks,
Andreas

>
> --D
>
> [1] https://lore.kernel.org/linux-fsdevel/20210903185351.GD9892@magnolia/
>
> >       bool                    wait_for_completion;
> >
> >       union {
> > @@ -124,6 +125,9 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
> >       if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
> >               ret = generic_write_sync(iocb, ret);
> >
> > +     if (ret > 0)
> > +             ret += dio->done_before;
> > +
> >       kfree(dio);
> >
> >       return ret;
> > @@ -456,7 +460,7 @@ static loff_t iomap_dio_iter(const struct iomap_iter *iter,
> >  struct iomap_dio *
> >  __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >               const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> > -             unsigned int dio_flags)
> > +             unsigned int dio_flags, size_t done_before)
> >  {
> >       struct address_space *mapping = iocb->ki_filp->f_mapping;
> >       struct inode *inode = file_inode(iocb->ki_filp);
> > @@ -486,6 +490,7 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >       dio->dops = dops;
> >       dio->error = 0;
> >       dio->flags = 0;
> > +     dio->done_before = done_before;
> >
> >       dio->submit.iter = iter;
> >       dio->submit.waiter = current;
> > @@ -652,11 +657,11 @@ EXPORT_SYMBOL_GPL(__iomap_dio_rw);
> >  ssize_t
> >  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >               const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> > -             unsigned int dio_flags)
> > +             unsigned int dio_flags, size_t done_before)
> >  {
> >       struct iomap_dio *dio;
> >
> > -     dio = __iomap_dio_rw(iocb, iter, ops, dops, dio_flags);
> > +     dio = __iomap_dio_rw(iocb, iter, ops, dops, dio_flags, done_before);
> >       if (IS_ERR_OR_NULL(dio))
> >               return PTR_ERR_OR_ZERO(dio);
> >       return iomap_dio_complete(dio);
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 7aa943edfc02..240eb932c014 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -259,7 +259,7 @@ xfs_file_dio_read(
> >       ret = xfs_ilock_iocb(iocb, XFS_IOLOCK_SHARED);
> >       if (ret)
> >               return ret;
> > -     ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL, 0);
> > +     ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, NULL, 0, 0);
> >       xfs_iunlock(ip, XFS_IOLOCK_SHARED);
> >
> >       return ret;
> > @@ -569,7 +569,7 @@ xfs_file_dio_write_aligned(
> >       }
> >       trace_xfs_file_direct_write(iocb, from);
> >       ret = iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
> > -                        &xfs_dio_write_ops, 0);
> > +                        &xfs_dio_write_ops, 0, 0);
> >  out_unlock:
> >       if (iolock)
> >               xfs_iunlock(ip, iolock);
> > @@ -647,7 +647,7 @@ xfs_file_dio_write_unaligned(
> >
> >       trace_xfs_file_direct_write(iocb, from);
> >       ret = iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
> > -                        &xfs_dio_write_ops, flags);
> > +                        &xfs_dio_write_ops, flags, 0);
> >
> >       /*
> >        * Retry unaligned I/O with exclusive blocking semantics if the DIO
> > diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> > index ddc346a9df9b..6122c38ab44d 100644
> > --- a/fs/zonefs/super.c
> > +++ b/fs/zonefs/super.c
> > @@ -852,7 +852,7 @@ static ssize_t zonefs_file_dio_write(struct kiocb *iocb, struct iov_iter *from)
> >               ret = zonefs_file_dio_append(iocb, from);
> >       else
> >               ret = iomap_dio_rw(iocb, from, &zonefs_iomap_ops,
> > -                                &zonefs_write_dio_ops, 0);
> > +                                &zonefs_write_dio_ops, 0, 0);
> >       if (zi->i_ztype == ZONEFS_ZTYPE_SEQ &&
> >           (ret > 0 || ret == -EIOCBQUEUED)) {
> >               if (ret > 0)
> > @@ -987,7 +987,7 @@ static ssize_t zonefs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >               }
> >               file_accessed(iocb->ki_filp);
> >               ret = iomap_dio_rw(iocb, to, &zonefs_iomap_ops,
> > -                                &zonefs_read_dio_ops, 0);
> > +                                &zonefs_read_dio_ops, 0, 0);
> >       } else {
> >               ret = generic_file_read_iter(iocb, to);
> >               if (ret == -EIO)
> > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > index 2a213b0d1e1f..829f2325ecba 100644
> > --- a/include/linux/iomap.h
> > +++ b/include/linux/iomap.h
> > @@ -339,10 +339,10 @@ struct iomap_dio_ops {
> >
> >  ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >               const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> > -             unsigned int dio_flags);
> > +             unsigned int dio_flags, size_t done_before);
> >  struct iomap_dio *__iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> >               const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> > -             unsigned int dio_flags);
> > +             unsigned int dio_flags, size_t done_before);
> >  ssize_t iomap_dio_complete(struct iomap_dio *dio);
> >  int iomap_dio_iopoll(struct kiocb *kiocb, bool spin);
> >
> > --
> > 2.26.3
> >
>

