Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 74DC13D660A
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:52:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-uAZfiIyVMf6A2phwImBXBQ-1; Mon, 26 Jul 2021 13:52:07 -0400
X-MC-Unique: uAZfiIyVMf6A2phwImBXBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6638799E0;
	Mon, 26 Jul 2021 17:52:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E97E710C4;
	Mon, 26 Jul 2021 17:52:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D71B518095C2;
	Mon, 26 Jul 2021 17:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHpJfK028941 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:51:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21B3A4C83C; Mon, 26 Jul 2021 17:51:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 180CA49C35
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:51:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A19D6101A52C
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:51:15 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-321-kaOCHxcwMzWe5xQP3d_Rsg-1; Mon, 26 Jul 2021 13:50:35 -0400
X-MC-Unique: kaOCHxcwMzWe5xQP3d_Rsg-1
Received: by mail-io1-f41.google.com with SMTP id r6so12939818ioj.8;
	Mon, 26 Jul 2021 10:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4wIaZbvL5v7hGiTdfNjMKfL2dbvhUT7p38wFt6cldfc=;
	b=RYy98yqSzcg/41pAC/RkxUZklPaKKBKBxM5QDe7q3FGPIFuXOqYun/kZXE2W/kqskO
	VeQxdzzAzz1pYZtfqvPMkPuvygCnStsQE/OBWn6cEXSTtGAEH1kW41jQMBipxP0/yPE7
	k9JFfpFHiT8XBt9pvYO1fwk4jnVyAo2cGeCRjEOVE0pmVy9ofY+gbo1UOorJR1OPKrw5
	fbZLUYnTJgP7M02hQw2LsWFbG6U1JMDueRkDq7Qk4Aiszy59SPdjGJGFzo2fmmbHJ1X1
	fEz3kR2rRCJHrU2ggZMSLNGqwrXV1fooQeJcHQcAZf7CGOaDlgSyOukSDTJfuUeeLr2Q
	mQVQ==
X-Gm-Message-State: AOAM533bStAbG5uWUS17/RIEHIdPT4iyLoQVA/pcrrPGxaviXc3ktrqb
	GuNoW3mG1/NQa19H8VycnijOxfUJaW4Yv/I3f/4=
X-Google-Smtp-Source: ABdhPJxJ/w8fZYt2WaXmNWNE8rNuGGfoW5+TMf+djruWRNbSbdyE/XK3mS9eyYkyf9NQoPnT7YwU9BMIejtf2VXE0lo=
X-Received: by 2002:a05:6638:240c:: with SMTP id
	z12mr17383142jat.41.1627321834539; 
	Mon, 26 Jul 2021 10:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-8-agruenba@redhat.com>
	<20210726170250.GL20621@quack2.suse.cz>
In-Reply-To: <20210726170250.GL20621@quack2.suse.cz>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Mon, 26 Jul 2021 19:50:23 +0200
Message-ID: <CAHpGcMLOZhZ7tGrY7rcYWUwx12sY884T=eC-Ckna63PBmF=zwA@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
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
Cc: cluster-devel <cluster-devel@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e2111505c80a63de"

--000000000000e2111505c80a63de
Content-Type: text/plain; charset="UTF-8"

Jan Kara <jack@suse.cz> schrieb am Mo., 26. Juli 2021, 19:10:

