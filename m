Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E85E156844
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 14:07:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C83283082231;
	Wed, 26 Jun 2019 12:07:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A565D9C6;
	Wed, 26 Jun 2019 12:07:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92DD61806B16;
	Wed, 26 Jun 2019 12:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QC7OrW016081 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 08:07:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2480360143; Wed, 26 Jun 2019 12:07:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF1660141
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 12:07:21 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8ACD05944C
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 12:07:21 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id s197so918493oih.14
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 05:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VoKKEjXBM4cP1xpPyuSdYmutpS68XoPtYXXMUeOUHus=;
	b=WlVd3EFvj7MNfLIt13JT75eTba7Q/K4ShnmBFIl0K26Ez2JCu8R2NHjlCGHpYDW8nC
	wy5mxhGVVLHZNji4lH67UyfEjLWdu0qPS96BZvkCAdahkr3dpER0YQ68P0aYogi1DAR1
	UmECxrsvO47iOvFgA8zJoEKpK91Nt7LlNfRQcZfRmTCJNPlagGhihiNuFSIo0W/KsatA
	EbXOTa6Vs4y04APYKqCx5aXvri3VUZXVX8VEQLM2SlxUnIuiqkcc5QxHqLkf/9NvT1tM
	G0BnWl0GSyYU1Ys/lnw8NOxmiAU79c57aTrCsUCwq+gFC3kNzTZzL7UZNMJCc9rWEJSB
	DYwA==
X-Gm-Message-State: APjAAAXbwmtOz2mKPzxdM9RqrzVU0BDtIoeBHYRv/XJbVO5nsRA3Esa9
	1OmqCJMhoeKyAHg1H+HX5j44T7vGFhG4RltiO/ba0aOCqGrb4q9jqI1hiIkzwa8r+e5LuU21f/Q
	CiPLb9GgJ5cOWcWGEryWvqWUQYB+UP2BY37UyTw==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr1518201oif.147.1561550840976;
	Wed, 26 Jun 2019 05:07:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4QK5tcXZHs/HO9eHJu+gJ3v4dClKZMuGx+LHaemFAfCrtURTYBuEj6ikRj8Zb72meGE0sdW/8QMUAfVyN6M0=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr1518193oif.147.1561550840707;
	Wed, 26 Jun 2019 05:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190618144716.8133-1-agruenba@redhat.com>
	<20190624065408.GA3565@lst.de>
	<20190624182243.22447-1-agruenba@redhat.com>
	<20190625095707.GA1462@lst.de> <20190625105011.GA2602@lst.de>
	<20190625181329.3160-1-agruenba@redhat.com>
	<20190626060329.GA23666@lst.de>
In-Reply-To: <20190626060329.GA23666@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 26 Jun 2019 14:07:09 +0200
Message-ID: <CAHc6FU7bk-BtWreHTLgokVPTxvVCrMvdn1c1qwt+Z+z5nuUmSg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 26 Jun 2019 12:07:48 +0000 (UTC)

On Wed, 26 Jun 2019 at 08:04, Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Jun 25, 2019 at 08:13:29PM +0200, Andreas Gruenbacher wrote:
> > On Tue, 25 Jun 2019 at 12:50, Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > > That seems way more complicated.  I'd much rather go with something
> > > > like may patch plus maybe a big fat comment explaining that persisting
> > > > the size update is the file systems job.  Note that a lot of the modern
> > > > file systems don't use the VFS inode tracking for that, besides XFS
> > > > that includes at least btrfs and ocfs2 as well.
> > >
> > > I'd suggest something like this as the baseline:
> > >
> > > http://git.infradead.org/users/hch/xfs.git/shortlog/refs/heads/iomap-i_size
> >
> > Alright, can we change this as follows?
> >
> > [Also, I'm not really sure why we check for (pos + ret > inode->i_size)
> > when we have already read inode->i_size into old_size.]
>
> Yeah, you probably want to change that to old_size.  Your changes look
> good to me,
>
> Can you just take the patch over from here as you've clearly done more
> work on it and resend the whole series?

Ok, done. It's just the two patches; passes xfstests for xfs and gfs2,
the current users.

Darrick, can you please push this in the next merge window as "usual"?

Thanks,
Andreas

