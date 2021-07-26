Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC973D65F7
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-MGMrop_OP32FoevkUNen_A-1; Mon, 26 Jul 2021 13:46:56 -0400
X-MC-Unique: MGMrop_OP32FoevkUNen_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761548799EB;
	Mon, 26 Jul 2021 17:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F7B27063;
	Mon, 26 Jul 2021 17:46:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 275CA4BB7B;
	Mon, 26 Jul 2021 17:46:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHjnRJ028228 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:45:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE0F47CEF; Mon, 26 Jul 2021 17:45:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97E0849C35
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:45:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF15D800159
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:45:45 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-308-lNNh7pTvMl2aUlD2A896Tw-1; Mon, 26 Jul 2021 13:45:34 -0400
X-MC-Unique: lNNh7pTvMl2aUlD2A896Tw-1
Received: by mail-io1-f48.google.com with SMTP id y9so12953194iox.2;
	Mon, 26 Jul 2021 10:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RXwSnNIQEZmueDh7Hmo0XVa2LB3w/lJjS0RH0OP9oKU=;
	b=MiECKtY33rsKle+lbL36MloHbp/73wlsM5OG9cTIXfih80kJRbFTKPea6SYu5ffWa0
	jqUs65/Jj7yTutZBmAVX+r2muY8XZklCDv/o2EQmTCMyGmrANrTPo+Vt0mjZQWZ+ZltO
	qdRB+lBZCdOf7agx5ylcCjheChHZE2eCNMViSGYPSdG9OYCGoBgksTtIJqUCBJENY1MT
	mK993pDUVCg9tT8RhzA7zxc8ovS09J/0Y/HJL7bUCGh7k9cC5tBy3Fo+uwT4tXoE7CvJ
	3ph7SVbY2cfDj/SYeXSujSGOeeF26ZNMjegWKRRQV/QIECHexk/VpQNqI2UBwzW+vEFN
	wePA==
X-Gm-Message-State: AOAM530cV2plgEOjgUvtl7fFeiYjMt7s9bud7cNqNBqb3A/Xhy/0p20c
	3CT6ZDRgZwOJuEBBcep1p8w0xVBl+UhAyIcg3OM=
X-Google-Smtp-Source: ABdhPJz8IoohoapCzTkhjbgN/BUi7JeDolcjB7YBaQfSsACTm0uPZpTNt0o6HSskIOcBuaayDUEcJTzlWZkroUqRut4=
X-Received: by 2002:a05:6638:34aa:: with SMTP id
	t42mr17600011jal.128.1627321533430; 
	Mon, 26 Jul 2021 10:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-6-agruenba@redhat.com>
	<20210726171940.GM20621@quack2.suse.cz>
In-Reply-To: <20210726171940.GM20621@quack2.suse.cz>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Mon, 26 Jul 2021 19:45:22 +0200
Message-ID: <CAHpGcMLtQ1=WOT1mTUS4=iWBwHLQ-EBzY=+XuSGJfu4gVPYTLw@mail.gmail.com>
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
Subject: Re: [Cluster-devel] [PATCH v3 5/7] iomap: Support restarting direct
 I/O requests after user copy failures
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
Content-Type: multipart/alternative; boundary="000000000000ef7d3405c80a51a4"

--000000000000ef7d3405c80a51a4
Content-Type: text/plain; charset="UTF-8"

Jan Kara <jack@suse.cz> schrieb am Mo., 26. Juli 2021, 19:21:

> On Fri 23-07-21 22:58:38, Andreas Gruenbacher wrote:
> > In __iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete
> the
> > request synchronously and reset the iterator to the start position.  This
> > allows callers to deal with the failure and retry the operation.
> >
> > In gfs2, we need to disable page faults while we're holding glocks to
> prevent
> > deadlocks.  This patch is the minimum solution I could find to make
> > iomap_dio_rw work with page faults disabled.  It's still expensive
> because any
> > I/O that was carried out before hitting -EFAULT needs to be retried.
> >
> > A possible improvement would be to add an IOMAP_DIO_FAULT_RETRY or
> similar flag
> > that would allow iomap_dio_rw to return a short result when hitting
> -EFAULT.
> > Callers could then retry only the rest of the request after dealing with
> the
> > page fault.
> >
> > Asynchronous requests turn into synchronous requests up to the point of
> the
> > page fault in any case, but they could be retried asynchronously after
> dealing
> > with the page fault.  To make that work, the completion notification
> would have
> > to include the bytes read or written before the page fault(s) as well,
> and we'd
> > need an additional iomap_dio_rw argument for that.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/iomap/direct-io.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index cc0b4bc8861b..b0a494211bb4 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -561,6 +561,15 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter
> *iter,
> >               ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
> >                               iomap_dio_actor);
> >               if (ret <= 0) {
> > +                     if (ret == -EFAULT) {
> > +                             /*
> > +                              * To allow retrying the request, fail
> > +                              * synchronously and reset the iterator.
> > +                              */
> > +                             wait_for_completion = true;
> > +                             iov_iter_revert(dio->submit.iter,
> dio->size);
> > +                     }
> > +
>
> Hum, OK, but this means that if userspace submits large enough write, GFS2
> will livelock trying to complete it? While other filesystems can just
> submit multiple smaller bios constructed in iomap_apply() (paging in
> different parts of the buffer) and thus complete the write?
>

No. First, this affects reads but not writes. We cannot just blindly repeat
writes; when a page fault occurs in the middle of a write, the result will
be a short write. For reads, the plan is to ads a flag to allow
iomap_dio_rw to return a partial result when a page fault occurs.
(Currently, it fails the entire request.) Then we can handle the page fault
and complete the rest of the request.

The changes needed for that are simple on the iomap side, but we need to go
through some gymnastics for handling the page fault without giving up the
glock in the non-contended case. There will still be the potential for
losing the lock and having to re-acquire it, in which case we'll actually
have to repeat the entire read.

Thanks,
Andreas

                                                                Honza
>
> >                       /* magic error code to fall back to buffered I/O */
> >                       if (ret == -ENOTBLK) {
> >                               wait_for_completion = true;
> > --
> > 2.26.3
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
>

--000000000000ef7d3405c80a51a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Jan Kara &lt;<a href=3D"mailto:jack@suse.cz">jack@suse.cz</a>&=
gt; schrieb am Mo., 26. Juli 2021, 19:21:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Fri 23-07-21 22:58:38, Andreas Gruenbacher wrote:<br>
&gt; In __iomap_dio_rw, when iomap_apply returns an -EFAULT error, complete=
 the<br>
&gt; request synchronously and reset the iterator to the start position.=C2=
=A0 This<br>
&gt; allows callers to deal with the failure and retry the operation.<br>
&gt; <br>
&gt; In gfs2, we need to disable page faults while we&#39;re holding glocks=
 to prevent<br>
&gt; deadlocks.=C2=A0 This patch is the minimum solution I could find to ma=
ke<br>
&gt; iomap_dio_rw work with page faults disabled.=C2=A0 It&#39;s still expe=
nsive because any<br>
&gt; I/O that was carried out before hitting -EFAULT needs to be retried.<b=
r>
&gt; <br>
&gt; A possible improvement would be to add an IOMAP_DIO_FAULT_RETRY or sim=
ilar flag<br>
&gt; that would allow iomap_dio_rw to return a short result when hitting -E=
FAULT.<br>
&gt; Callers could then retry only the rest of the request after dealing wi=
th the<br>
&gt; page fault.<br>
&gt; <br>
&gt; Asynchronous requests turn into synchronous requests up to the point o=
f the<br>
&gt; page fault in any case, but they could be retried asynchronously after=
 dealing<br>
&gt; with the page fault.=C2=A0 To make that work, the completion notificat=
ion would have<br>
&gt; to include the bytes read or written before the page fault(s) as well,=
 and we&#39;d<br>
&gt; need an additional iomap_dio_rw argument for that.<br>
&gt; <br>
&gt; Signed-off-by: Andreas Gruenbacher &lt;<a href=3D"mailto:agruenba@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">agruenba@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 fs/iomap/direct-io.c | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c<br>
&gt; index cc0b4bc8861b..b0a494211bb4 100644<br>
&gt; --- a/fs/iomap/direct-io.c<br>
&gt; +++ b/fs/iomap/direct-io.c<br>
&gt; @@ -561,6 +561,15 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_ite=
r *iter,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D iomap_ap=
ply(inode, pos, count, iomap_flags, ops, dio,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iomap_dio_actor);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt;=3D =
0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret =3D=3D -EFAULT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * To allow retrying the request, fail<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * synchronously and reset the iterator.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_for_completion =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov_iter_revert(dio-&gt;submit.iter, dio=
-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
<br>
Hum, OK, but this means that if userspace submits large enough write, GFS2<=
br>
will livelock trying to complete it? While other filesystems can just<br>
submit multiple smaller bios constructed in iomap_apply() (paging in<br>
different parts of the buffer) and thus complete the write?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No. First, this =
affects reads but not writes. We cannot just blindly repeat writes; when a =
page fault occurs in the middle of a write, the result will be a short writ=
e. For reads, the plan is to ads a flag to allow iomap_dio_rw to return a p=
artial result when a page fault occurs. (Currently, it fails the entire req=
uest.) Then we can handle the page fault and complete the rest of the reque=
st.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The changes needed f=
or that are simple on the iomap side, but we need to go through some gymnas=
tics for handling the page fault without giving up the glock in the non-con=
tended case. There will still be the potential for losing the lock and havi=
ng to re-acquire it, in which case we&#39;ll actually have to repeat the en=
tire read.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div>=
<div dir=3D"auto">Andreas</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Honza<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* magic error code to fall back to buffered I/O */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (ret =3D=3D -ENOTBLK) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_for_completion =3D true;<br>
&gt; -- <br>
&gt; 2.26.3<br>
&gt; <br>
-- <br>
Jan Kara &lt;<a href=3D"mailto:jack@suse.com" target=3D"_blank" rel=3D"nore=
ferrer">jack@suse.com</a>&gt;<br>
SUSE Labs, CR<br>
</blockquote></div></div></div>

--000000000000ef7d3405c80a51a4--