> On Fri 23-07-21 22:58:40, Andreas Gruenbacher wrote:
> > Also disable page faults during direct I/O requests and implement the
> same kind
> > of retry logic as in the buffered I/O case.
> >
> > Direct I/O requests differ from buffered I/O requests in that they use
> > bio_iov_iter_get_pages for grabbing page references and faulting in pages
> > instead of triggering real page faults.  Those manual page faults can be
> > disabled with the iocb->noio flag.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/gfs2/file.c | 34 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> > index f66ac7f56f6d..7986f3be69d2 100644
> > --- a/fs/gfs2/file.c
> > +++ b/fs/gfs2/file.c
> > @@ -782,21 +782,41 @@ static ssize_t gfs2_file_direct_read(struct kiocb
> *iocb, struct iov_iter *to,
> >       struct file *file = iocb->ki_filp;
> >       struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
> >       size_t count = iov_iter_count(to);
> > +     size_t written = 0;
> >       ssize_t ret;
> >
> > +     /*
> > +      * In this function, we disable page faults when we're holding the
> > +      * inode glock while doing I/O.  If a page fault occurs, we drop
> the
> > +      * inode glock, fault in the pages manually, and then we retry.
> Other
> > +      * than in gfs2_file_read_iter, iomap_dio_rw can trigger implicit
> as
> > +      * well as manual page faults, and we need to disable both kinds
> > +      * separately.
> > +      */
> > +
> >       if (!count)
> >               return 0; /* skip atime */
> >
> >       gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
> > +retry:
> >       ret = gfs2_glock_nq(gh);
> >       if (ret)
> >               goto out_uninit;
> >
> > +     pagefault_disable();
>
> Is there any use in pagefault_disable() here? iomap_dio_rw() should not
> trigger any page faults anyway, should it?
>

It can trigger physical page faults when reading from holes.

Andreas


>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
>

--000000000000e2111505c80a63de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Jan Kara &lt;<a href=3D"mailto:jack@suse.cz">jack@suse.cz</a>&=
gt; schrieb am Mo., 26. Juli 2021, 19:10:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Fri 23-07-21 22:58:40, Andreas Gruenbacher wrote:<br>
&gt; Also disable page faults during direct I/O requests and implement the =
same kind<br>
&gt; of retry logic as in the buffered I/O case.<br>
&gt; <br>
&gt; Direct I/O requests differ from buffered I/O requests in that they use=
<br>
&gt; bio_iov_iter_get_pages for grabbing page references and faulting in pa=
ges<br>
&gt; instead of triggering real page faults.=C2=A0 Those manual page faults=
 can be<br>
&gt; disabled with the iocb-&gt;noio flag.<br>
&gt; <br>
&gt; Signed-off-by: Andreas Gruenbacher &lt;<a href=3D"mailto:agruenba@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">agruenba@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 fs/gfs2/file.c | 34 +++++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 33 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c<br>
&gt; index f66ac7f56f6d..7986f3be69d2 100644<br>
&gt; --- a/fs/gfs2/file.c<br>
&gt; +++ b/fs/gfs2/file.c<br>
&gt; @@ -782,21 +782,41 @@ static ssize_t gfs2_file_direct_read(struct kioc=
b *iocb, struct iov_iter *to,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct file *file =3D iocb-&gt;ki_filp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gfs2_inode *ip =3D GFS2_I(file-&gt;f_=
mapping-&gt;host);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count =3D iov_iter_count(to);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t written =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * In this function, we disable page faults when =
we&#39;re holding the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * inode glock while doing I/O.=C2=A0 If a page f=
ault occurs, we drop the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * inode glock, fault in the pages manually, and =
then we retry.=C2=A0 Other<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * than in gfs2_file_read_iter, iomap_dio_rw can =
trigger implicit as<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * well as manual page faults, and we need to dis=
able both kinds<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * separately.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!count)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; /* ski=
p atime */<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gfs2_holder_init(ip-&gt;i_gl, LM_ST_DEFERRED=
, 0, gh);<br>
&gt; +retry:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gfs2_glock_nq(gh);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_uninit;=
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0pagefault_disable();<br>
<br>
Is there any use in pagefault_disable() here? iomap_dio_rw() should not<br>
trigger any page faults anyway, should it?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">It can trigger physical page faul=
ts when reading from holes.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Andreas</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Honza<br>
-- <br>
Jan Kara &lt;<a href=3D"mailto:jack@suse.com" target=3D"_blank" rel=3D"nore=
ferrer">jack@suse.com</a>&gt;<br>
SUSE Labs, CR<br>
</blockquote></div></div></div>

--000000000000e2111505c80a63de--

